@extends('frontEnd.layouts.master')
@section('title', optional($generalsetting)->name ?: 'Online Shop')
@push('seo')
<meta name="description" content="নির্বাচিত পণ্য, সহজ অর্ডার এবং সারা দেশে দ্রুত ডেলিভারি।">
@endpush
@push('css')
<style>
:root{--h-ink:#0f172a;--h-muted:#64748b;--h-line:#e2e8f0}.home-v3{padding:0 0 50px}.home-v3 .container{max-width:1180px}
/* hero */
.hero-v3{display:grid;grid-template-columns:1.15fr .85fr;gap:16px;align-items:stretch;margin-bottom:22px}
.hero-main{position:relative;border-radius:22px;overflow:hidden;min-height:400px;background:linear-gradient(120deg,#047857,#065f46)}
.hero-main img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover}
.hero-main:after{content:"";position:absolute;inset:0;background:linear-gradient(90deg,rgba(4,51,37,.82),rgba(4,51,37,.25) 62%,transparent)}
.hero-box{position:relative;z-index:2;display:flex;flex-direction:column;justify-content:center;height:100%;padding:clamp(26px,5vw,52px);color:#fff;max-width:560px}
.hero-box .eyebrow{font-size:.78rem;font-weight:800;background:rgba(255,255,255,.16);border:1px solid rgba(255,255,255,.3);border-radius:99px;padding:6px 12px;display:inline-block;width:max-content}
.hero-box h1{font-size:clamp(1.9rem,3.4vw,3.2rem);line-height:1.1;font-weight:850;letter-spacing:-.03em;margin:14px 0 10px}
.hero-box p{font-size:1.02rem;opacity:.92;margin:0 0 20px}
.btn-hero{display:inline-flex;align-items:center;gap:8px;background:#fff;color:#065f46!important;border:0;border-radius:12px;padding:13px 22px;font-weight:800;font-size:15px;transition:.2s;width:max-content}
.btn-hero:hover{background:#d1fae5;transform:translateY(-2px)}
.hero-side{display:grid;grid-template-rows:1fr 1fr;gap:16px}
.side-promo{position:relative;border-radius:18px;overflow:hidden;background:#fff;border:1px solid var(--h-line);display:flex;align-items:center;gap:14px;padding:18px;min-height:150px}
.side-promo .ico{width:54px;height:54px;border-radius:14px;background:var(--green-soft);color:var(--green-dark);display:grid;place-items:center;font-size:22px;flex-shrink:0}
.side-promo h4{font-size:16px;font-weight:800;margin:0 0 4px}
.side-promo p{font-size:12px;color:var(--h-muted);margin:0}
/* trust strip */
.trust-strip{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin:0 0 30px}
.trust-item{background:#fff;border:1px solid var(--h-line);border-radius:14px;padding:14px;display:flex;align-items:center;gap:12px}
.trust-item i{width:40px;height:40px;border-radius:11px;background:var(--green-soft);color:var(--green-dark);display:grid;place-items:center;font-size:17px;flex-shrink:0}
.trust-item strong,.trust-item small{display:block}
.trust-item strong{font-size:13px}
.trust-item small{font-size:11px;color:var(--h-muted)}
/* sections */
.home-sec{margin-top:34px}
.sec-head{display:flex;justify-content:space-between;align-items:end;margin-bottom:16px;gap:12px}
.sec-head h2{font-size:1.45rem;margin:0;font-weight:850;letter-spacing:-.02em;color:var(--h-ink)}
.sec-head .sub{display:flex;align-items:center;gap:8px;color:var(--h-muted);font-size:.9rem}
.sec-head .sub .dot{width:8px;height:8px;border-radius:50%;background:var(--green);display:inline-block}
.sec-link{font-weight:800;color:var(--green-dark);white-space:nowrap}
.sec-link:hover{color:var(--green-deep)}
/* categories */
.cat-grid{display:grid;grid-template-columns:repeat(6,1fr);gap:12px}
.cat-card{background:#fff;border:1px solid var(--h-line);border-radius:16px;padding:12px;text-align:center;text-decoration:none;color:var(--h-ink);font-size:.82rem;font-weight:750;transition:.18s}
.cat-card:hover{transform:translateY(-3px);border-color:var(--green);box-shadow:var(--shadow);color:var(--green-dark)}
.cat-card img{width:80px;height:80px;object-fit:cover;border-radius:12px;display:block;margin:0 auto 9px;background:var(--green-soft)}
/* product grid */
.pgrid{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
/* promo banner */
.promo-banner{position:relative;border-radius:20px;overflow:hidden;min-height:170px;display:flex;align-items:center;background:linear-gradient(120deg,#047857,#065f46);color:#fff;padding:clamp(22px,4vw,40px)}
.promo-banner img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;opacity:.5}
.promo-banner .pb-box{position:relative;z-index:2;max-width:520px}
.promo-banner h3{font-size:clamp(1.3rem,2.4vw,2rem);font-weight:850;margin:0 0 8px}
.promo-banner p{opacity:.9;margin:0 0 16px}
@media(max-width:991px){.hero-v3{grid-template-columns:1fr}.hero-side{grid-template-columns:1fr 1fr;grid-template-rows:auto}.cat-grid{grid-template-columns:repeat(4,1fr)}.pgrid{grid-template-columns:repeat(3,1fr)}.trust-strip{grid-template-columns:repeat(2,1fr)}}
@media(max-width:575px){.home-v3 .container{padding:0 12px}.hero-main{min-height:340px}.hero-side{grid-template-columns:1fr}.side-promo{min-height:0;padding:14px}.trust-strip{grid-template-columns:1fr 1fr;gap:8px}.trust-item{padding:11px}.trust-item i{width:34px;height:34px;font-size:14px}.trust-item small{display:none}.cat-grid{grid-template-columns:repeat(3,1fr);gap:8px}.cat-card{padding:8px;font-size:.73rem}.cat-card img{height:64px;width:64px}.pgrid{grid-template-columns:repeat(2,1fr);gap:9px}.sec-head h2{font-size:1.2rem}.sec-link{font-size:.82rem}}
</style>
@endpush
@section('content')
<div class="home-v3"><div class="container">
    <section class="hero-v3">
        <div class="hero-main">@if($sliders->isNotEmpty())@php($hero=$sliders->first())<img src="{{ asset($hero->image) }}" alt="{{ optional($generalsetting)->name }}" fetchpriority="high">@endif<div class="hero-box"><span class="eyebrow"><i class="fa fa-bolt"></i> আজকের বিশেষ অফার</span><h1>পছন্দের পণ্য,<br>সহজে অর্ডার করুন</h1><p>মানসম্মত পণ্য, Cash on Delivery আর সারা দেশে দ্রুত ডেলিভারি।</p><a class="btn-hero" href="#shop-now">অফার দেখুন <i class="fa fa-arrow-down"></i></a></div></div>
        <div class="hero-side">
            <div class="side-promo"><div class="ico"><i class="fa fa-fire"></i></div><div><h4>আজকের সেরা ডিল</h4><p>স্টক থাকা পর্যন্ত বিশেষ দামে কিনুন।</p><a class="sec-link" href="{{ route('hotdeals') }}">Hot Deals <i class="fa fa-arrow-right"></i></a></div></div>
            <div class="side-promo"><div class="ico"><i class="fa fa-headset"></i></div><div><h4>অর্ডারে সাহায্য লাগবে?</h4><p>আমাদের team পণ্য ও delivery-তে সাহায্য করবে।</p><a class="sec-link" href="tel:{{ optional($contact)->hotline }}"><i class="fa fa-phone"></i> {{ optional($contact)->hotline ?: 'যোগাযোগ করুন' }}</a></div></div>
        </div>
    </section>

    <section class="trust-strip">
        <div class="trust-item"><i class="fa fa-truck-fast"></i><div><strong>দ্রুত ডেলিভারি</strong><small>সারা বাংলাদেশে</small></div></div>
        <div class="trust-item"><i class="fa fa-money-bill-wave"></i><div><strong>Cash on Delivery</strong><small>পণ্য পেয়ে মূল্য দিন</small></div></div>
        <div class="trust-item"><i class="fa fa-rotate-left"></i><div><strong>সহজ রিটার্ন</strong><small>সন্তুষ্ট না হলে</small></div></div>
        <div class="trust-item"><i class="fa fa-shield-halved"></i><div><strong>নিরাপদ কেনাকাটা</strong><small>বিশ্বস্ত অর্ডার</small></div></div>
    </section>

    <section class="home-sec"><div class="sec-head"><div><h2>জনপ্রিয় ক্যাটাগরি</h2><div class="sub"><span class="dot"></span>আপনার প্রয়োজনীয় পণ্য খুঁজুন</div></div></div><div class="cat-grid">@foreach($menucategories->take(12) as $category)<a class="cat-card" href="{{ route('category', $category->slug) }}"><img loading="lazy" src="{{ asset($category->image) }}" alt="{{ $category->name }}"><span>{{ Str::limit($category->name, 22) }}</span></a>@endforeach</div></section>

    @if($hotdeal_top->isNotEmpty())<section id="shop-now" class="home-sec"><div class="sec-head"><div><h2>আজকের জনপ্রিয় ডিল</h2><div class="sub"><span class="dot"></span>স্টক থাকা পর্যন্ত বিশেষ দাম</div></div><a class="sec-link" href="{{ route('hotdeals') }}">সব অফার <i class="fa fa-arrow-right"></i></a></div><div class="pgrid">@foreach($hotdeal_top as $product)@include('frontEnd.layouts.pages.partials.product-card-v2', ['product'=>$product])@endforeach</div></section>@endif

    @if($recentProducts->isNotEmpty())<section class="home-sec"><div class="sec-head"><div><h2>আপনি সম্প্রতি দেখেছেন</h2><div class="sub"><span class="dot"></span>পছন্দের পণ্য আবার খুঁজুন</div></div></div><div class="pgrid">@foreach($recentProducts as $product)@include('frontEnd.layouts.pages.partials.product-card-v2', ['product'=>$product])@endforeach</div></section>@endif

    @if($sliderbottomads->isNotEmpty())@php($ad=$sliderbottomads->first())<section class="home-sec"><a href="{{ $ad->link ?: '#' }}" class="d-block"><img loading="lazy" src="{{ asset($ad->image) }}" alt="বিশেষ অফার" style="display:block;width:100%;border-radius:20px;max-height:250px;object-fit:cover"></a></section>@endif

    @foreach($homeproducts as $homecat)@if($homecat->products->isNotEmpty())<section class="home-sec"><div class="sec-head"><div><h2>{{ $homecat->name }}</h2><div class="sub"><span class="dot"></span>আপনার জন্য বাছাই করা পণ্য</div></div><a class="sec-link" href="{{ route('category', $homecat->slug) }}">সব দেখুন <i class="fa fa-arrow-right"></i></a></div><div class="pgrid">@foreach($homecat->products as $product)@include('frontEnd.layouts.pages.partials.product-card-v2', ['product'=>$product])@endforeach</div></section>@endif@endforeach

    <section class="home-sec"><div class="promo-banner"><img loading="lazy" src="{{ asset(optional($sliders->last())->image) }}" alt=""><div class="pb-box"><h3>পছন্দের পণ্য খুঁজে পাচ্ছেন না?</h3><p>আমাদের সাথে যোগাযোগ করুন—সঠিক পণ্যটি খুঁজতে আমরা সাহায্য করব।</p><a class="btn-hero" href="{{ route('contact') }}">যোগাযোগ করুন <i class="fa fa-arrow-right"></i></a></div></div></section>
</div></div>
@endsection
