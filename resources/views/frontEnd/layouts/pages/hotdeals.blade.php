@extends('frontEnd.layouts.master') 
@section('title','Hot Deals')
@push('css')
<link rel="stylesheet" href="{{asset('public/frontEnd/css/jquery-ui.css')}}" />
@endpush 
@section('content')
<style>
      @media only screen and (min-width: 320px) and (max-width: 991px) {
    .campaign_offer {
        margin-top: 0px !important;
    }
} 
#wa-widget-send-button{
        bottom: 20px !important;
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
    background: #ff4d4d;
    color: #fff;
    font-size: 10px;
    font-weight: 800;
    padding: 6px 12px;
    border-radius: 30px;
    box-shadow: 0 3px 10px rgba(255, 77, 77, 0.5);
    animation: pulseBadge 1.5s infinite;
    right: -5px;
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
    
</style>
<section class="product-section">
    <div class="container">
        <div class="sorting-section">
     
              
                
<div class="price-strip mb-3">
    <span class="old">৳ ৯৫০</span>
    <span class="now">এখন মাত্র ৳ ৬০০</span>
    <span class="badge save-badge">সেভ ৳ ৩৫০</span>
    <span class="deal-badge">🔥 Hot Deal</span>
</div>
            

        </div>
        
        <div class="row">
            <div class="col-sm-12">
                 <div class="offer_timer" id="simple_timer"></div>
            </div>
            <div class="col-sm-12">
                <div class="category-product main_product_inner">
                    @foreach($products as $key=>$value)
                    <div class="product_item wist_item  wow fadeInDown" data-wow-duration="1.5s" data-wow-delay="0.{{$key}}s">
                        <div class="product_item_inner">
                             @if($value->old_price)
                            <div class="sale-badge">
                                <div class="sale-badge-inner">
                                    <div class="sale-badge-box">
                                        <span class="sale-badge-text">
                                           <p> @php $discount=(((($value->old_price)-($value->new_price))*100) / ($value->old_price)) @endphp {{number_format($discount,0)}}%</p>
                                            ছাড়
                                        </span>
                                    </div>
                                </div>
                            </div>
                            @endif
                            <div class="pro_img">
                                <a href="{{ route('product',$value->slug) }}">
                                    <img src="{{ asset($value->image ? $value->image->image : '') }}" alt="{{$value->name}}" />
                                </a>
                              
                            </div>
                            <div class="pro_des">
                                <div class="pro_name">
                                    <a href="{{ route('product',$value->slug) }}">{{Str::limit($value->name,80)}}</a>
                                </div>
                                <div class="pro_price">
                                    <p>
                                        <del>৳ {{ $value->old_price}}</del>
                                        ৳ {{ $value->new_price}} @if($value->old_price) @endif
                                    </p>
                                </div>
                            </div>
                        </div>

                         @if(! $value->prosizes->isEmpty() || ! $value->procolors->isEmpty())
                        <div class="pro_btn">
                            
                            <div class="cart_btn order_button">
                                <a href="{{ route('product',$value->slug) }}" class="addcartbutton">অর্ডার</a>
                            </div>
                            
                        </div>
                        @else

                        <div class="pro_btn">
                           
                            <form action="{{route('cart.store')}}" method="POST">
                                @csrf
                                <input type="hidden" name="id" value="{{$value->id}}" />
                                <input type="hidden" name="qty" value="1" />
                                <button type="submit">অর্ডার</button>
                            </form>
                        </div>
                        @endif
                        
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="custom_paginate">
                    {{$products->links('pagination::bootstrap-4')}}
                   
                </div>
            </div>
        </div>
    </div>
</section>
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
"marginBottom": "0",
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

@endsection
@push('script')
<script>
    $(".sort").change(function(){
       $('#loading').show();
       $(".sort-form").submit();
    })
</script>
<script>
    $("#simple_timer").syotimer({
        date: new Date(2015, 0, 1),
        layout: "hms",
        doubleNumbers: false,
        effectType: "opacity",

        periodUnit: "d",
        periodic: true,
        periodInterval: 1,
    });
</script>
@endpush