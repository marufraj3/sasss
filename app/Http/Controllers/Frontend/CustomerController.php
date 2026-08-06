<?php

namespace App\Http\Controllers\Frontend;
use shurjopayv2\ShurjopayLaravelPackage8\Http\Controllers\ShurjopayController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\Facades\Image;
use App\Models\Customer;
use App\Models\District;
use App\Models\Order;
use App\Models\ShippingCharge;
use App\Models\OrderDetails;
use App\Models\Payment;
use App\Models\Shipping;
use App\Models\Review;
use App\Models\PaymentGateway;
use App\Models\SmsGateway;
use App\Models\GeneralSetting;
use App\Models\Product;
use App\Models\OrderStatus;
use App\Models\Coupon;
use App\Models\Wishlist;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Session;
use Hash;
use Auth;
use Cart;
use Mail;
use Str;
use DB;

class CustomerController extends Controller
{
    function __construct()
    {
        $this->middleware('customer', ['except' => ['register','store','verify','resendotp','account_verify','login','signin','logout','checkout','forgot_password','forgot_verify','forgot_reset','forgot_store','forgot_resend','order_save','order_success','order_track','order_track_result','apply_coupon','remove_coupon']]);
    }

    public function review(Request $request){
        $this->validate($request,[
            'ratting'=>'required',
            'review'=>'required',
        ]);

        // data save
        $review              =   new Review();
        $review->name        =   Auth::guard('customer')->user()->name ? Auth::guard('customer')->user()->name : 'N / A';
        $review->email       =   Auth::guard('customer')->user()->email ? Auth::guard('customer')->user()->email : 'N / A';
        $review->product_id  =   $request->product_id;
        $review->review      =   $request->review;
        $review->ratting     =   $request->ratting;
        $review->customer_id =   Auth::guard('customer')->user()->id;
        $review->status      =   'pending';
        $review->save();

        Toastr::success('Thanks, Your review send successfully', 'Success!');
        return redirect()->back();
    }

    public function login(){
        return view('frontEnd.layouts.customer.login');
    }
    
    public function signin(Request $request){
        $auth_check = Customer::where('phone',$request->phone)->first();
        if($auth_check){
            if (Auth::guard('customer')->attempt(['phone' => $request->phone, 'password' => $request->password])) {
                Toastr::success('You are login successfully', 'success!');
                if(Cart::instance('shopping')->count() > 0){
                    return redirect()->route('customer.checkout');
                }
                return redirect()->intended('customer/account');
            }
            Toastr::error('message', 'Opps! your phone or password wrong');
            return redirect()->back();
        }else{
            Toastr::error('message', 'Sorry! You have no account');
            return redirect()->back();
        }
    }
    
    public function register(){
        return view('frontEnd.layouts.customer.register');
    }
    
    public function store(Request $request){
        $this->validate($request, [
            'name'    => 'required',
            'phone'    => 'required|unique:customers',
            'password' => 'required|min:6'
        ]);

        $last_id = Customer::orderBy('id', 'desc')->first();
        $last_id = $last_id?$last_id->id+1:1;
        $store              = new Customer();
        $store->name        = $request->name;
        $store->slug        = strtolower(Str::slug($request->name.'-'.$last_id));
        $store->phone       = $request->phone;
        $store->email       = $request->email;
        $store->password    = bcrypt($request->password);
        $store->verify      = 1;
        $store->status      = 'active';
        $store->save();
        
        Toastr::success('Success','Account Create Successfully');
        return redirect()->route('customer.login');
    }
    public function verify(){
        return view('frontEnd.layouts.customer.verify');
    }
    public function resendotp(Request $request){
        $customer_info = Customer::where('phone',session::get('verify_phone'))->first();
        $customer_info->verify = rand(1111,9999);
        $customer_info->save();
        $site_setting = GeneralSetting::where('status', 1)->first();
        $sms_gateway = SmsGateway::where('status', 1)->first();
        if($sms_gateway) {
            $url = "$sms_gateway->url";
            $data = [
                "api_key" => "$sms_gateway->api_key",
                "contacts" => $customer_info->phone,
                "type" => 'text',
                "senderid" => "$sms_gateway->serderid",
                "msg" => "Dear $customer_info->name!\r\nYour account verify OTP is $customer_info->verify \r\nThank you for using $site_setting->name"
            ];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            curl_close($ch);
            
        }
        Toastr::success('Success','Resend code send successfully');
        return redirect()->back();
    }
    public function account_verify(Request $request){
        $this->validate($request,[
            'otp' => 'required',
        ]);
        $customer_info = Customer::where('phone',session::get('verify_phone'))->first();
        if($customer_info->verify != $request->otp){
            Toastr::error('Success','Your OTP not match');
            return redirect()->back();
        }

        $customer_info->verify = 1;
        $customer_info->status = 'active';
        $customer_info->save();
        Auth::guard('customer')->loginUsingId($customer_info->id);
        return redirect()->route('customer.account');
    }
    public function forgot_password(){
        return view('frontEnd.layouts.customer.forgot_password');
    }
    
    public function forgot_verify(Request $request){
        $customer_info = Customer::where('phone',$request->phone)->first();
        if(!$customer_info){
            Toastr::error('Your phone number not found');
            return back();
        }
        $customer_info->forgot = rand(1111,9999);
        $customer_info->save();
        $site_setting = GeneralSetting::where('status', 1)->first();
        $sms_gateway = SmsGateway::where(['status'=> 1, 'forget_pass'=>1])->first();
        if($sms_gateway) {
            $url = "$sms_gateway->url";
            $data = [
                "api_key" => "$sms_gateway->api_key",
                "contacts" => $customer_info->phone,
                "type" => 'text',
                "senderid" => "$sms_gateway->serderid",
                "msg" => "Dear $customer_info->name!\r\nYour forgot password verify OTP is $customer_info->forgot \r\nThank you for using $site_setting->name"
            ];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            curl_close($ch);
        }
        
        session::put('verify_phone',$request->phone);
        Toastr::success('Your account register successfully');
        return redirect()->route('customer.forgot.reset');
    }
    
    public function forgot_resend(Request $request){
        $customer_info = Customer::where('phone',session::get('verify_phone'))->first();
        $customer_info->forgot = rand(1111,9999);
        $customer_info->save();
        $site_setting = GeneralSetting::where('status', 1)->first();
        $sms_gateway = SmsGateway::where(['status'=> 1])->first();
        if($sms_gateway) {
            $url = "$sms_gateway->url";
            $data = [
                "api_key" => "$sms_gateway->api_key",
                "contacts" => $customer_info->phone,
                "type" => 'text',
                "senderid" => "$sms_gateway->serderid",
                "msg" => "Dear $customer_info->name!\r\nYour forgot password verify OTP is $customer_info->forgot \r\nThank you for using $site_setting->name"
            ];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            curl_close($ch);
            
        }

        Toastr::success('Success','Resend code send successfully');
        return redirect()->back();
    }
    public function forgot_reset(){
        if(!Session::get('verify_phone')){
          Toastr::error('Something wrong please try again');
          return redirect()->route('customer.forgot.password'); 
        };
        return view('frontEnd.layouts.customer.forgot_reset');
    }
    public function forgot_store(Request $request){

        $customer_info = Customer::where('phone',session::get('verify_phone'))->first();

        if($customer_info->forgot != $request->otp){
            Toastr::error('Success','Your OTP not match');
            return redirect()->back();
        }

        $customer_info->forgot = 1;
        $customer_info->password = bcrypt($request->password);
        $customer_info->save();
        if(Auth::guard('customer')->attempt(['phone' => $customer_info->phone, 'password' => $request->password])) {
            Session::forget('verify_phone');
            Toastr::success('You are login successfully', 'success!');
                return redirect()->intended('customer/account');
        }
    }
    public function account(){
        return view('frontEnd.layouts.customer.account');
    }

    public function wishlists()
    {
        $wishlists = Wishlist::where('customer_id', Auth::guard('customer')->id())
            ->with(['product.image'])
            ->latest()
            ->paginate(20);

        return view('frontEnd.layouts.customer.wishlists', compact('wishlists'));
    }

    public function wishlist_store(Request $request)
    {
        $data = $request->validate(['product_id' => ['required', 'integer', 'exists:products,id']]);
        $product = Product::where(['id' => $data['product_id'], 'status' => 1])->firstOrFail();
        Wishlist::firstOrCreate(['customer_id' => Auth::guard('customer')->id(), 'product_id' => $product->id]);

        return back()->with('success', 'পণ্যটি আপনার wishlist-এ যোগ করা হয়েছে।');
    }

    public function wishlist_destroy(Wishlist $wishlist)
    {
        abort_unless($wishlist->customer_id === Auth::guard('customer')->id(), 403);
        $wishlist->delete();
        return back()->with('success', 'পণ্যটি wishlist থেকে সরানো হয়েছে।');
    }

    public function logout(Request $request){
        Auth::guard('customer')->logout();
        Toastr::success('You are logout successfully', 'success!');
        return redirect()->route('customer.login');
    }
    public function apply_coupon(Request $request)
    {
        if (Cart::instance('shopping')->count() <= 0) {
            return back()->withErrors(['coupon' => 'কার্ট খালি থাকলে coupon ব্যবহার করা যাবে না।']);
        }

        $data = $request->validate(['code' => ['required', 'string', 'max:60']]);
        $subtotal = (int) round(Cart::instance('shopping')->content()->sum(fn ($item) => $item->price * $item->qty));
        $coupon = Coupon::where('code', Str::upper(trim($data['code'])))->first();

        if (! $coupon || ! $coupon->isAvailableFor($subtotal)) {
            Session::forget(['coupon', 'discount']);
            return back()->withErrors(['coupon' => 'এই coupon টি এখন ব্যবহারযোগ্য নয় অথবা আপনার cart-এর ন্যূনতম মূল্য পূরণ হয়নি।']);
        }

        $discount = $coupon->discountFor($subtotal);
        Session::put('coupon', ['id' => $coupon->id, 'code' => $coupon->code]);
        Session::put('discount', $discount);

        return back()->with('success', "Coupon applied! আপনি ৳{$discount} সাশ্রয় করছেন।");
    }

    public function remove_coupon()
    {
        Session::forget(['coupon', 'discount']);
        return back()->with('success', 'Coupon removed.');
    }

    public function checkout()
    {
        if (Cart::instance('shopping')->count() <= 0) {
            Toastr::error('Your shopping cart is empty.', 'Cart is empty');
            return redirect()->route('home');
        }

        $subtotal = (int) round(Cart::instance('shopping')->content()->sum(fn ($item) => $item->price * $item->qty));
        if ($couponId = data_get(Session::get('coupon'), 'id')) {
            $coupon = Coupon::find($couponId);
            if ($coupon && $coupon->isAvailableFor($subtotal)) {
                Session::put('discount', $coupon->discountFor($subtotal));
            } else {
                Session::forget(['coupon', 'discount']);
            }
        }

        $shippingcharge = ShippingCharge::where('status', 1)->orderBy('amount')->get();
        $select_charge = $shippingcharge->first();
        Session::put('shipping', optional($select_charge)->amount ?? 0);

        $bkash_gateway = PaymentGateway::where(['status' => 1, 'type' => 'bkash'])->first();
        $shurjopay_gateway = PaymentGateway::where(['status' => 1, 'type' => 'shurjopay'])->first();

        return view('frontEnd.layouts.customer.checkout', compact('shippingcharge', 'bkash_gateway', 'shurjopay_gateway'));
    }

    public function order_save(Request $request)
    {
        if (Cart::instance('shopping')->count() <= 0) {
            Toastr::error('Your shopping cart is empty.', 'Cart is empty');
            return redirect()->route('home');
        }

        $paymentMethods = ['Cash On Delivery'];
        if (PaymentGateway::where(['status' => 1, 'type' => 'bkash'])->exists()) {
            $paymentMethods[] = 'bkash';
        }
        if (PaymentGateway::where(['status' => 1, 'type' => 'shurjopay'])->exists()) {
            $paymentMethods[] = 'shurjopay';
        }

        $data = $request->validate([
            'name' => ['required', 'string', 'max:155'],
            'phone' => ['required', 'string', 'min:10', 'max:20'],
            'address' => ['required', 'string', 'max:255'],
            'area' => ['required', 'integer', Rule::exists('shipping_charges', 'id')->where('status', 1)],
            'note' => ['nullable', 'string', 'max:1000'],
            'payment_method' => ['required', Rule::in($paymentMethods)],
        ]);

        $cartItems = Cart::instance('shopping')->content();
        $shippingArea = ShippingCharge::where(['id' => $data['area'], 'status' => 1])->firstOrFail();
        $subtotal = (int) round($cartItems->sum(fn ($item) => $item->price * $item->qty));
        $discount = min(max(0, (int) Session::get('discount', 0)), $subtotal);
        $couponCode = data_get(Session::get('coupon'), 'code');
        $shippingFee = (int) $shippingArea->amount;

        try {
            $order = DB::transaction(function () use ($data, $cartItems, $subtotal, &$discount, $couponCode, $shippingFee, $shippingArea) {
                // Lock coupon usage as well as stock so a limited-use code cannot be oversold.
                if ($couponCode) {
                    $coupon = Coupon::where('code', $couponCode)->lockForUpdate()->first();
                    if (! $coupon || ! $coupon->isAvailableFor($subtotal)) {
                        throw ValidationException::withMessages(['coupon' => 'এই coupon টি আর ব্যবহারযোগ্য নয়। আবার চেষ্টা করুন।']);
                    }
                    $discount = $coupon->discountFor($subtotal);
                    $coupon->increment('usage_count');
                } else {
                    $discount = 0;
                }

                // Re-check and reserve inventory inside the transaction to prevent overselling.
                foreach ($cartItems as $item) {
                    $product = Product::where('id', $item->id)->lockForUpdate()->first();
                    if (! $product || ! $product->status || $product->stock < $item->qty) {
                        throw ValidationException::withMessages([
                            'cart' => "{$item->name} is no longer available in the requested quantity.",
                        ]);
                    }
                    $product->decrement('stock', $item->qty);
                }

                $customer = Auth::guard('customer')->user();
                if (! $customer) {
                    $customer = Customer::where('phone', $data['phone'])->first();
                    if (! $customer) {
                        $customer = new Customer();
                        $customer->name = $data['name'];
                        $customer->slug = Str::slug($data['name']) . '-' . Str::random(6);
                        $customer->phone = $data['phone'];
                        $customer->password = Hash::make(Str::random(20));
                        $customer->verify = 1;
                        $customer->status = 'active';
                        $customer->save();
                    }
                }

                $pendingStatus = OrderStatus::where('slug', 'pending')->value('id') ?? 1;
                $order = new Order();
                $order->invoice_id = $this->newInvoiceId();
                $order->amount = $subtotal + $shippingFee - $discount;
                $order->discount = $discount;
                $order->shipping_charge = $shippingFee;
                $order->customer_id = $customer->id;
                $order->order_status = $pendingStatus;
                $order->note = $data['note'] ?? null;
                $order->save();

                $shipping = new Shipping();
                $shipping->order_id = $order->id;
                $shipping->customer_id = $customer->id;
                $shipping->name = $data['name'];
                $shipping->phone = $data['phone'];
                $shipping->address = $data['address'];
                $shipping->area = $shippingArea->name;
                $shipping->save();

                $payment = new Payment();
                $payment->order_id = $order->id;
                $payment->customer_id = $customer->id;
                $payment->payment_method = $data['payment_method'];
                $payment->amount = $order->amount;
                $payment->payment_status = 'pending';
                $payment->save();

                foreach ($cartItems as $item) {
                    $detail = new OrderDetails();
                    $detail->order_id = $order->id;
                    $detail->product_id = $item->id;
                    $detail->product_name = $item->name;
                    $detail->purchase_price = data_get($item, 'options.purchase_price');
                    $detail->product_color = data_get($item, 'options.product_color');
                    $detail->product_size = data_get($item, 'options.product_size');
                    $detail->sale_price = $item->price;
                    $detail->qty = $item->qty;
                    $detail->save();
                }

                return $order;
            });
        } catch (ValidationException $exception) {
            throw $exception;
        }

        Cart::instance('shopping')->destroy();
        Session::forget(['shipping', 'discount']);
        $this->sendOrderConfirmationSms($data['name'], $data['phone']);

        Toastr::success('Thanks, your order has been placed successfully.', 'Success!');

        if ($data['payment_method'] === 'bkash') {
            return redirect('/bkash/checkout-url/create?order_id=' . $order->id);
        }
        if ($data['payment_method'] === 'shurjopay') {
            $info = [
                'currency' => 'BDT', 'amount' => $order->amount, 'order_id' => uniqid(),
                'discsount_amount' => 0, 'disc_percent' => 0, 'client_ip' => $request->ip(),
                'customer_name' => $data['name'], 'customer_phone' => $data['phone'],
                'email' => 'customer@example.com', 'customer_address' => $data['address'],
                'customer_city' => $shippingArea->name, 'customer_state' => $shippingArea->name,
                'customer_postcode' => '1212', 'customer_country' => 'BD', 'value1' => $order->id,
            ];
            return (new ShurjopayController())->checkout($info);
        }

        return redirect()->route('customer.order_success', $order->id);
    }

    private function newInvoiceId(): string
    {
        do {
            $invoice = 'ORD-' . now()->format('ymdHis') . '-' . random_int(100, 999);
        } while (Order::where('invoice_id', $invoice)->exists());

        return $invoice;
    }

    private function sendOrderConfirmationSms(string $name, string $phone): void
    {
        $gateway = SmsGateway::where(['status' => 1, 'order' => '1'])->first();
        $siteName = optional(GeneralSetting::where('status', 1)->first())->name ?? config('app.name');
        if (! $gateway || ! $gateway->url) {
            return;
        }

        try {
            $client = curl_init();
            curl_setopt_array($client, [
                CURLOPT_URL => $gateway->url,
                CURLOPT_POST => true,
                CURLOPT_POSTFIELDS => ['api_key' => $gateway->api_key, 'contacts' => $phone, 'type' => 'text', 'senderid' => $gateway->serderid, 'msg' => "Dear {$name}, your order has been placed successfully. Thank you for shopping with {$siteName}."],
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_TIMEOUT => 10,
                CURLOPT_SSL_VERIFYPEER => true,
            ]);
            curl_exec($client);
            curl_close($client);
        } catch (\Throwable $exception) {
            report($exception);
        }
    }

    public function orders()
    {
        $orders = Order::where('customer_id',Auth::guard('customer')->user()->id)->with('status')->latest()->get();
        return view('frontEnd.layouts.customer.orders',compact('orders'));
    }
    public function order_success($id) {
        $order = Order::where('id',$id)->firstOrFail();
        return view('frontEnd.layouts.customer.order_success',compact('order'));
    }
    public function invoice(Request $request)
    {
        $order = Order::where(['id'=>$request->id,'customer_id'=>Auth::guard('customer')->user()->id])->with('orderdetails','payment','shipping','customer')->firstOrFail();
        return view('frontEnd.layouts.customer.invoice',compact('order'));
    } 
    public function order_note(Request $request)
    {
        $order = Order::where(['id'=>$request->id,'customer_id'=>Auth::guard('customer')->user()->id])->firstOrFail();
        return view('frontEnd.layouts.customer.order_note',compact('order'));
    }
    public function profile_edit(Request $request)
    {
        $profile_edit = Customer::where(['id'=>Auth::guard('customer')->user()->id])->firstOrFail();
        $districts = District::distinct()->select('district')->get();
        $areas = District::where(['district'=>$profile_edit->district])->select('area_name','id')->get();
        return view('frontEnd.layouts.customer.profile_edit',compact('profile_edit','districts','areas'));
    }
    public function profile_update(Request $request)
    {
        $update_data = Customer::where(['id'=>Auth::guard('customer')->user()->id])->firstOrFail();

        $image = $request->file('image');
        if($image){
            // image with intervention 
            $name =  time().'-'.$image->getClientOriginalName();
            $name = preg_replace('"\.(jpg|jpeg|png|webp)$"', '.webp',$name);
            $name = strtolower(Str::slug($name));
            $uploadpath = 'public/uploads/customer/';
            $imageUrl = $uploadpath.$name; 
            $img = Image::make($image->getRealPath());
            $img->encode('webp', 90);
            $width = 120;
            $height = 120;
            $img->resize($width, $height);
            $img->save($imageUrl);
        }else{
            $imageUrl = $update_data->image;
        }

        $update_data->name        =   $request->name;
        $update_data->phone       =   $request->phone;
        $update_data->email       =   $request->email;
        $update_data->address     =   $request->address;
        $update_data->district    =   $request->district;
        $update_data->area        =   $request->area;
        $update_data->image       =   $imageUrl;
        $update_data->save();

        Toastr::success('Your profile update successfully', 'Success!');
       return redirect()->route('customer.account');
    }

    public function order_track(){
        return view('frontEnd.layouts.customer.order_track');
    }

     public function order_track_result(Request $request){
       
       $phone = $request->phone;
       $invoice_id = $request->invoice_id;
           
       if($phone !=null && $invoice_id==null){
        $order = DB::table('orders')
        ->join('shippings','orders.id','=','shippings.order_id')
        ->where(['shippings.phone' => $request->phone])
        ->get();
        
       }else if($invoice_id && $phone){
         $order = DB::table('orders')
        ->join('shippings','orders.id','=','shippings.order_id')
        ->where(['orders.invoice_id' => $request->invoice_id, 'shippings.phone'=>$request->phone])
        ->get();
       }
        
       if($order->count() == 0){
           
            Toastr::error('message', 'Something Went Wrong !');
            return redirect()->back();
       }
       
    //   return $order->count();
        
        
        
        return view('frontEnd.layouts.customer.tracking_result',compact('order'));
    }


    public function change_pass(){
        return view('frontEnd.layouts.customer.change_password');
    }

     public function password_update(Request $request)
    {
        $this->validate($request, [
            'old_password'=>'required',
            'new_password'=>'required',
            'confirm_password' => 'required_with:new_password|same:new_password|'
        ]);

        $customer = Customer::find(Auth::guard('customer')->user()->id);
        $hashPass = $customer->password;

        if (Hash::check($request->old_password, $hashPass)) {

            $customer->fill([
                'password' => Hash::make($request->new_password)
            ])->save();

            Toastr::success('Success', 'Password changed successfully!');
            return redirect()->route('customer.account');
        }else{
            Toastr::error('Failed', 'Old password not match!');
            return redirect()->back();
        }
    }
}
