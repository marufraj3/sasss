@php($product_discount = 0)
@forelse($cartinfo as $value)
<tr><td><strong>{{ Str::limit($value->name, 34) }}</strong><br><small class="text-muted">{{ $value->options->product_size ?? '' }} {{ !empty($value->options->product_color) ? '· '.$value->options->product_color : '' }} {{ !empty($value->options->pro_unit) ? '· '.$value->options->pro_unit : '' }}</small></td><td><div class="qty-controls d-flex gap-1"><button type="button" class="cart_decrement" data-id="{{ $value->rowId }}">−</button><input value="{{ $value->qty }}" readonly><button type="button" class="cart_increment bg-success text-white" data-id="{{ $value->rowId }}">+</button></div></td><td>৳{{ number_format($value->price) }}<br><input type="number" min="0" class="product_discount form-control form-control-sm mt-1" value="{{ $value->options->product_discount }}" data-id="{{ $value->rowId }}" title="Item discount"></td><td>৳{{ number_format(($value->price - $value->options->product_discount) * $value->qty) }}</td><td><button type="button" class="cart_remove btn btn-sm btn-danger" data-id="{{ $value->rowId }}">×</button></td></tr>
@php($product_discount += $value->options->product_discount * $value->qty)
@empty
<tr><td colspan="5" class="text-center text-muted py-3">এখনও কোনো product cart-এ নেই</td></tr>
@endforelse
@php(Session::put('product_discount', $product_discount))
