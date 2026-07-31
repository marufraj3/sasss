<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>{{ $generalsetting->name }}</title>
        <link rel="shortcut icon" href="{{asset($generalsetting->favicon)}}" type="image/x-icon" />
        <!-- fot awesome -->
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/all.css" />
        <!-- core css -->
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/bootstrap.min.css" />
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/animate.css" />
        <!-- owl carousel -->
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/owl.theme.default.css" />
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/owl.carousel.min.css" />
        <!-- owl carousel -->
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/select2.min.css" />
        <!-- common css -->
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/style.css" />
        <link rel="stylesheet" href="{{ asset('public/frontEnd/campaign/css') }}/responsive.css" />
        @foreach($pixels as $pixel)
        <!-- Facebook Pixel Code -->
        <script>
          !function(f,b,e,v,n,t,s)
          {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
          n.callMethod.apply(n,arguments):n.queue.push(arguments)};
          if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
          n.queue=[];t=b.createElement(e);t.async=!0;
          t.src=v;s=b.getElementsByTagName(e)[0];
          s.parentNode.insertBefore(t,s)}(window, document,'script',
          'https://connect.facebook.net/en_US/fbevents.js');
          fbq('init', '{{{$pixel->code}}}');
          fbq('track', 'PageView');
        </script>
        <noscript>
          <img height="1" width="1" style="display:none" 
               src="https://www.facebook.com/tr?id={{{$pixel->code}}}&ev=PageView&noscript=1"/>
        </noscript>
        <!-- End Facebook Pixel Code -->
        @endforeach
        
        <meta name="app-url" content="{{route('campaign',$campaign_data->slug)}}" />
        <meta name="robots" content="index, follow" />
        <meta name="description" content="{{$campaign_data->description}}" />
        <meta name="keywords" content="{{ $campaign_data->slug }}" />
        
        <!-- Twitter Card data -->
        <meta name="twitter:card" content="product" />
        <meta name="twitter:site" content="{{$campaign_data->name}}" />
        <meta name="twitter:title" content="{{$campaign_data->name}}" />
        <meta name="twitter:description" content="{{ $campaign_data->description}}" />
        <meta name="twitter:creator" content="hellodinajpur.com" />
        <meta property="og:url" content="{{route('campaign',$campaign_data->slug)}}" />
        <meta name="twitter:image" content="{{asset($campaign_data->image_one)}}" />
        
        <!-- Open Graph data -->
        <meta property="og:title" content="{{$campaign_data->name}}" />
        <meta property="og:type" content="product" />
        <meta property="og:url" content="{{route('campaign',$campaign_data->slug)}}" />
        <meta property="og:image" content="{{asset($campaign_data->image_one)}}" />
        <meta property="og:description" content="{{ $campaign_data->description}}" />
        <meta property="og:site_name" content="{{$campaign_data->name}}" />
      <style>
      @media only screen and (min-width: 320px) and (max-width: 991px) {
    .campaign_offer {
        margin-top: 0px !important;
    }
} 
#wa-widget-send-button{
        bottom: 45px !important;
}
.price-strip {
    background: linear-gradient(135deg, #fff, #f0faff);
    border: 2px dashed #0ea5e9;
    border-radius: 1rem;
    padding: 14px 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    position: relative;
    box-shadow: 0 4px 10px rgba(14,165,233,0.2);
    animation: pulseBorder 2s infinite;
}

/* পুরনো দাম */
.price-strip .old {
    text-decoration: line-through;
    color: #999;
    font-size: 15px;
    font-weight: 600;
}

/* নতুন দাম */
.price-strip .now {
    color: #e60000;
    font-size: 20px;
    font-weight: 900;
    animation: blink 1.5s infinite;
}

/* সেভ ব্যাজ */
.price-strip .save-badge {
    background: #16a34a;
    color: #fff;
    font-size: 15px;
    font-weight: 700;
    border-radius: 20px;
    padding: 6px 14px;
    box-shadow: 0 2px 8px rgba(22,163,74,0.4);
}

/* Hot Deal badge */
.price-strip .deal-badge {
    position: absolute;
    top: -12px;
    right: -12px;
    background: #ff4d4d;
    color: #fff;
    font-size: 13px;
    font-weight: 800;
    padding: 6px 12px;
    border-radius: 30px;
    box-shadow: 0 3px 10px rgba(255,77,77,0.5);
    animation: pulseBadge 1.5s infinite;
}

/* Border pulse animation */
@keyframes pulseBorder {
    0% { box-shadow: 0 0 8px rgba(14,165,233,0.3); }
    50% { box-shadow: 0 0 18px rgba(14,165,233,0.6); }
    100% { box-shadow: 0 0 8px rgba(14,165,233,0.3); }
}

/* New price blink */
@keyframes blink {
    0%, 50%, 100% { opacity: 1; }
    25%, 75% { opacity: 0.6; }
}

/* Badge pulse */
@keyframes pulseBadge {
    0% { transform: scale(1); }
    50% { transform: scale(1.15); }
    100% { transform: scale(1); }
}

.form_inn{
        padding: 0px !important;
}
      /* ========= UPGRADE PACK: 3D + RGB + RESPONSIVE ========= */ /* Better typography & smoothness */ * { -webkit-tap-highlight-color: transparent; } html { scroll-behavior: smooth; } body { text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; } /* Brand accents for glow */ :root{ --brand:#0ea5e9; /* primary */ --accent:#f97316; /* highlight */ --dark:#0f172a; /* text dark */ --success:#16a34a; --muted:#64748b; --bg:#f8fafc; --radius:14px; --shadow-1: 0 6px 16px rgba(2,6,23,.10); --shadow-2: 0 14px 32px rgba(2,6,23,.14); --shadow-3: 0 24px 48px rgba(2,6,23,.18); } /* Hero polish + 3D media */ .hero{background:linear-gradient(180deg,#ffffff 0,#f8fafc 100%); padding:48px 0} .hero h1{font-weight:800; line-height:1.25; text-align:center} .ribbon{ background: linear-gradient(90deg,#fef3c7 0,#fde68a 100%); color:#b45309; padding:.35rem .7rem; border-radius:.6rem; font-weight:800; box-shadow: 0 6px 18px rgba(190,138,17,.25); } #heroCarousel{ perspective: 1200px; } .hero .carousel-inner{ height: clamp(240px, 36vw, 460px); /* fixed balanced height */ border-radius: 18px; overflow: hidden; background:#0b1220; box-shadow: var(--shadow-3); transform-style: preserve-3d; transition: transform .35s ease, box-shadow .35s ease; } .hero .carousel-inner:hover{ transform: rotateX(1.5deg) rotateY(-1.5deg) translateY(-2px); box-shadow: 0 28px 60px rgba(2,6,23,.22); } .hero .carousel-item, .hero .carousel-item img{height:100%} .hero .carousel-item img{ width:100%; height:100%; object-fit: cover; object-position: center; filter: saturate(1.02) contrast(1.02); } /* Carousel controls: rounded glass buttons */ .carousel-control-prev, .carousel-control-next{ width:48px;height:48px; top:50%; transform: translateY(-50%); background: rgba(15,23,42,.45); border-radius: 50%; backdrop-filter: blur(6px); box-shadow: 0 10px 24px rgba(2,6,23,.3); opacity:1; transition: transform .2s ease, opacity .2s ease, background .2s ease; } .carousel-control-prev:hover, .carousel-control-next:hover{ transform: translateY(-50%) scale(1.05); background: rgba(15,23,42,.65); } /* Star rating color tweak */ .rating i{color:#f59e0b; text-shadow:0 1px 0 rgba(255,255,255,.4)} /* Buttons 3D */ .btn-cta{ background:linear-gradient(135deg, var(--accent), #fb7185); color:#fff; border:none; padding:.8rem 1.15rem; border-radius:.8rem; font-weight:800; box-shadow: 0 10px 24px rgba(249,113,22,.35), inset 0 -2px 0 rgba(0,0,0,.12); transform: translateY(0); transition: transform .15s ease, box-shadow .15s ease, opacity .25s ease; } .btn-cta:hover{opacity:.98; transform: translateY(-2px); box-shadow: 0 14px 32px rgba(249,113,22,.45)} .btn-cta:active{ transform: translateY(0); } .btn-outline-brand{ border:2px solid var(--brand); color:var(--brand); font-weight:800; border-radius:.8rem; transition: all .2s ease; } .btn-outline-brand:hover{background:var(--brand); color:#fff; box-shadow: 0 10px 24px rgba(14,165,233,.35)} /* Trust badges */ .trust-badges img{height:28px; opacity:.95; filter:saturate(1.1); transition: transform .2s ease} .trust-badges img:hover{transform: translateY(-2px)} /* Features: 3D lift */ .features{background:var(--bg); padding:40px 0} .feat-card{ background: linear-gradient(180deg,#ffffff,#f9fafb); border:1px solid #e2e8f0; border-radius: 14px; padding:18px; height:100%; box-shadow: var(--shadow-1); transition: transform .2s ease, box-shadow .2s ease, border-color .2s ease; } .feat-card:hover{ transform: translateY(-4px); box-shadow: var(--shadow-2); border-color:#dbe4f0; } .feat-card i{color:var(--brand); font-size:1.55rem} /* Price strip with subtle glow */ .price-strip{ background:#0ea5e90d; border:1px dashed var(--brand); border-radius:.9rem; padding:14px 16px; position:relative; } .price-strip::after{ content:""; position:absolute; inset:-1px; pointer-events:none; background: radial-gradient(120% 120% at 0% 0%, rgba(14,165,233,.18), transparent 60%), radial-gradient(120% 120% at 100% 100%, rgba(34,197,94,.18), transparent 60%); } /* RGB Neon Countdown (3D-ish) */ .countdown{ display:flex; gap:.65rem; margin:1rem 0 1.4rem; flex-wrap:wrap; justify-content:center; } .cd-box{ position:relative; min-width:78px; text-align:center; padding:.7rem .9rem; border-radius:14px; color:#fff; background:#0b1220; border:1px solid rgba(255,255,255,.08); box-shadow: 0 10px 26px rgba(2,6,23,.25), inset 0 1px 0 rgba(255,255,255,.06); isolation:isolate; overflow:hidden; transform: translateZ(0); } .cd-box strong{font-size:1.35rem; display:block; letter-spacing:.5px} .cd-box small{color:#cbd5e1; font-weight:700} /* RGB animated border + glow */ .cd-box::before{ content:""; position:absolute; inset:0; padding:1.5px; border-radius:inherit; background: linear-gradient(90deg, #ff0055, #ffbb00, #22c55e, #06b6d4, #7c3aed, #ff0055); -webkit-mask: linear-gradient(#000 0 0) content-box, linear-gradient(#000 0 0); -webkit-mask-composite: xor; mask-composite: exclude; animation: rgb-move 3.5s linear infinite; opacity:.95; } .cd-box::after{ content:""; position:absolute; inset:-18px; border-radius:inherit; background: conic-gradient(from 0deg, rgba(255,0,85,.18), rgba(255,187,0,.18), rgba(34,197,94,.18), rgba(6,182,212,.18), rgba(124,58,237,.18), rgba(255,0,85,.18)); filter: blur(18px); z-index:-1; animation: spin 8s linear infinite; } @keyframes rgb-move{ 0%{ background-position: 0% 50% } 100%{ background-position: 200% 50% } } @keyframes spin{ to{ transform: rotate(360deg) } } @media (prefers-reduced-motion: reduce){ .cd-box::before, .cd-box::after{ animation: none } } /* Cards, reviews */ .review-card{ border:1px solid #e2e8f0; border-radius:14px; padding:16px; background:#fff; box-shadow: var(--shadow-1); transition: transform .2s ease, box-shadow .2s ease; } .review-card:hover{ transform: translateY(-3px); box-shadow: var(--shadow-2) } /* Form improvements */ .form_inn .card{border-radius:.9rem; border:1px solid #e2e8f0; box-shadow: var(--shadow-1)} .form_inn .card-header{background:#f8fafc; border-bottom:1px solid #e2e8f0} .form-control{ border-radius:.65rem; border:1px solid #e2e8f0; padding:.65rem .75rem; transition: box-shadow .2s ease, border-color .2s ease; } .form-control:focus{ border-color: rgba(14,165,233,.7); box-shadow: 0 0 0 4px rgba(14,165,233,.12); } .order_place{ width:100%; background:linear-gradient(135deg, var(--brand), #22c55e); color:#fff; border:none; font-weight:800; letter-spacing:.2px; padding:.8rem 1rem; border-radius:.7rem; box-shadow: 0 12px 28px rgba(14,165,233,.28); transition: transform .15s ease, box-shadow .2s ease; } .order_place:hover{ transform: translateY(-2px); box-shadow: 0 16px 34px rgba(14,165,233,.36) } /* Cart table polish */ .cart_table th, .cart_table td{vertical-align:middle} .cart_table img{border-radius:8px} .quantity button{ width:28px; height:28px; border:none; border-radius:8px; background:#f1f5f9; color:#0f172a; font-weight:800; line-height:28px; cursor:pointer; transition: background .15s ease, transform .1s ease; } .quantity button:hover{ background:#e2e8f0; transform: translateY(-1px) } .quantity input{ width:40px; text-align:center; border:none; background:transparent; font-weight:700; color:#0f172a } /* Footer */ .footer{background:#0b1220; color:#cbd5e1} .footer a{color:#e2e8f0; text-decoration:none} .footer a:hover{ opacity:.85 } /* Sticky CTA glass */ .sticky-cta{ position:sticky; bottom:0; background:#ffffffed; backdrop-filter: blur(8px); border-top:1px solid #e2e8f0; padding:10px 0; z-index:100; box-shadow: 0 -8px 24px rgba(2,6,23,.08); } /* Responsive tweaks */ @media (max-width: 991px){ .hero{padding:10px 0} .hero .carousel-inner{ height: clamp(220px, 48vw, 340px) } } @media (max-width: 575px){ .btn-cta, .btn-outline-brand{ width:100% } .countdown .cd-box{ min-width: 70px } } </style>
    </head>
    <body>
         @php
            $subtotal = Cart::instance('shopping')->subtotal();
            $subtotal=str_replace(',','',$subtotal);
            $subtotal=str_replace('.00', '',$subtotal);
            $shipping = Session::get('shipping')?Session::get('shipping'):0;
        @endphp

    <!-- Hero -->
    <section class="hero">
        <div class="container">
            <div class="row align-items-center g-4">
                <div class="col-lg-6">
                    <div class="d-flex align-items-center flex-grow-1">
                            <marquee direction="left" scrollamount="5" class="btn btn-cta">
⭐ আরজামার্ট - আপনার নির্ভরযোগ্য অনলাইন শপ | নিরাপদ কেনাকাটা ✅ | মানসম্মত পণ্য 🎁 | দ্রুত ডেলিভারি 🚚 | নিশ্চিন্তে অর্ডার করুন আজই!
                            </marquee>
                        </div>
                    <span class="ribbon mb-2" style="
    display: flex;
    justify-content: center;
    margin-top: 5px;
">সীমিত সময়ের অফার চলছে</span>
                    <h1 class="mt-2 mb-3" style="
    font-size: 20px;
">QC less প্রোডাক্ট হওয়ার কারণে এত অল্প মূল্যে পাচ্ছেন টমি হিলফিগার ব্র্যান্ডের কার্গো প্যান্ট।  স্টক শেষ হবার আগে এখনই অর্ডার করুন</h1>
                    <div class="rating mb-2">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <span class="ms-2 text-muted">4.0/5 • 2k+ ক্রেতা</span>
                    </div>
                    <div class="usp"><i class="fa-solid fa-circle-check"></i> পছন্দ না হলে রিটার্ন করতে পারবেন</div>
                    <div class="usp"><i class="fa-solid fa-circle-check"></i> ঢাকা/ঢাকার বাইরে হোম ডেলিভারি</div>
                    <div class="usp"><i class="fa-solid fa-circle-check"></i> অর্ডার কনফার্মের আগে কল করা হবে</div>

                    <div class="countdown" id="countdown" aria-label="অফার শেষ হবে">
                        <div class="cd-box"><strong id="cd-days">00</strong><small>দিন</small></div>
                        <div class="cd-box"><strong id="cd-hours">00</strong><small>ঘণ্টা</small></div>
                        <div class="cd-box"><strong id="cd-min">00</strong><small>মিনিট</small></div>
                        <div class="cd-box"><strong id="cd-sec">00</strong><small>সেকেন্ড</small></div>
                    </div>

                   <div class="price-strip mb-3">
    <span class="old">৳ ৯৫০</span>
    <span class="now">এখন মাত্র ৳ ৬০০</span>
    <span class="badge save-badge">সেভ ৳ ৩৫০</span>
    <span class="deal-badge">🔥 Hot Deal</span>
</div>


                    <div class="d-flex gap-2">
                        <a href="#order_form" class="btn btn-cta"><i class="fa-solid fa-bag-shopping me-1"></i> এখনই অর্ডার করুন</a>
                        <a href="#features" class="btn btn-outline-brand"><i class="fa-regular fa-circle-question me-1"></i> বিস্তারিত</a>
                    </div>

                    <div class="trust-badges d-flex align-items-center gap-3 mt-3">
                        <img src="https://cdn-icons-png.flaticon.com/512/891/891399.png" alt="COD" title="Cash on Delivery">
                        <img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="Secure" title="Secure Checkout">
                        <img src="https://cdn-icons-png.flaticon.com/512/992/992700.png" alt="Fast" title="Fast Delivery">
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner rounded-4 shadow-sm">
                            <div class="carousel-item active">
                                <img src="{{asset($campaign_data->image_one)}}" class="d-block w-100" alt="Product Image 1">
                            </div>
                            <div class="carousel-item">
                                <img src="{{asset($campaign_data->image_two)}}" class="d-block w-100" alt="Product Image 2">
                            </div>
                            <div class="carousel-item">
                                <img src="{{asset($campaign_data->image_three)}}" class="d-block w-100" alt="Product Image 3">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features -->
    <section id="features" class="features">
        <div class="container">
            <h2 class="section-title mb-3">আপনি যা যা পাচ্ছেন</h2>
            <div class="row g-3">
                <div class="col-6 col-md-3">
                    <div class="feat-card">
                        <i class="fa-solid fa-shield-halved"></i>
                        <h6 class="mt-2 mb-1">অরিজিনাল প্রোডাক্ট</h6>
                        <p class="text-muted mb-0">১০০% জেনুইন, ভেরিফাইড সোর্স</p>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="feat-card">
                        <i class="fa-solid fa-rotate-left"></i>
                        <h6 class="mt-2 mb-1">সহজ রিটার্ন</h6>
                        <p class="text-muted mb-0"> পছন্দ না হলে রিটার্ন করতে পারবেন</p>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="feat-card">
                        <i class="fa-solid fa-truck-fast"></i>
                        <h6 class="mt-2 mb-1">দ্রুত ডেলিভারি</h6>
                        <p class="text-muted mb-0">ঢাকায় ২৪-৪৮ঘন্টা</p>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="feat-card">
                        <i class="fa-solid fa-sack-dollar"></i>
                        <h6 class="mt-2 mb-1">ক্যাশ অন ডেলিভারি</h6>
                        <p class="text-muted mb-0">প্রোডাক্ট হাতে পেয়ে পেমেন্ট</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Your Order Form Section (kept as you provided) -->
    <section class="form_sec">
        <div class="container">
           <div class="row">
             <div class="col-sm-12">
                <div class="form_inn">
                    <div class="col-sm-12">
                        <div class="row">
                <div class="col-sm-12">
                    <h2 class="campaign_offer">অফারটি সীমিত সময়ের জন্য, তাই অফার শেষ হওয়ার আগেই অর্ডার করুন</h2>
                </div>
            </div>
            <div class="row order_by">
            <div class="col-sm-5 cus-order-2">
                <div class="checkout-shipping" id="order_form">
                    <form action="{{route('customer.ordersave')}}" method="POST" data-parsley-validate="">
                    @csrf
                    <div class="card">
                        <div class="card-header">
                            <h5 class="potro_font">আপনার ইনফরমেশন দিন  </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="name">আপনার নাম লিখুন * </label>
                                        <input type="text" id="name" class="form-control @error('name') is-invalid @enderror" name="name" value="{{old('name')}}" placeholder="নাম" required>
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <!-- col-end -->
                                <div class="col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="phone">আপনার মোবাইল লিখুন *</label>
                                        <input type="number" minlength="11" id="number" maxlength="11" pattern="0[0-9]+" title="please enter number only and 0 must first character" title="Please enter an 11-digit number." id="phone" class="form-control @error('phone') is-invalid @enderror" name="phone" value="{{old('phone')}}" placeholder="+৮৮ বাদে ১১ সংখ্যা "  required>
                                        @error('phone')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <!-- col-end -->
                                <div class="col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="address">আপনার ঠিকানা লিখুন   *</label>
                                        <input type="address" id="address" class="form-control @error('address') is-invalid @enderror" placeholder="জেলা, থানা, গ্রাম " name="address" value="{{old('address')}}"  required>
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="area">আপনার এরিয়া সিলেক্ট করুন  *</label>
                                        <select type="area" id="area" class="form-control @error('area') is-invalid @enderror" name="area"   required>
                                            @foreach($shippingcharge as $key=>$value)
                                            <option value="{{$value->id}}">{{$value->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <!-- col-end -->
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <button class="order_place" type="submit">অর্ডার কন্ফার্ম করুন </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- card end -->
                </form>
                </div>
            </div>
            <!-- col end -->
            <div class="col-sm-7 cust-order-1">
                <div class="cart_details">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="potro_font">পণ্যের বিবরণ </h5>
                        </div>
                        <div class="card-body cartlist  table-responsive">
                            <table class="cart_table table table-bordered table-striped text-center mb-0">
                                <thead>
                                   <tr>
                                      <th style="width: 20%;">ডিলিট</th>
                                      <th style="width: 40%;">প্রোডাক্ট</th>
                                      <th style="width: 20%;">পরিমাণ</th>
                                      <th style="width: 20%;">মূল্য</th>
                                     </tr>
                                </thead>

                                <tbody>
                                    @foreach(Cart::instance('shopping')->content() as $value)
                                    <tr>
                                        <td>
                                            <a href="{{route('product',$value->options->slug)}}"><i class="fas fa-trash text-danger"></i></a>
                                        </td>
                                        <td class="text-left">
                                             <a style="font-size: 14px;" href="{{route('product',$value->options->slug)}}"><img src="{{asset($value->options->image)}}" height="30" width="30"> {{Str::limit($value->name,20)}}</a>
                                        </td>
                                        <td width="15%" class="cart_qty">
                                            <div class="qty-cart vcart-qty">
                                                <div class="quantity">
                                                    <button class="minus cart_decrement"  data-id="{{$value->rowId}}">-</button>
                                                    <input type="text" value="{{$value->qty}}" readonly />
                                                    <button class="plus  cart_increment" data-id="{{$value->rowId}}">+</button>
                                                </div>
                                            </div>
                                        </td>
                                        <td>৳{{$value->price*$value->qty}}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                     <tr>
                                      <th colspan="3" class="text-end px-4">মোট</th>
                                      <td>
                                       <span id="net_total"><span class="alinur">৳ </span><strong>{{$subtotal}}</strong></span>
                                      </td>
                                     </tr>
                                     <tr>
                                      <th colspan="3" class="text-end px-4">ডেলিভারি চার্জ</th>
                                      <td>
                                       <span id="cart_shipping_cost"><span class="alinur">৳ </span><strong>{{$shipping}}</strong></span>
                                      </td>
                                     </tr>
                                     <tr>
                                      <th colspan="3" class="text-end px-4">সর্বমোট</th>
                                      <td>
                                       <span id="grand_total"><span class="alinur">৳ </span><strong>{{$subtotal+$shipping}}</strong></span>
                                      </td>
                                     </tr>
                                    </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <!-- col end -->
            </div>
                    </div>
                </div>

             </div>
            </div>
        </div>
    </section>

    <!-- Reviews -->
    <section id="reviews" class="py-4">
        <div class="container">
            <h2 class="section-title mb-3">ক্রেতাদের রিভিউ</h2>
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="review-card">
                        <div class="d-flex align-items-center justify-content-between mb-1">
                            <strong>রাফি, ঢাকা</strong>
                            <span class="text-warning"><i class="fa-solid fa-star"></i> 5</span>
                        </div>
                        <p class="mb-2">প্রোডাক্ট কোয়ালিটি এককথায় অসাধারণ। ডেলিভারি খুব দ্রুত পেয়েছি।</p>
                        <small class="text-muted">ভেরিফাইড ক্রেতা</small>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="review-card">
                        <div class="d-flex align-items-center justify-content-between mb-1">
                            <strong>সাবিহা, চট্টগ্রাম</strong>
                            <span class="text-warning"><i class="fa-solid fa-star"></i> 4</span>
                        </div>
                        <p class="mb-2">প্রাইস অনুযায়ী দারুণ। প্যাকেজিং ভালো ছিল।</p>
                        <small class="text-muted">ভেরিফাইড ক্রেতা</small>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="review-card">
                        <div class="d-flex align-items-center justify-content-between mb-1">
                            <strong>শামীম, সিলেট</strong>
                            <span class="text-warning"><i class="fa-solid fa-star"></i> 5</span>
                        </div>
                        <p class="mb-2">সাপোর্ট টিম খুব হেল্পফুল। রিকমেন্ডেড!</p>
                        <small class="text-muted">ভেরিফাইড ক্রেতা</small>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ -->
    <section id="faq" class="faq py-4">
        <div class="container">
            <h2 class="section-title mb-3">প্রায় জিজ্ঞাসিত প্রশ্ন</h2>
            <div class="accordion" id="faqAcc">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#a1" aria-expanded="true">ডেলিভারি কত দিনে পাবো?</button>
                    </h2>
                    <div id="a1" class="accordion-collapse collapse show" data-bs-parent="#faqAcc">
                        <div class="accordion-body">ঢাকার ভিতরে সাধারণত ২৪-৪৮ ঘণ্টা, ঢাকার বাইরে ৩-৫ কার্যদিবস লাগে।</div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a2">পেমেন্ট কীভাবে?</button>
                    </h2>
                    <div id="a2" class="accordion-collapse collapse" data-bs-parent="#faqAcc">
                        <div class="accordion-body">ক্যাশ অন ডেলিভারি/মোবাইল ব্যাংকিং—আপনার সুবিধামতো।</div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a3">রিটার্ন/রিপ্লেসমেন্ট আছে?</button>
                    </h2>
                    <div id="a3" class="accordion-collapse collapse" data-bs-parent="#faqAcc">
                        <div class="accordion-body"> পছন্দ না হলে রিটার্ন করতে পারবেন</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer pt-4">
        <div class="container">
            <div class="row g-3">
                <div class="col-md-6">
                    <h5 class="fw-bold">আমাদের সম্পর্কে</h5>
                    <p class="mb-1">বিশ্বস্ত ই-কমার্স—অরিজিনাল প্রোডাক্ট ও বেস্ট সার্ভিস দেওয়ার প্রতিশ্রুতি।</p>
                    <small>ঠিকানা: ঢাকা, বাংলাদেশ</small>
                </div>
                <div class="col-md-3">
                    <h6 class="fw-bold">কুইক লিংক</h6>
                    <ul class="list-unstyled">
                        <li><a href="#features">ফিচার</a></li>
                        <li><a href="#reviews">রিভিউ</a></li>
                        <li><a href="#faq">FAQ</a></li>
                        <li><a href="#order_form">অর্ডার</a></li>
                    </ul>
                </div>
           <!--     <div class="col-md-3">
                    <h6 class="fw-bold">যোগাযোগ</h6>
                    <p class="mb-1"><i class="fa-solid fa-phone me-1"></i> 01700-000000</p>
                    <p class="mb-1"><i class="fa-solid fa-envelope me-1"></i> support@example.com</p>
                    <div class="d-flex gap-2">
                        <a href="#"><i class="fa-brands fa-facebook fs-5"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram fs-5"></i></a>
                        <a href="#"><i class="fa-brands fa-youtube fs-5"></i></a>
                    </div>
                </div>
            </div>
            <hr class="border-secondary">
            <div class="d-flex justify-content-between pb-3">
                <small>© {{ date('Y') }} {{ config('app.name','Shop') }}. সর্বস্বত্ব সংরক্ষিত।</small>
                <small><a href="#">টার্মস</a> • <a href="#">প্রাইভেসি</a></small>
            </div> -->
        </div>
    </footer>

    <!-- Sticky CTA -->
    <div class="sticky-cta">
        <div class="container d-flex align-items-center justify-content-between">
            <div class="d-none d-md-flex align-items-center gap-3">
                <strong>ফ্ল্যাশ সেল: </strong>
                <div class="d-flex align-items-center gap-2">
                    <i class="fa-solid fa-clock text-danger"></i>
                    <span class="text-danger">শেষ হওয়ার আগে অর্ডার করুন</span>
                </div>
            </div>
            <a href="#order_form" class="btn btn-cta"><i class="fa-solid fa-bolt me-1"></i> অর্ডার কনফার্ম করুন</a>
        </div>
    </div>
<script>
var url = 'https://cdn.waplus.io/waplus-crm/settings/ossembed.js';
var s = document.createElement('script');
s.type = 'text/javascript';
s.async = true;
s.src = url;
var options = {
"enabled": true,
"chatButtonSetting": {
"backgroundColor": "#16BE45",
"ctaText": "মেসেজ করুন",
"borderRadius": "8",
"marginLeft": "20",
"marginBottom": "70",
"marginRight": "20",
"position": "right",
"textColor": "#ffffff",
"phoneNumber": "8801951887919",
"messageText": "আমি অর্ডার করতে চাই ",
"trackClick": true
}
}
s.onload = function() {
CreateWhatsappBtn(options);
};
var x = document.getElementsByTagName('script')[0];
x.parentNode.insertBefore(s, x);
</script>
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
 <script>
(function(){
    const d = 72 * 60 * 60 * 1000; // 72h

    // LocalStorage এ চেক করা
    let end = localStorage.getItem("countdownEnd");
    if(!end){
        end = Date.now() + d;
        localStorage.setItem("countdownEnd", end);
    } else {
        end = parseInt(end, 10);
    }

    const $d = document.getElementById('cd-days');
    const $h = document.getElementById('cd-hours');
    const $m = document.getElementById('cd-min');
    const $s = document.getElementById('cd-sec');

    function pad(n){ return n.toString().padStart(2,'0'); }

    function tick(){
        const now = Date.now();
        const diff = Math.max(0, end - now);

        const days = Math.floor(diff / (1000*60*60*24));
        const hours = Math.floor((diff % (1000*60*60*24)) / (1000*60*60));
        const mins = Math.floor((diff % (1000*60*60)) / (1000*60));
        const secs = Math.floor((diff % (1000*60)) / 1000);

        if($d) $d.textContent = pad(days);
        if($h) $h.textContent = pad(hours);
        if($m) $m.textContent = pad(mins);
        if($s) $s.textContent = pad(secs);

        if(diff <= 0){
            clearInterval(timer);
            // Countdown শেষ হলে চাইলে কিছু করতে পারো
            console.log("Countdown finished!");
        }
    }

    tick();
    const timer = setInterval(tick, 1000);
})();
</script>


        <script src="{{ asset('public/frontEnd/campaign/js') }}/jquery-2.1.4.min.js"></script>
        <script src="{{ asset('public/frontEnd/campaign/js') }}/all.js"></script>
        <script src="{{ asset('public/frontEnd/campaign/js') }}/bootstrap.min.js"></script>
        <script src="{{ asset('public/frontEnd/campaign/js') }}/owl.carousel.min.js"></script>
        <script src="{{ asset('public/frontEnd/campaign/js') }}/select2.min.js"></script>
        <script src="{{ asset('public/frontEnd/campaign/js') }}/script.js"></script>
        <!-- bootstrap js -->
        <script>
            $(document).ready(function () {
                $(".owl-carousel").owlCarousel({
                    margin: 15,
                    loop: true,
                    dots: false,
                    autoplay: true,
                    autoplayTimeout: 6000,
                    autoplayHoverPause: true,
                    items: 1,
                    });
                $('.owl-nav').remove();
            });
        </script>
        <script>
            $(document).ready(function() {
                $('.select2').select2();
            });
        </script>
        <script>
             $("#area").on("change", function () {
                var id = $(this).val();
                $.ajax({
                    type: "GET",
                    data: { id: id },
                    url: "{{route('shipping.charge')}}",
                    dataType: "html",
                    success: function(response){
                        $('.cartlist').html(response);
                    }
                });
            });
        </script>
           <script>
            $(".cart_remove").on("click", function () {
                var id = $(this).data("id");
                $("#loading").show();
                if (id) {
                    $.ajax({
                        type: "GET",
                        data: { id: id },
                        url: "{{route('cart.remove')}}",
                        success: function (data) {
                            if (data) {
                                $(".cartlist").html(data);
                                $("#loading").hide();
                                return cart_count() + mobile_cart() + cart_summary();
                            }
                        },
                    });
                }
            });
            $(".cart_increment").on("click", function () {
                var id = $(this).data("id");
                $("#loading").show();
                if (id) {
                    $.ajax({
                        type: "GET",
                        data: { id: id },
                        url: "{{route('cart.increment')}}",
                        success: function (data) {
                            if (data) {
                                $(".cartlist").html(data);
                                $("#loading").hide();
                                return cart_count() + mobile_cart();
                            }
                        },
                    });
                }
            });

            $(".cart_decrement").on("click", function () {
                var id = $(this).data("id");
                $("#loading").show();
                if (id) {
                    $.ajax({
                        type: "GET",
                        data: { id: id },
                        url: "{{route('cart.decrement')}}",
                        success: function (data) {
                            if (data) {
                                $(".cartlist").html(data);
                                $("#loading").hide();
                                return cart_count() + mobile_cart();
                            }
                        },
                    });
                }
            });

        </script>
        <script>
            $('.review_slider').owlCarousel({   
                dots: false,
                arrow: false,
                autoplay: true,
                loop: true,
                margin: 10,
                smartSpeed: 1000,
                mouseDrag: true,
                touchDrag: true,
                items: 6,
                responsiveClass: true,
                responsive: {
                    300: {
                        items: 1,
                    },
                    480: {
                        items: 2,
                    },
                    768: {
                        items: 5,
                    },
                    1170: {
                        items: 5,
                    },
                }
            });
        </script>

        <script>
            $('.campro_img_slider').owlCarousel({   
                dots: false,
                arrow: false,
                autoplay: true,
                loop: true,
                margin: 10,
                smartSpeed: 1000,
                mouseDrag: true,
                touchDrag: true,
                items: 3,
                responsiveClass: true,
                responsive: {
                    300: {
                        items: 1,
                    },
                    480: {
                        items: 2,
                    },
                    768: {
                        items: 3,
                    },
                    1170: {
                        items: 3,
                    },
                }
            });
        </script>
    </body>
</html>
