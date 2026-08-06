<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Productprice;
use App\Models\Product;
use Toastr;
use Cart;
use DB;
use App\Services\ProductEventTracker;
class ShoppingController extends Controller
{

    public function addTocartGet($id,Request $request){
        $qty=1;
        $productInfo = DB::table('products')->where('id',$id)->first();
        $productImage = DB::table('productimages')->where('product_id',$id)->first();
        $cartinfo=Cart::instance('shopping')->add(['id'=>$productInfo->id,'name'=>$productInfo->name,'qty'=>$qty,'price'=>$productInfo->new_price,
            'options' => [
                'image'=>$productImage->image,
                'old_price'=>$productInfo->old_price,
                 'slug' => $productInfo->slug,
                 'purchase_price' => $productInfo->purchase_price,
                 ]]);

        // return redirect()->back();
        return response()->json($cartinfo);
    } 

    public function cart_store(Request $request)
    {
        $this->addProductToCart($request);
        Toastr::success('Product successfully added to cart', 'Success!');

        // Product details exposes both actions: keep shopping for "add to cart",
        // or go straight to checkout for "buy now".
        if ($request->has('add_cart')) {
            return back();
        }

        return redirect()->route('customer.checkout');
    }

    /** Secure JSON endpoint used by conversion landing pages for multi-product carts. */
    public function campaign_cart_store(Request $request)
    {
        $this->addProductToCart($request);

        return response()->json([
            'message' => 'Product added to cart.',
            'count' => Cart::instance('shopping')->count(),
            'checkout_url' => route('customer.checkout'),
        ]);
    }

    private function addProductToCart(Request $request): void
    {
        $data = $request->validate([
            'id' => ['required', 'integer', 'exists:products,id'],
            'qty' => ['nullable', 'integer', 'min:1', 'max:20'],
            'product_size' => ['nullable', 'string', 'max:100'],
            'product_color' => ['nullable', 'string', 'max:100'],
            'pro_unit' => ['nullable', 'string', 'max:100'],
        ]);

        $product = Product::where(['id' => $data['id'], 'status' => 1])->with('image')->firstOrFail();
        abort_if((int) $product->stock < 1, 422, 'This product is currently out of stock.');

        Cart::instance('shopping')->add([
            'id' => $product->id,
            'name' => $product->name,
            'qty' => $data['qty'] ?? 1,
            'price' => $product->new_price,
            'options' => [
                'slug' => $product->slug,
                'image' => optional($product->image)->image,
                'old_price' => $product->old_price,
                'purchase_price' => $product->purchase_price,
                'product_size' => $data['product_size'] ?? null,
                'product_color' => $data['product_color'] ?? null,
                'pro_unit' => $data['pro_unit'] ?? null,
            ],
        ]);
        app(ProductEventTracker::class)->record($product->id, 'add_to_cart');
    }
    public function cart_remove(Request $request)
    {
        $data = $request->validate(['id' => ['required', 'string']]);
        Cart::instance('shopping')->update($data['id'], 0);
        $data = Cart::instance('shopping')->content();
        return view('frontEnd.layouts.ajax.cart', compact('data'));
    }
    public function cart_increment(Request $request)
    {
        $data = $request->validate(['id' => ['required', 'string']]);
        $item = Cart::instance('shopping')->get($data['id']);
        abort_unless($item, 404);
        $product = Product::where(['id' => $item->id, 'status' => 1])->firstOrFail();
        abort_if($item->qty >= $product->stock, 422, 'Requested quantity is unavailable.');
        Cart::instance('shopping')->update($data['id'], $item->qty + 1);
        $data = Cart::instance('shopping')->content();
        return view('frontEnd.layouts.ajax.cart', compact('data'));
    }
    public function cart_decrement(Request $request)
    {
        $data = $request->validate(['id' => ['required', 'string']]);
        $item = Cart::instance('shopping')->get($data['id']);
        abort_unless($item, 404);
        Cart::instance('shopping')->update($data['id'], max(0, $item->qty - 1));
        $data = Cart::instance('shopping')->content();
        return view('frontEnd.layouts.ajax.cart', compact('data'));
    }
    public function cart_count(Request $request)
    {
        $data = Cart::instance('shopping')->count();
        return view('frontEnd.layouts.ajax.cart_count', compact('data'));
    }
    public function mobilecart_qty(Request $request)
    {
        $data = Cart::instance('shopping')->count();
        return view('frontEnd.layouts.ajax.mobilecart_qty', compact('data'));
    }

}
