@extends('frontEnd.layouts.master')
@section('title','Order Success')
@section('content')
<section class="customer-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <div class="success-img">
                    <img src="{{asset('public/frontEnd/images/order-success.png')}}" alt="">
                </div>
                <div class="success-title">
                    <h2>আপনার অর্ডারটি আমাদের কাছে সফলভাবে পৌঁছেছে, কিছুক্ষনের মধ্যে আমাদের একজন প্রতিনিধি আপনার নাম্বারে কল করবেন </h2>
                </div>

                <h5 class="my-3">Your Order Details</h5>
                <div class="success-table">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td>
                                    <p>Invoice ID</p>
                                    <p><strong>{{$order->invoice_id}}</strong></p>
                                </td>
                                <td>
                                    <p>Date</p>
                                    <p><strong>{{$order->created_at->format('d-m-y')}}</strong></p>
                                </td>
                                <td>
                                    <p>Phone</p>
                                    <p><strong>{{$order->shipping?$order->shipping->phone:''}}</strong></p>
                                </td>
                                <td>
                                    <p>Total</p>
                                    <p><strong>৳ {{$order->amount}}</strong></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <p>Payment Method</p>
                                    <p><strong>{{ optional($order->payment)->payment_method }}</strong></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- success table -->
                <h5 class="my-4">Pay with cash upon delivery</h5>
                <div class="success-table">
                    <h6 class="mb-3">Order Delivery</h6>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($order->orderdetails as $key=>$value)
                            <tr>
                                <td>
                                    <p>{{$value->product_name}} x {{$value->qty}}</p>
                                    
                                </td>
                                <td><p><strong>৳ {{$value->sale_price}}</strong></p></td>
                            </tr>
                            @endforeach
                            <tr>
                                <th  class="text-end px-4">Net Total</th>
                                <td><strong id="net_total">৳{{$order->amount-$order->shipping_charge}}</strong></td>
                            </tr>
                            <tr>
                                <th  class="text-end px-4">Shipping Cost</th>
                                <td>
                                    <strong id="cart_shipping_cost">৳{{$order->shipping_charge}}</strong>
                                </td>
                            </tr>
                            <tr>
                                <th  class="text-end px-4">Grand Total</th>
                                <td>
                                    <strong id="grand_total">৳{{$order->amount}}</strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td>
                                    <h5 class="my-4">Billing Address</h5>
                                    <p>{{$order->shipping?$order->shipping->name:''}}</p>
                                    <p>{{$order->shipping?$order->shipping->phone:''}}</p>
                                    <p>{{$order->shipping?$order->shipping->address:''}}</p>
                                    <p>{{$order->shipping?$order->shipping->area:''}}</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- success table -->
                <a href="{{route('home')}}" class=" my-5 btn btn-primary">Go To Home</a>
            </div>
        </div>
    </div>
</section>
@endsection
@push('script')
<script src="{{asset('public/frontEnd/')}}/js/parsley.min.js"></script>
<script src="{{asset('public/frontEnd/')}}/js/form-validation.init.js"></script>
@php
    $purchaseItems = $order->orderdetails->map(function ($detail) {
        return [
            'item_id' => (string) $detail->product_id,
            'item_name' => $detail->product_name,
            'price' => (float) $detail->sale_price,
            'quantity' => (int) $detail->qty,
            'currency' => 'BDT',
        ];
    })->values();
@endphp
<script>
(function () {
    const transactionId = @json((string) $order->invoice_id);
    if (sessionStorage.getItem('purchase-tracked-' + transactionId)) return;
    const items = @json($purchaseItems);
    window.dataLayer = window.dataLayer || [];
    dataLayer.push({ ecommerce: null });
    dataLayer.push({ event: 'purchase', ecommerce: { transaction_id: transactionId, value: {{ (float) $order->amount }}, shipping: {{ (float) $order->shipping_charge }}, currency: 'BDT', items: items } });
    if (typeof window.fbq === 'function') {
        fbq('track', 'Purchase', { content_ids: items.map(item => item.item_id), content_type: 'product', value: {{ (float) $order->amount }}, currency: 'BDT' });
    }
    sessionStorage.setItem('purchase-tracked-' + transactionId, '1');
})();
</script>
@endpush