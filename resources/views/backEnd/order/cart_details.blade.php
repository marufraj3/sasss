@php
$subtotal = (int) str_replace([',', '.00'], '', Cart::instance('pos_shopping')->subtotal());
$shipping = (int) Session::get('pos_shipping', 0);
$total_discount = (int) Session::get('pos_discount', 0) + (int) Session::get('product_discount', 0);
$grandTotal = max(0, $subtotal + $shipping - $total_discount);
@endphp
<div class="pos-summary"><div class="d-flex justify-content-between mb-1"><span>Total Quantity:</span><strong>{{ Cart::instance('pos_shopping')->count() }}</strong></div><div class="d-flex justify-content-between mb-1"><span>Sub Total:</span><strong>৳{{ number_format($subtotal) }}</strong></div><div class="d-flex justify-content-between mb-1"><span>Discount:</span><input id="pos_discount" type="number" min="0" class="form-control form-control-sm w-50" value="{{ Session::get('pos_discount', 0) }}"></div><div class="d-flex justify-content-between mb-1"><span>Delivery Charge:</span><strong>৳{{ number_format($shipping) }}</strong></div><div class="d-flex justify-content-between border-top pt-2"><span class="pos-total">Total:</span><span class="pos-total" id="pos-grand-total" data-amount="{{ $grandTotal }}">৳{{ number_format($grandTotal) }}</span></div></div>
