<?php

namespace App\Http\Controllers\Frontend;

use shurjopayv2\ShurjopayLaravelPackage8\Http\Controllers\ShurjopayController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Models\Category;
use App\Models\Subcategory;
use App\Models\Childcategory;
use App\Models\Product;
use App\Models\District;
use App\Models\CreatePage;
use App\Models\Campaign;
use App\Models\Banner;
use App\Models\ShippingCharge;
use App\Models\Productcolor;
use App\Models\Productsize;
use App\Models\Customer;
use App\Models\OrderDetails;
use App\Models\Payment;
use App\Models\Order;
use App\Models\Review;
use Session;
use Cart;
use Auth;
use Illuminate\Support\Facades\Cache;
use App\Models\Wishlist;
use App\Models\ShippingPromotion;
use App\Services\ProductEventTracker;

class FrontendController extends Controller
{
    public function index()
    {
        // The home page is the most visited route. Cache the assembled sections briefly
        // and load only the 12 products that are actually rendered per category.
        $homePage = Cache::remember('storefront.home.v2', now()->addMinutes(5), function () {
            $homeproducts = Category::where(['front_view' => 1, 'status' => 1])
                ->select('id', 'name', 'slug')
                ->orderBy('id')
                ->get();

            $categoryIds = $homeproducts->pluck('id');
            $productsByCategory = Product::where('status', 1)
                ->where('stock', '>', 0)
                ->whereIn('category_id', $categoryIds)
                ->select('id', 'name', 'slug', 'new_price', 'old_price', 'category_id')
                ->with(['image', 'prosizes', 'procolors'])
                ->latest('id')
                ->get()
                ->groupBy('category_id');

            $homeproducts->each(function ($category) use ($productsByCategory) {
                $category->setRelation('products', ($productsByCategory->get($category->id) ?? collect())->take(12)->values());
            });

            return [
                'frontcategory' => Category::where('status', 1)->select('id', 'name', 'image', 'slug')->get(),
                'sliders' => Banner::where(['status' => 1, 'category_id' => 1])->select('id', 'image', 'link')->get(),
                'sliderbottomads' => Banner::where(['status' => 1, 'category_id' => 5])->select('id', 'image', 'link')->limit(3)->get(),
                'footertopads' => Banner::where(['status' => 1, 'category_id' => 6])->select('id', 'image', 'link')->limit(2)->get(),
                'hotdeal_top' => Product::where(['status' => 1, 'topsale' => 1])->where('stock', '>', 0)->latest('id')->select('id', 'name', 'slug', 'new_price', 'old_price')->with(['image', 'prosizes', 'procolors'])->limit(12)->get(),
                'hotdeal_bottom' => Product::where(['status' => 1, 'topsale' => 1])->latest('id')->select('id', 'name', 'slug', 'new_price', 'old_price')->skip(12)->limit(12)->get(),
                'homeproducts' => $homeproducts,
            ];
        });

        $recentIds = array_values(array_filter(Session::get('recently_viewed_products', [])));
        $recentProducts = collect();
        if ($recentIds) {
            $loadedProducts = Product::where('status', 1)
                ->where('stock', '>', 0)
                ->whereIn('id', $recentIds)
                ->with(['image', 'prosizes', 'procolors'])
                ->get()
                ->keyBy('id');
            $recentProducts = collect($recentIds)->map(fn ($id) => $loadedProducts->get($id))->filter()->take(8)->values();
        }

        return view('frontEnd.layouts.pages.index', array_merge($homePage, compact('recentProducts')));
    }

    public function hotdeals()
    {

        $products = Product::where(['status' => 1, 'topsale' => 1])
            ->select('id', 'name', 'slug', 'new_price', 'old_price')
            ->paginate(36);
        return view('frontEnd.layouts.pages.hotdeals', compact('products'));
    }

    public function category($slug, Request $request)
    {
        $category = Category::where(['slug' => $slug, 'status' => 1])->first();
        $products = Product::where(['status' => 1, 'category_id' => $category->id])
            ->select('id', 'name', 'slug', 'new_price', 'old_price', 'category_id');
        $subcategories = Subcategory::where('category_id', $category->id)->get();

        // return $request->sort;
        if ($request->sort == 1) {
            $products = $products->orderBy('created_at', 'desc');
        } elseif ($request->sort == 2) {
            $products = $products->orderBy('created_at', 'asc');
        } elseif ($request->sort == 3) {
            $products = $products->orderBy('new_price', 'desc');
        } elseif ($request->sort == 4) {
            $products = $products->orderBy('new_price', 'asc');
        } elseif ($request->sort == 5) {
            $products = $products->orderBy('name', 'asc');
        } elseif ($request->sort == 6) {
            $products = $products->orderBy('name', 'desc');
        } else {
            $products = $products->latest();
        }

        $min_price = $products->min('new_price');
        $max_price = $products->max('new_price');
        if($request->min_price && $request->max_price){
            $products = $products->where('new_price','>=',$request->min_price);
            $products = $products->where('new_price','<=',$request->max_price);
        }

        $selectedSubcategories = $request->input('subcategory', []);
        $products = $products->when($selectedSubcategories, function ($query) use ($selectedSubcategories) {
            return $query->whereHas('subcategory', function ($subQuery) use ($selectedSubcategories) {
                $subQuery->whereIn('id', $selectedSubcategories);
            });
        });

        $products = $products->paginate(24);
        return view('frontEnd.layouts.pages.category', compact('category', 'products', 'subcategories', 'min_price', 'max_price'));
    }

    public function subcategory($slug, Request $request)
    {
        $subcategory = Subcategory::where(['slug' => $slug, 'status' => 1])->first();
        $products = Product::where(['status' => 1, 'subcategory_id' => $subcategory->id])
            ->select('id', 'name', 'slug', 'new_price', 'old_price', 'category_id', 'subcategory_id');
        $childcategories = Childcategory::where('subcategory_id', $subcategory->id)->get();

        // return $request->sort;
        if ($request->sort == 1) {
            $products = $products->orderBy('created_at', 'desc');
        } elseif ($request->sort == 2) {
            $products = $products->orderBy('created_at', 'asc');
        } elseif ($request->sort == 3) {
            $products = $products->orderBy('new_price', 'desc');
        } elseif ($request->sort == 4) {
            $products = $products->orderBy('new_price', 'asc');
        } elseif ($request->sort == 5) {
            $products = $products->orderBy('name', 'asc');
        } elseif ($request->sort == 6) {
            $products = $products->orderBy('name', 'desc');
        } else {
            $products = $products->latest();
        }
        
        $min_price = $products->min('new_price');
        $max_price = $products->max('new_price');
        if($request->min_price && $request->max_price){
            $products = $products->where('new_price','>=',$request->min_price);
            $products = $products->where('new_price','<=',$request->max_price);
        }

        $selectedChildcategories = $request->input('childcategory', []);
        $products = $products->when($selectedChildcategories, function ($query) use ($selectedChildcategories) {
            return $query->whereHas('childcategory', function ($subQuery) use ($selectedChildcategories) {
                $subQuery->whereIn('id', $selectedChildcategories);
            });
        });

        $products = $products->paginate(24);
        // return $products;
        $impproducts = Product::where(['status' => 1, 'topsale' => 1])
            ->with('image')
            ->limit(6)
            ->select('id', 'name', 'slug')
            ->get();

        return view('frontEnd.layouts.pages.subcategory', compact('subcategory', 'products', 'impproducts', 'childcategories', 'max_price', 'min_price'));
    }

    public function products($slug, Request $request)
    {
        $childcategory = Childcategory::where(['slug' => $slug, 'status' => 1])->first();
        $childcategories = Childcategory::where('subcategory_id', $childcategory->subcategory_id)->get();
        $products = Product::where(['status' => 1, 'childcategory_id' => $childcategory->id])->with('category')
            ->select('id', 'name', 'slug', 'new_price', 'old_price', 'category_id', 'subcategory_id', 'childcategory_id');


        // return $request->sort;
        if ($request->sort == 1) {
            $products = $products->orderBy('created_at', 'desc');
        } elseif ($request->sort == 2) {
            $products = $products->orderBy('created_at', 'asc');
        } elseif ($request->sort == 3) {
            $products = $products->orderBy('new_price', 'desc');
        } elseif ($request->sort == 4) {
            $products = $products->orderBy('new_price', 'asc');
        } elseif ($request->sort == 5) {
            $products = $products->orderBy('name', 'asc');
        } elseif ($request->sort == 6) {
            $products = $products->orderBy('name', 'desc');
        } else {
            $products = $products->latest();
        }
        
        $min_price = $products->min('new_price');
        $max_price = $products->max('new_price');
        if($request->min_price && $request->max_price){
            $products = $products->where('new_price','>=',$request->min_price);
            $products = $products->where('new_price','<=',$request->max_price);
        }

        $products = $products->paginate(24);
        // return $products;
        $impproducts = Product::where(['status' => 1, 'topsale' => 1])
            ->with('image')
            ->limit(6)
            ->select('id', 'name', 'slug')
            ->get();

        return view('frontEnd.layouts.pages.childcategory', compact('childcategory', 'products', 'impproducts', 'min_price', 'max_price', 'childcategories'));
    }


    public function details($slug)
    {
        $details = Product::where(['slug' => $slug, 'status' => 1])
            ->with(['image', 'images', 'category', 'subcategory', 'childcategory', 'brand', 'recommendedProducts.image', 'recommendedProducts.prosizes', 'recommendedProducts.procolors'])
            ->withCount('reviews')
            ->firstOrFail();
        $this->rememberRecentlyViewedProduct($details->id);
        app(ProductEventTracker::class)->recordProductView($details->id);
        $recommendedProducts = $details->recommendedProducts
            ->filter(fn ($product) => (int) $product->status === 1 && (int) $product->stock > 0)
            ->take(4)
            ->values();

        $products = Product::where(['category_id' => $details->category_id, 'status' => 1])
            ->where('id', '!=', $details->id)
            ->where('stock', '>', 0)
            ->with('image')
            ->select('id', 'name', 'slug', 'new_price', 'old_price', 'category_id')
            ->latest('id')
            ->limit(12)
            ->get();
        $shippingcharge = ShippingCharge::where('status', 1)->orderBy('amount')->get();
        $reviews = Review::where('product_id', $details->id)->latest()->get();
        $productcolors = Productcolor::where('product_id', $details->id)
            ->with('color')
            ->get();
        // return $productcolors;
        $productsizes = Productsize::where('product_id', $details->id)
            ->with('size')
            ->get();
        $isWishlisted = Auth::guard('customer')->check()
            && Wishlist::where(['customer_id' => Auth::guard('customer')->id(), 'product_id' => $details->id])->exists();

        return view('frontEnd.layouts.pages.details', compact('details', 'products', 'recommendedProducts', 'shippingcharge', 'productcolors', 'productsizes', 'reviews', 'isWishlisted'));
    }
    public function quickview(Request $request)
    {
        $data['data'] = Product::where(['id' => $request->id, 'status' => 1])->with('images')->withCount('reviews')->first();
        $data = view('frontEnd.layouts.ajax.quickview', $data)->render();
        if ($data != '') {
            echo $data;
        }
    }
    public function livesearch(Request $request)
    {
        $keyword = trim((string) $request->get('keyword'));
        if (mb_strlen($keyword) < 2) {
            return response()->view('frontEnd.layouts.ajax.search', ['products' => collect(), 'searched' => false]);
        }

        $products = Product::select('id', 'name', 'slug', 'new_price', 'old_price', 'product_code')
            ->where('status', 1)
            ->where('stock', '>', 0)
            ->when($request->category, fn ($query, $category) => $query->where('category_id', $category))
            ->where(function ($query) use ($keyword) {
                $query->where('name', 'LIKE', '%' . $keyword . '%')
                    ->orWhere('product_code', 'LIKE', '%' . $keyword . '%');
            })
            ->with('image')
            ->limit(8)
            ->get();

        return view('frontEnd.layouts.ajax.search', ['products' => $products, 'searched' => true]);
    }
    public function search(Request $request)
    {
        $products = Product::select('id', 'name', 'slug', 'new_price', 'old_price')
            ->where('status', 1)
            ->with('image');
        if ($request->keyword) {
            $products = $products->where('name', 'LIKE', '%' . $request->keyword . "%");
        }
        if ($request->category) {
            $products = $products->where('category_id', $request->category);
        }
        $products = $products->paginate(36);
        $keyword = $request->keyword;
        return view('frontEnd.layouts.pages.search', compact('products', 'keyword'));
    }

    public function shipping_charge(Request $request)
    {
        $data = $request->validate(['id' => ['required', 'integer']]);
        $shipping = ShippingCharge::where(['id' => $data['id'], 'status' => 1])->firstOrFail();
        $subtotal = (int) round(Cart::instance('shopping')->content()->sum(fn ($item) => $item->price * $item->qty));
        $promotion = ShippingPromotion::where('status', 1)->first();
        Session::put('shipping', $promotion && $subtotal >= $promotion->minimum_order ? 0 : (int) $shipping->amount);

        return view('frontEnd.layouts.ajax.cart');
    }


    public function contact(Request $request)
    {
        return view('frontEnd.layouts.pages.contact');
    }

    public function page($slug)
    {
        $page = CreatePage::where('slug', $slug)->firstOrFail();
        return view('frontEnd.layouts.pages.page', compact('page'));
    }
    public function districts(Request $request)
    {
        $areas = District::where(['district' => $request->id])->pluck('area_name', 'id');
        return response()->json($areas);
    }
    public function campaign($slug)
    {
        $campaign_data = Campaign::where(['slug' => $slug, 'status' => 1])
            ->where(function ($query) { $query->whereNull('starts_at')->orWhere('starts_at', '<=', now()); })
            ->where(function ($query) { $query->whereNull('ends_at')->orWhere('ends_at', '>=', now()); })
            ->with(['images', 'products.image'])
            ->firstOrFail();

        // Older landing pages have one product in campaigns.product_id. New pages can
        // feature multiple products through the campaigns_products pivot table.
        $products = $campaign_data->products
            ->filter(fn ($product) => (int) $product->status === 1 && (int) $product->stock > 0)
            ->values();

        if ($products->isEmpty() && $campaign_data->product_id) {
            $legacyProduct = Product::where(['id' => $campaign_data->product_id, 'status' => 1])
                ->with('image')
                ->first();
            if ($legacyProduct) {
                $products->push($legacyProduct);
            }
        }

        abort_if($products->isEmpty(), 404, 'No available products in this campaign.');

        $shippingcharge = ShippingCharge::where('status', 1)->orderBy('amount')->get();

        return view('frontEnd.layouts.pages.campaign.campaign', compact('campaign_data', 'products', 'shippingcharge'));
    }


    public function payment_success(Request $request)
    {
        $order_id = $request->order_id;
        $shurjopay_service = new ShurjopayController();
        $json = $shurjopay_service->verify($order_id);
        $data = json_decode($json);

        if ($data[0]->sp_code != 1000) {
            Toastr::error('Your payment failed, try again', 'Oops!');
            if ($data[0]->value1 == 'customer_payment') {
                return redirect()->route('home');
            } else {
                return redirect()->route('home');
            }
        }

        if ($data[0]->value1 == 'customer_payment') {

            $customer = Customer::find(Auth::guard('customer')->user()->id);

            // order data save
            $order = new Order();
            $order->invoice_id = $data[0]->id;
            $order->amount = $data[0]->amount;
            $order->customer_id = Auth::guard('customer')->user()->id;
            $order->order_status = $data[0]->bank_status;
            $order->save();

            // payment data save
            $payment = new Payment();
            $payment->order_id = $order->id;
            $payment->customer_id = Auth::guard('customer')->user()->id;
            $payment->payment_method = 'shurjopay';
            $payment->amount = $order->amount;
            $payment->trx_id = $data[0]->bank_trx_id;
            $payment->sender_number = $data[0]->phone_no;
            $payment->payment_status = 'paid';
            $payment->save();
            // order details data save
            foreach (Cart::instance('shopping')->content() as $cart) {
                $order_details = new OrderDetails();
                $order_details->order_id = $order->id;
                $order_details->product_id = $cart->id;
                $order_details->product_name = $cart->name;
                $order_details->purchase_price = $cart->options->purchase_price;
                $order_details->sale_price = $cart->price;
                $order_details->qty = $cart->qty;
                $order_details->save();
            }

            Cart::instance('shopping')->destroy();
            Toastr::error('Thanks, Your payment send successfully', 'Success!');
            return redirect()->route('home');
        }

        Toastr::error('Something wrong, please try agian', 'Error!');
        return redirect()->route('home');
    }
    public function payment_cancel(Request $request)
    {
        $order_id = $request->order_id;
        $shurjopay_service = new ShurjopayController();
        $json = $shurjopay_service->verify($order_id);
        $data = json_decode($json);

        Toastr::error('Your payment cancelled', 'Cancelled!');
        if ($data[0]->sp_code != 1000) {
            if ($data[0]->value1 == 'customer_payment') {
                return redirect()->route('home');
            } else {
                return redirect()->route('home');
            }
        }
    }

    /** Keep a small anonymous browsing history to make returning to products effortless. */
    private function rememberRecentlyViewedProduct(int $productId): void
    {
        $history = array_values(array_filter(Session::get('recently_viewed_products', []), fn ($id) => (int) $id !== $productId));
        array_unshift($history, $productId);
        Session::put('recently_viewed_products', array_slice($history, 0, 12));
    }

    public function offers()
    {
        return view('frontEnd.layouts.pages.offers');
    }

}
