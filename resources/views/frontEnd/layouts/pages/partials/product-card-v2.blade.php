@php($discount = $product->old_price && $product->old_price > $product->new_price ? round((($product->old_price - $product->new_price) / $product->old_price) * 100) : null)
<article class="product-card-v3">
    <a class="product-image-v3" href="{{ route('product', $product->slug) }}">
        <img loading="lazy" src="{{ asset(optional($product->image)->image ?: 'public/uploads/default/product.png') }}" alt="{{ $product->name }}">
        @if($discount)<span class="discount-tag">-{{ $discount }}%</span>@endif
        @if(isset($product->stock) && $product->stock > 0 && $product->stock <= 5)<span class="low-tag"><i class="fa fa-bolt"></i> {{ $product->stock }}টি</span>@endif
        <span class="quick-view"><i class="fa fa-eye"></i> দ্রুত দেখুন</span>
    </a>
    <div class="product-info-v3">
        <a class="product-name-v3" href="{{ route('product', $product->slug) }}">{{ Str::limit($product->name, 56) }}</a>
        <div class="price-row-v3"><strong>৳{{ number_format($product->new_price) }}</strong>@if($product->old_price)<del>৳{{ number_format($product->old_price) }}</del>@endif</div>
        <div class="product-actions-v3">
            @if((isset($product->prosizes) && $product->prosizes->isNotEmpty()) || (isset($product->procolors) && $product->procolors->isNotEmpty()))
                <a class="btn-add options" href="{{ route('product', $product->slug) }}">অপশন দেখুন <i class="fa fa-arrow-right"></i></a>
            @else
                <form action="{{ route('cart.store') }}" method="POST">@csrf<input type="hidden" name="id" value="{{ $product->id }}"><input type="hidden" name="qty" value="1"><button class="btn-add" name="add_cart" type="submit"><i class="fa fa-cart-plus"></i> কার্টে</button></form>
                <form action="{{ route('cart.store') }}" method="POST">@csrf<input type="hidden" name="id" value="{{ $product->id }}"><input type="hidden" name="qty" value="1"><button class="btn-order" type="submit">অর্ডার</button></form>
            @endif
        </div>
    </div>
</article>
