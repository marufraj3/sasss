<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Productprice;
use App\Models\Product;
use Toastr;
use Cart;
use DB;
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
    }
    public function cart_remove(Request $request)
    {
        $remove = Cart::instance('shopping')->update($request->id, 0);
        $data = Cart::instance('shopping')->content();
        return view('frontEnd.layouts.ajax.cart', compact('data'));
    }
    public function cart_increment(Request $request)
    {
        $item = Cart::instance('shopping')->get($request->id);
        $qty = $item->qty + 1;
        $increment = Cart::instance('shopping')->update($request->id, $qty);
        $data = Cart::instance('shopping')->content();
        return view('frontEnd.layouts.ajax.cart', compact('data'));
    }
    public function cart_decrement(Request $request)
    {
        $item = Cart::instance('shopping')->get($request->id);
        $qty = $item->qty - 1;
        $decrement = Cart::instance('shopping')->update($request->id, $qty);
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
