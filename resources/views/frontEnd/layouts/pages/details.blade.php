@extends('frontEnd.layouts.master')
@section('title',$details->name)
@section('breadcrumb')<a href="{{ route('category',$details->category->slug) }}">{{ $details->category->name }}</a><span class="mx-2">›</span>{{ Str::limit($details->name,65) }}@endsection
@push('seo')<meta name="description" content="{{ $details->meta_description }}"><meta property="og:title" content="{{ $details->name }}"><meta property="og:image" content="{{ asset(optional($details->image)->image) }}">@endpush
@push('css')
<style>
.pd-page{padding:28px 0 50px}
.pd-layout{display:grid;grid-template-columns:1.02fr .98fr;gap:26px;align-items:start}
/* gallery */
.gallery-card{background:#fff;border:1px solid var(--line);border-radius:var(--radius);padding:14px}
.gallery-main{position:relative;border-radius:14px;overflow:hidden;background:var(--soft);cursor:zoom-in}
.gallery-main img{width:100%;aspect-ratio:1;object-fit:cover;display:block}
.g-img-tag{position:absolute;top:14px;left:14px;z-index:3}
.thumbs{display:flex;gap:9px;padding-top:12px;overflow-x:auto}
.thumbs button{border:2px solid var(--line);background:#fff;padding:0;border-radius:10px;overflow:hidden;cursor:pointer;transition:.15s;flex-shrink:0}
.thumbs button.active,.thumbs button:hover{border-color:var(--green)}
.thumbs img{height:68px;width:68px;object-fit:cover;display:block}
/* buy box */
.buy-card{background:#fff;border:1px solid var(--line);border-radius:var(--radius);padding:26px}
.pd-cat{font-size:11px;font-weight:800;letter-spacing:.06em;color:var(--green-dark);text-transform:uppercase}
.pd-title{font-size:clamp(1.2rem,2.4vw,1.7rem);line-height:1.3;font-weight:850;margin:8px 0 10px;color:var(--ink)}
.pd-meta{display:flex;align-items:center;gap:12px;flex-wrap:wrap;font-size:12px;color:var(--muted)}
.pd-rating{color:var(--amber);font-weight:800}
.pd-sku{font-weight:700}
.pd-price{display:flex;align-items:center;gap:12px;flex-wrap:wrap;margin:18px 0 4px}
.pd-now{font-size:clamp(1.7rem,3.4vw,2.3rem);font-weight:900;color:var(--green-dark)}
.pd-old{font-size:1.1rem;color:#94a3b8;text-decoration:line-through;font-weight:600}
.pd-save{background:var(--green-soft);color:var(--green-deep);font-weight:800;font-size:12px;padding:5px 10px;border-radius:8px}
.pd-price-note{font-size:11.5px;color:var(--muted);margin:0 0 16px}
.variant-label{font-size:13px;font-weight:800;margin:18px 0 8px;display:flex;justify-content:space-between}
.variant-label span{color:var(--green-dark);font-weight:800}
.variant-grid{display:flex;gap:8px;flex-wrap:wrap}
.variant-grid input{display:none}
.variant-grid label{min-width:44px;text-align:center;border:1.5px solid var(--line);padding:9px 12px;border-radius:10px;font-size:13px;cursor:pointer;transition:.15s;background:#fff}
.variant-grid label:hover{border-color:var(--green)}
.variant-grid input:checked+label{background:var(--green);color:#fff;border-color:var(--green);font-weight:800}
.stock-line{display:flex;align-items:center;gap:8px;font-size:13px;font-weight:800;margin:18px 0}
.stock-in{color:#15803d}.stock-low{color:#ea580c}.stock-out{color:#dc2626}
.stock-bar{height:6px;border-radius:99px;background:#e2e8f0;overflow:hidden;margin-top:6px}
.stock-bar>i{display:block;height:100%;border-radius:99px}
.qty-wrap{display:flex;align-items:center;gap:10px;font-size:13px;font-weight:800;margin:6px 0 4px}
.qty-box{display:flex;align-items:center;border:1.5px solid var(--line);border-radius:10px;overflow:hidden}
.qty-box button{border:0;background:#f8fafc;width:38px;height:40px;font-size:17px;cursor:pointer}
.qty-box button:hover{background:var(--green-soft);color:var(--green-dark)}
.qty-box input{border:0;outline:0;width:48px;text-align:center;font-weight:800;font-size:15px}
.cta-row{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin:18px 0;padding-top:18px;border-top:1px solid var(--line)}
.btn-buy,.btn-cart{height:50px;border-radius:13px;font-weight:850;font-size:15px;cursor:pointer;display:inline-flex;align-items:center;justify-content:center;gap:8px;transition:.18s;border:1.5px solid}
.btn-cart{background:#fff;color:var(--green-dark);border-color:var(--green)}
.btn-cart:hover{background:var(--green-soft)}
.btn-buy{background:var(--green);color:#fff;border-color:var(--green);box-shadow:0 10px 22px -10px rgba(5,150,105,.65)}
.btn-buy:hover{background:var(--green-dark);transform:translateY(-1px)}
.contact-cta{display:grid;grid-template-columns:1fr 1fr;gap:10px}
.contact-cta a{padding:12px;text-align:center;font-size:13px;font-weight:800;border-radius:12px;display:flex;align-items:center;justify-content:center;gap:7px;transition:.15s}
.call-btn{background:#f1f5f9;color:var(--ink)}.call-btn:hover{background:#e2e8f0}
.wa-btn{background:#22c55e;color:#fff}.wa-btn:hover{background:#16a34a}
.trust-box{border:1px solid var(--line);border-radius:14px;margin-top:18px;padding:14px;display:grid;grid-template-columns:repeat(3,1fr);gap:8px;background:var(--soft)}
.trust-box div{font-size:11px;text-align:center;font-weight:700;color:var(--muted)}
.trust-box i{color:var(--green);font-size:16px;display:block;margin-bottom:4px}
/* detail tabs */
.pd-below{display:grid;grid-template-columns:2fr 1fr;gap:22px;margin-top:34px}
.pd-card{background:#fff;border:1px solid var(--line);border-radius:var(--radius);padding:24px}
.pd-card h3{font-size:18px;font-weight:850;margin:0 0 14px;display:flex;align-items:center;gap:8px}
.pd-card h3 .ln{width:4px;height:18px;background:var(--green);border-radius:99px;display:inline-block}
.pd-desc{line-height:1.8;font-size:14px;color:#334155}
.review-item{border-top:1px solid var(--line);padding:14px 0}
.review-item .rn{color:var(--amber)}
.related-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
/* sticky mobile buy bar */
.mobile-buybar{display:none}
@media(max-width:991px){.pd-layout{grid-template-columns:1fr}.pd-below{grid-template-columns:1fr}.related-grid{grid-template-columns:repeat(2,1fr)}}
@media(max-width:767px){
    .pd-page{padding:14px 0 90px}
    .buy-card{padding:18px;border:0;box-shadow:none}
    .gallery-card{border:0;padding:0}
    .pd-below{margin-top:20px}
    .pd-card{padding:16px}
    .cta-row{position:fixed;z-index:1050;left:0;right:0;bottom:64px;background:#fff;border-top:1px solid var(--line);border-bottom:1px solid var(--line);grid-template-columns:1fr 1fr;gap:10px;padding:10px 14px;margin:0;box-shadow:0 -6px 18px -14px rgba(15,23,42,.3)}
    .btn-buy,.btn-cart{height:44px;font-size:14px}
    .mobile-buybar{display:flex}
}
</style>
@endpush
@section('content')
@php($saveAmt = $details->old_price > $details->new_price ? $details->old_price - $details->new_price : 0)
<div class="fashion-container pd-page"><div class="pd-layout">
    <section class="gallery-card">
        <div class="gallery-main"><span class="g-img-tag">@if($details->old_price > $details->new_price)<span class="discount-tag">-{{ round((($details->old_price-$details->new_price)/$details->old_price)*100) }}%</span>@endif</span><img id="main-product-image" src="{{ asset(optional($details->image)->image ?: optional($details->images->first())->image) }}" alt="{{ $details->name }}"></div>
        <div class="thumbs">@foreach($details->images as $image)<button type="button" class="product-thumb @if(optional($details->image)->image == $image->image) active @endif" data-src="{{ asset($image->image) }}"><img src="{{ asset($image->image) }}" alt="{{ $details->name }}"></button>@endforeach</div>
    </section>

    <section class="buy-card">
        <div class="pd-cat">{{ optional($details->category)->name }}</div>
        <h1 class="pd-title">{{ $details->name }}</h1>
        <div class="pd-meta"><span class="pd-rating">★★★★★</span><span class="pd-sku">SKU: {{ $details->product_code }}</span><span class="pd-rating">{{ $reviews->count() }} রিভিউ</span></div>
        <div class="pd-price"><span class="pd-now">৳{{ number_format($details->new_price) }}</span>@if($details->old_price)<span class="pd-old">৳{{ number_format($details->old_price) }}</span>@endif @if($saveAmt)<span class="pd-save"><i class="fa fa-tag"></i> সাশ্রয় ৳{{ number_format($saveAmt) }}</span>@endif</div>
        <p class="pd-price-note">সারা বাংলাদেশে delivery available — Cash on Delivery available।</p>

        <form action="{{ route('cart.store') }}" method="POST" id="product-order-form">@csrf<input type="hidden" name="id" value="{{ $details->id }}">
            @if($productsizes->isNotEmpty())<div class="variant-label">Select Your Size <span id="selected-size"></span></div><div class="variant-grid">@foreach($productsizes as $size)<input required type="radio" name="product_size" id="size-{{ $size->id }}" value="{{ optional($size->size)->sizeName }}"><label for="size-{{ $size->id }}">{{ optional($size->size)->sizeName }}</label>@endforeach</div>@endif
            @if($productcolors->isNotEmpty())<div class="variant-label">Select Color <span id="selected-color"></span></div><div class="variant-grid">@foreach($productcolors as $color)<input required type="radio" name="product_color" id="color-{{ $color->id }}" value="{{ optional($color->color)->colorName }}"><label for="color-{{ $color->id }}">{{ optional($color->color)->colorName }}</label>@endforeach</div>@endif
            @if($details->pro_unit)<input type="hidden" name="pro_unit" value="{{ $details->pro_unit }}">@endif

            @if($details->stock <= 0)<div class="stock-line stock-out"><i class="fa fa-circle-xmark"></i> STATUS: OUT OF STOCK</div>
            @elseif($details->stock <= 5)<div class="stock-line stock-low"><i class="fa fa-fire"></i> মাত্র {{ $details->stock }}টি স্টকে আছে — দ্রুত অর্ডার করুন! <i class="fa fa-circle-xmark d-none"></i></div>
            @else<div class="stock-line stock-in"><i class="fa fa-circle-check"></i> STATUS: IN STOCK</div>@endif
            <div class="stock-bar">@if($details->stock>0)<i style="width:{{ min(100, $details->stock) }}%;background:{{ $details->stock<=5 ? '#ea580c' : 'var(--green)' }}"></i>@else<i style="width:0%"></i>@endif</div>

            @if($details->stock > 0)<div class="qty-wrap"><span>QUANTITY</span><div class="qty-box"><button type="button" id="qty-minus">−</button><input id="qty" name="qty" value="1" readonly><button type="button" id="qty-plus">+</button></div></div>
            <div class="cta-row"><button name="add_cart" class="btn-cart"><i class="fa fa-cart-plus"></i> Add to Cart</button><button name="order_now" class="btn-buy"><i class="fa fa-bolt"></i> Buy Now</button></div>@endif
        </form>

        <div class="contact-cta"><a class="call-btn" href="tel:{{ optional($contact)->hotline }}"><i class="fa fa-phone"></i> Call: {{ optional($contact)->hotline }}</a><a class="wa-btn" target="_blank" href="https://wa.me/{{ preg_replace('/\D/','',optional($contact)->hotline) }}?text={{ urlencode($details->name.' - '.route('product',$details->slug)) }}"><i class="fab fa-whatsapp"></i> WhatsApp</a></div>
        <div class="trust-box"><div><i class="fa fa-truck-fast"></i>Fast<br>Delivery</div><div><i class="fa fa-money-bill-wave"></i>Cash on<br>Delivery</div><div><i class="fa fa-rotate-left"></i>Easy<br>Return</div></div>
    </section>
</div>

<div class="pd-below">
    <section class="pd-card"><h3><span class="ln"></span>Product Details</h3><div class="pd-desc">{!! $details->description !!}</div><h3 class="mt-4"><span class="ln"></span>Customer Reviews ({{ $reviews->count() }})</h3>@forelse($reviews as $review)<div class="review-item"><strong>{{ $review->name }}</strong> <span class="rn ms-2">{{ str_repeat('★',(int)$review->ratting) }}</span><p class="mb-0 mt-1 small text-muted">{{ $review->review }}</p></div>@empty<p class="text-muted">এই product-এর কোনো review এখনো নেই।</p>@endforelse</section>
    <aside class="pd-card"><h3><span class="ln"></span>Delivery & Return</h3><p class="small text-muted">সারা বাংলাদেশে delivery available।</p>@foreach($shippingcharge as $charge)<div class="d-flex justify-content-between small border-bottom py-2"><span>{{ $charge->name }}</span><strong style="color:var(--green-dark)">৳{{ $charge->amount }}</strong></div>@endforeach<div class="mt-3 small text-muted">অর্ডার করতে সমস্যা হলে হটলাইনে কল করুন।</div></aside>
</div>

@if($recommendedProducts->isNotEmpty() || $products->isNotEmpty())<section class="mt-5"><div class="sec-head d-flex justify-content-between align-items-end mb-3"><h3 class="fw-bold mb-0">আপনারও পছন্দ হতে পারে</h3></div><div class="related-grid">@foreach(($recommendedProducts->isNotEmpty() ? $recommendedProducts : $products->take(4)) as $product)@include('frontEnd.layouts.pages.partials.product-card-v2', ['product'=>$product])@endforeach</div></section>@endif
</div>
@endsection
@push('script')
@php($analyticsItem=['item_id'=>(string)$details->id,'item_name'=>$details->name,'price'=>(float)$details->new_price,'currency'=>'BDT','quantity'=>1])
<script>
$('.product-thumb').on('click',function(){$('#main-product-image').attr('src',$(this).data('src'));$('.product-thumb').removeClass('active');$(this).addClass('active')});
$('#qty-minus').on('click',function(){$('#qty').val(Math.max(1,Number($('#qty').val())-1))});
$('#qty-plus').on('click',function(){$('#qty').val(Math.min({{ $details->stock }},Number($('#qty').val())+1))});
$('input[name="product_size"]').on('change',function(){$('#selected-size').text(': '+$(this).val())});
$('input[name="product_color"]').on('change',function(){$('#selected-color').text(': '+$(this).val())});
(function(){const item=@json($analyticsItem);window.dataLayer=window.dataLayer||[];dataLayer.push({ecommerce:null});dataLayer.push({event:'view_item',ecommerce:{currency:'BDT',value:item.price,items:[item]}});if(typeof fbq==='function')fbq('track','ViewContent',{content_ids:[item.item_id],content_type:'product',value:item.price,currency:'BDT'});$('#product-order-form').on('submit',function(){const tracked=Object.assign({},item,{quantity:Number($('#qty').val())});dataLayer.push({ecommerce:null});dataLayer.push({event:'add_to_cart',ecommerce:{currency:'BDT',value:tracked.price*tracked.quantity,items:[tracked]}});if(typeof fbq==='function')fbq('track','AddToCart',{content_ids:[item.item_id],content_type:'product',value:tracked.price*tracked.quantity,currency:'BDT'})})})();
</script>
@endpush
