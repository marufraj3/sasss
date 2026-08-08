<!doctype html>
<html lang="bn">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="theme-color" content="#059669">
    <link rel="manifest" href="{{ asset('manifest.webmanifest') }}">
    <link rel="apple-touch-icon" href="{{ asset('img/logo.png') }}">
    <title>@yield('title') | {{ optional($generalsetting)->name }}</title>
    <link rel="shortcut icon" href="{{ asset(optional($generalsetting)->favicon) }}">
    <link rel="stylesheet" href="{{ asset('public/frontEnd/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontEnd/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontEnd/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/frontEnd/css/owl.theme.default.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/backEnd/assets/css/toastr.min.css') }}">
    <link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400;500;600;700&family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    @stack('seo')
    @stack('css')
    <style>
        :root{
            --green:#059669;--green-dark:#047857;--green-deep:#065f46;--green-soft:#ecfdf5;
            --amber:#f59e0b;--red:#ef4444;
            --ink:#0f172a;--muted:#64748b;--line:#e2e8f0;--paper:#fff;--soft:#f8fafc;
            --radius:16px;--shadow:0 1px 2px rgba(15,23,42,.05),0 8px 24px -12px rgba(15,23,42,.14);
        }
        *{box-sizing:border-box}
        html{scroll-behavior:smooth}
        body{margin:0;color:var(--ink);background:#fff;font-family:Manrope,"Hind Siliguri",sans-serif;-webkit-font-smoothing:antialiased}
        a{text-decoration:none;color:inherit}
        img{max-width:100%}
        .fashion-container{max-width:1240px;margin:auto;padding:0 20px}
        /* utility bar */
        .util-bar{background:var(--green-deep);color:#fff;font-size:12px}
        .util-inner{max-width:1240px;margin:auto;padding:0 20px;height:34px;display:flex;align-items:center;justify-content:space-between}
        .util-inner a{color:#d1fae5;font-weight:600}
        .util-inner a:hover{color:#fff}
        .util-left{display:flex;gap:18px}
        /* header */
        .main-head{background:#fff;position:sticky;top:0;z-index:900;box-shadow:0 1px 0 var(--line),0 6px 18px -18px rgba(15,23,42,.5)}
        .head-inner{max-width:1240px;margin:auto;padding:0 20px;height:72px;display:grid;grid-template-columns:190px minmax(240px,1fr) auto;align-items:center;gap:26px}
        .logo img{max-width:160px;max-height:46px;object-fit:contain}
        .head-search{position:relative;display:flex;border:2px solid var(--green);border-radius:99px;overflow:hidden;background:#fff;max-width:560px;transition:.2s}
        .head-search:focus-within{box-shadow:0 0 0 4px rgba(5,150,105,.14)}
        .head-search input{height:46px;border:0;outline:0;flex:1;padding:0 18px;font-size:14px;background:transparent}
        .head-search button{border:0;background:var(--green);color:#fff;width:54px;font-size:16px;cursor:pointer;transition:.2s}
        .head-search button:hover{background:var(--green-dark)}
        .head-actions{display:flex;align-items:center;gap:6px;font-size:12px;font-weight:700}
        .head-action{display:flex;align-items:center;gap:8px;padding:9px 12px;border-radius:12px;transition:.15s;white-space:nowrap}
        .head-action:hover{background:var(--green-soft);color:var(--green-dark)}
        .head-action i{font-size:17px;color:var(--green)}
        .head-action .lbl{line-height:1.15}
        .head-action .lbl b{display:block;font-size:10px;color:var(--muted);font-weight:700}
        .cart-count{display:inline-grid;place-items:center;min-width:19px;height:19px;padding:0 5px;background:var(--green);color:#fff;border-radius:99px;font-size:10px;font-weight:800;margin-left:-4px;vertical-align:top}
        /* nav */
        .nav-wrap{background:#fff;border-top:1px solid var(--line)}
        .nav-inner{max-width:1240px;margin:auto;padding:0 20px;height:46px;display:flex;align-items:stretch}
        .nav-inner>a,.nav-inner .nav-drop>a{display:flex;align-items:center;gap:6px;padding:0 16px;font-size:12.5px;font-weight:800;color:var(--ink);border-left:1px solid var(--line);transition:.15s}
        .nav-inner>a:hover,.nav-inner .nav-drop>a:hover{color:var(--green)}
        .nav-drop{position:relative}
        .nav-drop:hover .mega-menu{display:grid;opacity:1;visibility:visible;transform:translateY(0)}
        .mega-menu{display:grid;grid-template-columns:repeat(3,minmax(150px,1fr));gap:16px;position:absolute;z-index:950;top:100%;left:0;min-width:540px;background:#fff;border:1px solid var(--line);border-radius:14px;padding:22px;box-shadow:0 24px 50px -20px rgba(15,23,42,.28);opacity:0;visibility:hidden;transform:translateY(6px);transition:.18s}
        .mega-menu strong{font-size:12px;color:var(--green-dark);border-bottom:1px solid var(--line);padding-bottom:6px;display:block;margin-bottom:6px}
        .mega-menu a{display:block;color:#475569;font-size:12.5px;padding:5px 0}
        .mega-menu a:hover{color:var(--green)}
        /* mobile head */
        .mobile-head{display:none}
        .mobile-search{display:none}
        .mobile-logo img{max-width:130px;max-height:38px;object-fit:contain}
        /* mobile drawer */
        .drawer-backdrop{position:fixed;inset:0;background:rgba(15,23,42,.5);z-index:1190;opacity:0;visibility:hidden;transition:.2s}
        .drawer-backdrop.open{opacity:1;visibility:visible}
        .mobile-drawer{position:fixed;top:0;bottom:0;left:0;width:300px;max-width:86vw;background:#fff;z-index:1200;transform:translateX(-102%);transition:.28s;box-shadow:0 20px 60px rgba(15,23,42,.3);overflow-y:auto;display:flex;flex-direction:column}
        .mobile-drawer.open{transform:translateX(0)}
        .drawer-head{padding:18px;border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between}
        .drawer-head .close-drawer{border:0;background:var(--soft);width:34px;height:34px;border-radius:10px;font-size:16px;cursor:pointer;color:var(--ink)}
        .drawer-nav{padding:8px 0;flex:1}
        .drawer-nav .dsec{font-size:11px;font-weight:850;text-transform:uppercase;letter-spacing:.04em;color:var(--green-dark);padding:14px 18px 6px}
        .drawer-nav a.dlink{display:flex;align-items:center;justify-content:space-between;padding:12px 18px;font-size:14px;font-weight:700;color:var(--ink);border-left:3px solid transparent}
        .drawer-nav a.dlink:active,.drawer-nav a.dlink.on{background:var(--green-soft);color:var(--green-dark);border-left-color:var(--green)}
        .drawer-foot{padding:14px 18px;border-top:1px solid var(--line);font-size:12px;color:var(--muted)}
        /* breadcrumb */
        .breadcrumb-bar{background:var(--soft);border-bottom:1px solid var(--line);padding:12px 0;font-size:12.5px;color:var(--muted)}
        .breadcrumb-bar a:hover{color:var(--green)}
        /* search dropdown */
        .search-result{position:absolute;z-index:1200;top:52px;left:0;right:0;background:#fff;border:1px solid var(--line);border-radius:14px;box-shadow:var(--shadow);overflow:hidden}
        .search_product ul{list-style:none;padding:0;margin:0}
        .search_product li{border-bottom:1px solid #f1f5f9}
        .search_product li:last-child{border:0}
        .search_product a{display:flex;gap:11px;padding:10px 14px;align-items:center}
        .search_product a:hover{background:var(--green-soft)}
        .search_img img{width:46px;height:46px;object-fit:cover;border-radius:9px}
        .search_content .name{margin:0;font-size:12.5px;font-weight:700;color:var(--ink)}
        .search_content .price{margin:3px 0 0;font-size:12.5px;color:var(--green-dark);font-weight:800}
        /* footer */
        .main-footer{background:#065f46;color:#d1fae5;margin-top:60px}
        .footer-cta{background:var(--green-deep);border-bottom:1px solid rgba(255,255,255,.08)}
        .footer-cta-inner{max-width:1240px;margin:auto;padding:30px 20px;display:flex;justify-content:space-between;align-items:center;gap:20px;flex-wrap:wrap}
        .footer-cta h3{color:#fff;margin:0 0 6px;font-size:20px;font-weight:800}
        .footer-cta p{margin:0;font-size:13px;color:#a7f3d0}
        .btn-lite{display:inline-flex;align-items:center;gap:8px;background:#fff;color:var(--green-deep)!important;font-weight:800;border:0;border-radius:12px;padding:13px 22px;font-size:14px;transition:.2s}
        .btn-lite:hover{background:#ecfdf5;transform:translateY(-1px)}
        .footer-inner{max-width:1240px;margin:auto;padding:44px 20px 20px;display:grid;grid-template-columns:1.6fr 1fr 1fr 1fr;gap:34px}
        .footer-col h6{color:#fff;font-weight:800;font-size:13px;margin:0 0 12px}
        .footer-col p{font-size:12.5px;color:#a7f3d0;line-height:1.7}
        .footer-col a{display:block;font-size:12.5px;color:#d1fae5;margin:8px 0;transition:.15s}
        .footer-col a:hover{color:#fff}
        .footer-copy{border-top:1px solid rgba(255,255,255,.1)}
        .footer-copy-inner{max-width:1240px;margin:auto;padding:16px 20px;text-align:center;font-size:12px;color:#a7f3d0}
        /* mobile bottom nav */
        .mobile-nav{display:none}
        @media(max-width:991px){
            .head-inner{grid-template-columns:150px 1fr 46px;gap:14px;height:62px}
            .head-actions .head-action:not(.cart-wrap){display:none}
            .head-action .lbl{display:none}
            .nav-wrap{display:none}
        }
        @media(max-width:767px){
            body{padding-bottom:64px}
            .fashion-container,.footer-inner,.util-inner{padding-left:14px;padding-right:14px}
            .util-bar{display:none}
            .main-head{position:sticky;top:0}
            .head-inner{display:none}
            .mobile-head{display:grid;grid-template-columns:40px 1fr 40px;align-items:center;gap:8px;height:58px;padding:0 14px}
            .mobile-head .menu-btn{border:0;background:none;font-size:20px;color:var(--ink);justify-self:start;cursor:pointer}
            .mobile-head .mobile-logo{justify-self:center}
            .mobile-head .m-cart{position:relative;font-size:21px;color:var(--ink);justify-self:end}
            .mobile-search{display:flex;border:2px solid var(--green);border-radius:12px;margin:0 14px 12px;overflow:hidden;background:#fff}
            .mobile-search input{border:0;outline:0;flex:1;height:40px;padding:0 12px;font-size:13px}
            .mobile-search button{border:0;background:var(--green);color:#fff;width:42px;font-size:15px}
            .breadcrumb-bar{font-size:11px;padding:10px 0}
            .footer-inner{grid-template-columns:1fr 1fr;gap:24px;padding-top:34px}
            .footer-cta-inner{flex-direction:column;align-items:flex-start;padding:24px 14px}
            .mobile-nav{display:flex;position:fixed;z-index:1100;bottom:0;left:0;right:0;height:64px;background:#fff;border-top:1px solid var(--line);box-shadow:0 -6px 20px -12px rgba(15,23,42,.25);justify-content:space-around;align-items:center}
            .mobile-nav a{text-align:center;font-size:10px;font-weight:700;color:var(--muted)}
            .mobile-nav a.on{color:var(--green-dark)}
            .mobile-nav i{display:block;font-size:18px;margin-bottom:3px}
        }
        /* ===== shared product card (v3) ===== */
        .product-card-v3{background:#fff;border:1px solid var(--line);border-radius:var(--radius);overflow:hidden;display:flex;flex-direction:column;position:relative;transition:.22s}
        .product-card-v3:hover{transform:translateY(-4px);box-shadow:var(--shadow);border-color:#c7d2fe}
        .product-image-v3{display:block;position:relative;background:#f3f6f5;overflow:hidden}
        .product-image-v3 img{display:block;width:100%;aspect-ratio:1;object-fit:cover;transition:transform .4s}
        .product-card-v3:hover .product-image-v3 img{transform:scale(1.06)}
        .discount-tag{position:absolute;top:10px;left:10px;background:var(--green);color:#fff;border-radius:8px;padding:4px 8px;font-weight:800;font-size:.72rem;z-index:2}
        .low-tag{position:absolute;top:10px;right:10px;background:#fff0f0;color:#dc2626;border:1px solid #fecaca;border-radius:8px;padding:4px 7px;font-weight:800;font-size:.68rem;z-index:2}
        .quick-view{position:absolute;left:10px;right:10px;bottom:10px;background:rgba(15,23,42,.82);color:#fff;text-align:center;font-size:12px;font-weight:700;border-radius:9px;padding:8px 0;opacity:0;transform:translateY(6px);transition:.2s}
        .product-card-v3:hover .quick-view{opacity:1;transform:translateY(0)}
        .product-info-v3{padding:13px;display:flex;flex:1;flex-direction:column}
        .product-name-v3{font-weight:750;line-height:1.4;color:var(--ink);text-decoration:none;min-height:38px;font-size:13px}
        .product-name-v3:hover{color:var(--green-dark)}
        .price-row-v3{margin:9px 0}
        .price-row-v3 strong{font-size:1.12rem;color:var(--green-dark)}
        .price-row-v3 del{font-size:.8rem;color:#94a3b8;margin-left:5px}
        .product-actions-v3{display:grid;grid-template-columns:1fr 1fr;gap:7px;margin-top:auto}
        .product-actions-v3 form{display:contents}
        .btn-add,.btn-order{height:38px;border-radius:10px;font-weight:800;font-size:.82rem;cursor:pointer;display:inline-flex;align-items:center;justify-content:center;gap:5px;transition:.18s;width:100%}
        .btn-add{background:#fff;color:var(--green-dark);border:1.5px solid var(--green);}
        .btn-add:hover{background:var(--green-soft)}
        .btn-order{background:var(--green);color:#fff;border:1.5px solid var(--green)}
        .btn-order:hover{background:var(--green-dark)}
        .btn-add.options{grid-column:1/-1}
        @media(max-width:767px){
            .product-name-v3{font-size:12px;min-height:34px}
            .product-info-v3{padding:10px}
            .product-actions-v3{grid-template-columns:1fr 1fr}
            .btn-add,.btn-order{font-size:.75rem;height:36px}
        }
    </style>
    @foreach($pixels as $pixel)<script>!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,document,'script','https://connect.facebook.net/en_US/fbevents.js');fbq('init','{{ $pixel->code }}');fbq('track','PageView');</script>@endforeach
    @foreach($gtm_code as $gtm)<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f)})(window,document,'script','dataLayer','GTM-{{ $gtm->code }}');</script>@endforeach
</head>
<body>
<div class="util-bar"><div class="util-inner"><div class="util-left"><span><i class="fa fa-truck-fast me-1"></i> সারা দেশে দ্রুত ডেলিভারি</span><span class="d-none d-sm-inline"><i class="fa fa-money-bill-wave me-1"></i> Cash on Delivery</span></div><div><a href="{{ route('customer.order_track') }}">Track Order</a></div></div></div>

<header class="main-head"><div class="head-inner">
    <a class="logo" href="{{ route('home') }}"><img src="{{ asset(optional($generalsetting)->white_logo) }}" alt="{{ optional($generalsetting)->name }}"></a>
    <div class="head-search position-relative"><form action="{{ route('search') }}" class="d-flex flex-grow-1"><input class="desktop-search" name="keyword" autocomplete="off" placeholder="Search products... (যেমন: শাড়ি, জুতা, পাঞ্জাবি)"><button><i class="fa fa-search"></i></button></form><div class="search-result"></div></div>
    <div class="head-actions">
        <a class="head-action d-none d-lg-flex" href="tel:{{ (optional($generalsetting)->hotline ?: optional($contact)->hotline) }}"><i class="fa fa-phone"></i><span class="lbl"><b>হটলাইন</b>{{ (optional($generalsetting)->hotline ?: optional($contact)->hotline) }}</span></a>
        <a class="head-action" href="{{ Auth::guard('customer')->check() ? route('customer.account') : route('customer.login') }}"><i class="fa fa-user"></i><span class="lbl"><b>{{ Auth::guard('customer')->check() ? 'আমার' : '' }}</b>{{ Auth::guard('customer')->check() ? 'Account' : 'Login / Sign Up' }}</span></a>
        <a class="head-action cart-wrap" href="{{ route('customer.checkout') }}"><i class="fa fa-shopping-bag"></i><span class="lbl"><b>কার্ট</b>View cart</span><span class="cart-count js-cart-count">{{ Cart::instance('shopping')->count() }}</span></a>
    </div>
</div>
<div class="mobile-head">
    <button class="menu-btn" id="mobile-menu-btn"><i class="fa fa-bars"></i></button>
    <a class="mobile-logo" href="{{ route('home') }}"><img src="{{ asset(optional($generalsetting)->white_logo) }}" alt="{{ optional($generalsetting)->name }}"></a>
    <a class="m-cart" href="{{ route('customer.checkout') }}"><i class="fa fa-shopping-bag"></i><span class="cart-count js-cart-count">{{ Cart::instance('shopping')->count() }}</span></a>
</div>
<div class="mobile-search"><input class="mobile-search-input" autocomplete="off" placeholder="Search products..."><button><i class="fa fa-search"></i></button></div></header>

<div class="drawer-backdrop" id="drawer-backdrop"></div>
<div class="mobile-drawer" id="mobile-drawer">
    <div class="drawer-head"><a href="{{ route('home') }}"><img src="{{ asset(optional($generalsetting)->white_logo) }}" style="max-width:120px;max-height:36px;object-fit:contain" alt="logo"></a><button class="close-drawer" id="close-drawer"><i class="fa fa-xmark"></i></button></div>
    <nav class="drawer-nav">
        <a class="dlink on" href="{{ route('home') }}"><span><i class="fa fa-home me-2" style="color:var(--green)"></i>হোম</span></a>
        <div class="dsec">Categories</div>
        @foreach($menucategories as $category)<a class="dlink" href="{{ route('category',$category->slug) }}"><span>{{ $category->name }}</span>@if($category->subcategories->isNotEmpty())<i class="fa fa-angle-right"></i>@endif</a>@endforeach
        <div class="dsec">Account</div>
        <a class="dlink" href="{{ route('hotdeals') }}"><span>Hot Deals</span></a>
        <a class="dlink" href="{{ route('customer.order_track') }}"><span>Track Order</span></a>
        <a class="dlink" href="{{ Auth::guard('customer')->check() ? route('customer.account') : route('customer.login') }}"><span>{{ Auth::guard('customer')->check() ? 'My Account' : 'Login / Sign Up' }}</span></a>
        <a class="dlink" href="{{ route('contact') }}"><span>Contact Us</span></a>
    </nav>
    <div class="drawer-foot"><i class="fa fa-phone me-1" style="color:var(--green)"></i> {{ (optional($generalsetting)->hotline ?: optional($contact)->hotline) }}</div>
</div>

<nav class="nav-wrap"><div class="nav-inner"><a href="{{ route('home') }}"><i class="fa fa-home"></i> হোম</a>@foreach($menucategories->take(6) as $category)<div class="nav-drop"><a href="{{ route('category',$category->slug) }}">{{ strtoupper($category->name) }} @if($category->subcategories->isNotEmpty())<i class="fa fa-angle-down ms-1"></i>@endif</a>@if($category->subcategories->isNotEmpty())<div class="mega-menu">@foreach($category->subcategories as $sub)<div><strong>{{ $sub->subcategoryName }}</strong>@foreach($sub->childcategories as $child)<a href="{{ route('products',$child->slug) }}">{{ $child->childcategoryName }}</a>@endforeach</div>@endforeach</div>@endif</div>@endforeach</div></nav>

<div class="breadcrumb-bar"><div class="fashion-container"><a href="{{ route('home') }}">Home</a> <span class="mx-2">›</span> @yield('breadcrumb','Shop')</div></div>

<main>@yield('content')</main>

<footer class="main-footer">
    <div class="footer-cta"><div class="footer-cta-inner"><div><h3>পছন্দের পণ্য খুঁজে পাচ্ছেন না?</h3><p>আমাদের সাথে যোগাযোগ করুন — সঠিক পণ্যটি খুঁজতে আমরা সাহায্য করব।</p></div><a class="btn-lite" href="{{ route('contact') }}"><i class="fa fa-comments"></i> যোগাযোগ করুন</a></div></div>
    <div class="footer-inner">
        <div class="footer-col"><img src="{{ asset(optional($generalsetting)->white_logo) }}" style="max-width:150px;max-height:44px;object-fit:contain;margin-bottom:12px" alt="logo"><p>{{ optional($contact)->address }}</p><p style="font-size:16px;font-weight:800;color:#fff">{{ (optional($generalsetting)->hotline ?: optional($contact)->hotline) }}</p></div>
        <div class="footer-col"><h6>SHOP</h6><a href="{{ route('hotdeals') }}">আজকের অফার</a>@foreach($menucategories->take(4) as $category)<a href="{{ route('category',$category->slug) }}">{{ $category->name }}</a>@endforeach</div>
        <div class="footer-col"><h6>CUSTOMER CARE</h6><a href="{{ route('customer.order_track') }}">অর্ডার ট্র্যাক</a><a href="{{ route('customer.orders') }}">আমার অর্ডার</a><a href="{{ route('contact') }}">Contact Us</a><a href="{{ route('customer.login') }}">My Account</a></div>
        <div class="footer-col"><h6>INFORMATION</h6>@foreach($pages as $page)<a href="{{ route('page',$page->slug) }}">{{ $page->name }}</a>@endforeach</div>
    </div>
    <div class="footer-copy"><div class="footer-copy-inner">{{ optional($generalsetting)->footer_text ?: (optional($generalsetting)->copyright ?: '© '.date('Y').' All rights reserved.') }}</div></div>
</footer>

<nav class="mobile-nav">
    <a href="{{ route('home') }}"><i class="fa fa-home"></i>Home</a>
    <a href="{{ route('hotdeals') }}"><i class="fa fa-tags"></i>অফার</a>
    <a href="#" id="mobile-search-focus-bottom"><i class="fa fa-search"></i>Search</a>
    <a href="{{ route('customer.checkout') }}"><i class="fa fa-shopping-bag"></i>Cart<span class="cart-count js-cart-count">{{ Cart::instance('shopping')->count() }}</span></a>
    <a href="{{ Auth::guard('customer')->check() ? route('customer.account') : route('customer.login') }}"><i class="fa fa-user"></i>Account</a>
</nav>

<script src="{{ asset('public/frontEnd/js/jquery-3.6.3.min.js') }}"></script><script>if(!window.jQuery){document.write('<script src="https://code.jquery.com/jquery-3.6.0.min.js"><\/script>')}</script><script src="{{ asset('public/frontEnd/js/bootstrap.min.js') }}"></script><script src="{{ asset('public/frontEnd/js/owl.carousel.min.js') }}"></script><script src="{{ asset('public/backEnd/assets/js/toastr.min.js') }}"></script>{!! Toastr::message() !!}
<script>
(function(){let timer,req;function search(keyword){clearTimeout(timer);if(keyword.trim().length<2){$('.search-result').empty();return}timer=setTimeout(function(){if(req)req.abort();req=$.get('{{ route('livesearch') }}',{keyword:keyword.trim()},function(html){$('.search-result').html(html)})},260)}$('.desktop-search,.mobile-search-input').on('input',function(){search($(this).val())});$('#mobile-search-focus,#mobile-search-focus-bottom').on('click',function(e){e.preventDefault();$('.mobile-search-input').focus();window.scrollTo({top:0,behavior:'smooth'})});$('#mobile-menu-btn').on('click',function(){$('#mobile-drawer').addClass('open');$('#drawer-backdrop').addClass('open');$('body').css('overflow','hidden')});$('#close-drawer,#drawer-backdrop').on('click',function(){$('#mobile-drawer').removeClass('open');$('#drawer-backdrop').removeClass('open');$('body').css('overflow','')});function token(){return $('meta[name="csrf-token"]').attr('content')}function refreshCount(){$.get('{{ route('cart.count') }}',function(html){const number=$('<div>').html(html).find('.margin-shopping span').first().text();if(number)$('.js-cart-count').text(number)})}$(document).on('click','.cart_remove',function(e){e.preventDefault();$.post('{{ route('cart.remove') }}',{id:$(this).data('id'),_token:token()},function(){location.reload()})})();
</script>
@stack('script')
<script>if('serviceWorker' in navigator&&location.protocol==='https:'){window.addEventListener('load',()=>navigator.serviceWorker.register('{{ asset('sw.js') }}').catch(()=>{}))}</script>
</body></html>
