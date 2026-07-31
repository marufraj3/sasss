@extends('frontEnd.layouts.master') @section('title', 'Home') @push('seo')
<meta name="app-url" content="" />
<meta name="robots" content="index, follow" />
<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- Open Graph data -->
<meta property="og:title" content="" />
<meta property="og:type" content="website" />
<meta property="og:url" content="" />
<meta property="og:image" content="{{ asset($generalsetting->white_logo) }}" />
<meta property="og:description" content="" />
@endpush @push('css')
<link rel="stylesheet" href="{{ asset('public/frontEnd/css/owl.carousel.min.css') }}" />
<link rel="stylesheet" href="{{ asset('public/frontEnd/css/owl.theme.default.min.css') }}" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css" rel="stylesheet" />
@endpush @section('content')

<style>
    @media only screen and (min-width: 320px) and (max-width: 767px) {
    .section-title-header .section-title-name {
        font-size: 20px !important;
    }
}
    .cat_item{
        padding: 0px !important;
         border: none !important;
    }
    .owl-carousel .owl-item img{
            border-radius: 20px;
    }
    #titu{
            background-color: #F4FFFE;
    
    border-radius: 10px 10px 10px 10px;
    box-shadow: 0px 0px 3px 0px #383838;
    }
   .timer_inner{
           color: #000000;
    font-family: "RocknRoll One", Sans-serif !important;
    font-size: 20px;
    font-weight: 400;
    justify-content: center !important;
        display: inline !important;
   }
   .product_item{
           border: 2px solid #919191;
   }
.categories_with_lines {
    display: flex;
    align-items: center;
    justify-content: center;
}

.categories_with_lines .line {
    height: 2px; /* line thickness */
    background-color: #000; /* line color */
    flex: 1;
    margin: 0 10px; /* text এবং line এর মধ্যে gap */
}


</style>
<section class="slider-section">
    <div class="container">
        <div class="row">
            {{-- 
            <div class="col-sm-3 hidetosm">
                <div class="sidebar-menu">
                    <ul class="hideshow">
                        @foreach ($menucategories as $key => $category)
                            <li>
                                <a href="{{ route('category', $category->slug) }}">
                                    <img src="{{ asset($category->image) }}" alt="" />
                                    {{ $category->name }}
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                                <ul class="sidebar-submenu">
                                    @foreach ($category->subcategories as $key => $subcategory)
                                        <li>
                                            <a href="{{ route('subcategory', $subcategory->slug) }}">
                                                {{ $subcategory->subcategoryName }} <i
                                                    class="fa-solid fa-chevron-right"></i> </a>
                                            <ul class="sidebar-childmenu">
                                                @foreach ($subcategory->childcategories as $key => $childcat)
                                                    <li>
                                                        <a href="{{ route('products', $childcat->slug) }}">
                                                            {{ $childcat->childcategoryName }}
                                                        </a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </li>
                                    @endforeach
                                </ul>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            --}}
            
            
    <div class="cs">
       
        <!-- Slider Section -->
<div class="home-slider-container" style="margin-bottom:20px;">
    <div class="main_slider owl-carousel">
        @foreach ($sliders as $slider)
            <div class="slider-item">
                <img src="{{ asset($slider->image) }}" alt="Slider Image" style="width:100%; border-radius:10px;"/>
            </div>
        @endforeach
    </div>
</div>
<div style="text-align:center;">
    <button type="button" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#orderGuideModal">
        📦 কিভাবে অর্ডার করবেন?
    </button>
</div>
<!-- ✅ Modal -->
<div class="modal fade" id="orderGuideModal" tabindex="-1" aria-labelledby="orderGuideModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title fw-bold" id="orderGuideModalLabel">📦 সহজে কিভাবে অর্ডার করবেন?</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body">
        <div class="steps">

          <div class="step">
            <div class="number">1</div>
            <div class="info">
              <h5>🛒 প্রোডাক্ট সিলেক্ট করুন</h5>
              <p>লিস্ট থেকে আপনার পছন্দের প্রোডাক্ট বেছে নিন এবং বিস্তারিত দেখতে ছবিতে ক্লিক করুন।</p>
            </div>
          </div>

          <div class="step">
            <div class="number">2</div>
            <div class="info">
              <h5>✅ “অর্ডার করুন” বাটনে চাপ দিন</h5>
              <p>প্রোডাক্ট পেইজে গিয়ে বড় সবুজ <b>“অর্ডার করুন”</b> বাটনে চাপ দিন।</p>
            </div>
          </div>

          <div class="step">
            <div class="number">3</div>
            <div class="info">
              <h5>✍️ আপনার তথ্য দিন</h5>
              <p>সহজ একটি ফর্ম আসবে যেখানে <b>নাম, ফোন নম্বর, ঠিকানা</b> লিখবেন।  
             </p>
            </div>
          </div>

          <div class="step">
            <div class="number">4</div>
            <div class="info">
              <h5>💳 পেমেন্ট সিলেক্ট করুন</h5>
              <p>সবচেয়ে সহজ হলো <b>Cash on Delivery</b> → ডেলিভারির সময় টাকা দিন।  
              চাইলে অনলাইন পেমেন্টও করতে পারবেন।</p>
            </div>
          </div>

          <div class="step">
            <div class="number">5</div>
            <div class="info">
              <h5>📞 কনফার্মেশন কল</h5>
              <p>অর্ডার করার পর আমাদের টিম আপনাকে ফোন করে কনফার্ম করবে। কোন সমস্যা থাকলে তখন জানাতে পারবেন।</p>
            </div>
          </div>

          <div class="step">
            <div class="number">6</div>
            <div class="info">
              <h5>🚚 ডেলিভারি গ্রহণ করুন</h5>
              <p>১-৩ দিনের মধ্যে আপনার অর্ডার করা প্রোডাক্ট কুরিয়ারে চলে আসবে। টাকা দিয়ে প্রোডাক্ট হাতে নিন।</p>
            </div>
          </div>

        </div>
      </div>

      <!-- Modal Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">❌ বন্ধ করুন</button>
      </div>
    </div>
  </div>
</div>

<!-- ✅ CSS -->
<style>
.steps {
  display: flex;
  flex-direction: column;
  gap: 15px;
}
.step {
  display: flex;
  align-items: flex-start;
  gap: 15px;
  padding: 15px;
  background: #f9f9f9;
  border-radius: 12px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  transition: transform 0.2s ease;
}
.step:hover {
  transform: translateX(5px);
  background: #eefaf0;
}
.number {
  background: #198754;
  color: #fff;
  font-weight: bold;
  font-size: 20px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.info h5 {
  margin: 0;
  color: #198754;
}
.info p {
  margin: 5px 0 0;
  font-size: 14px;
  color: #444;
}
</style>
<!-- Top Categories Section -->
<section class="homeproduct">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="sec_title">
                    <h3 class="section-title-header">
                       <div class="timer_inner">
    <div class="categories_with_lines">
        <div class="line"></div>
        <span class="section-title-name">Categories</span>
        <div class="line"></div>
    </div>
</div>
                    </h3>
                </div>
            </div>
            <div class="col-sm-12" id="titu">
                <div class="category-slider owl-carousel">
                    @foreach ($menucategories as $key => $value)
                        <div class="cat_item">
                            <div class="cat_img">
                                <a href="{{ route('category', $value->slug) }}">
                                    <img src="{{ asset($value->image) }}" alt="" />
                                </a>
                            </div>
                            <div class="cat_name">
                                <a href="{{ route('category', $value->slug) }}">
                                    {{ $value->name }}
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Owl Carousel JS -->
<script>
    $(document).ready(function(){
        $(".main_slider").owlCarousel({
            items:1,
            loop:true,
            autoplay:true,
            autoplayTimeout:3000,
            nav:true,
            dots:true
        });
    });
</script>

    </div>
           
</section>


<style type="text/css">
   
    .subcs{
        display: grid;
                   grid-template-columns:repeat(auto-fit,minmax(250px, 1fr));
    }
    .csbox{
        background:#fff;
        border-radius:10px;
        border:1px #a7c106 solid;
        padding:5px;
    }
</style>


<!-- slider end -->
<!--
<section class="homeproduct">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="sec_title">
                    <h3 class="section-title-header">
                        <div class="timer_inner">
                            <div class="">
                                <span class="section-title-name"> Top Categories </span>
                            </div>
                        </div>
                    </h3>
                </div>
            </div>

            <div class="col-sm-12">
                <div class="topcategory">
                    @foreach ($menucategories as $key => $value)
                        <div  >
                            <div>
                                <p style="text-align:center;">
                                    <a href="{{ route('category', $value->slug) }}">
                                    <img style="text-align:center;height:80px;weight:80px;border-radius:7px;border:2px #00bad7 solid;" src="{{ asset($value->image) }}" alt="" />
                                </a>
                                </p>
                                <p style="text-align:center;">
                                    <a style="text-align:center;font-weight:bold;font-size:10px;color:#fff;background:#00bad7;padding:4px;border-radius:5px;" href="{{ route('category', $value->slug) }}">
                                    {{ $value->name }}
                                </a>
                                </p>
                            </div>
                           
                        </div>
                    @endforeach
                </div>
            </div>

        </div>
    </div>
   
</section>-->



<!--
<section class="homeproduct">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="sec_title">
                    <h3 class="section-title-header">
                        <div class="timer_inner">
                            <div class="">
                                <span class="section-title-name"> Hot Deal </span>
                            </div>

                            <div class="">
                                <div class="offer_timer" id="simple_timer"></div>
                            </div>
                        </div>
                    </h3>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="product_slider owl-carousel">
                    @foreach ($hotdeal_top as $key => $value)
                        <div class="product_item wist_item wow zoomIn" data-wow-duration="1.5s"
                            data-wow-delay="0.{{ $key }}s">
                            <div class="product_item_inner">
                                @if($value->old_price)
                                <div class="sale-badge">
                                    <div class="sale-badge-inner">
                                        <div class="sale-badge-box">
                                            <span class="sale-badge-text">
                                                <p>@php $discount=(((($value->old_price)-($value->new_price))*100) / ($value->old_price)) @endphp {{ number_format($discount, 0) }}%</p>
                                                ছাড়
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                @endif
                                <div class="pro_img">
                                    <a href="{{ route('product', $value->slug) }}">
                                        <img src="{{ asset($value->image ? $value->image->image : '') }}"
                                            alt="{{ $value->name }}" />
                                    </a>
                                </div>
                                <div class="pro_des">
                                    <div class="pro_name">
                                        <a
                                            href="{{ route('product', $value->slug) }}">{{ Str::limit($value->name, 35) }}</a>
                                    </div>
                                </div>
                            </div>
                            @php
                                $averageRating = $value->reviews->avg('ratting'); 
                                $filledStars = floor($averageRating);
                                $hasHalfStar = $averageRating - $filledStars >= 0.5;
                                $emptyStars = 5 - $filledStars - ($hasHalfStar ? 1 : 0);
                            @endphp

                            @if ($averageRating >= 0 && $averageRating <= 5)
                                {{-- Filled stars --}}
                                @for ($i = 0; $i < $filledStars; $i++)
                                    <i class="fas fa-star"></i>
                                @endfor

                                {{-- Half star --}}
                                @if ($hasHalfStar)
                                    <i class="fas fa-star-half-alt"></i>
                                @endif

                                {{-- Empty stars --}}
                                @for ($i = 0; $i < $emptyStars; $i++)
                                    <i class="far fa-star"></i>
                                @endfor
                            @else
                                <span>Invalid rating range</span>
                            @endif

                             <div class="pro_price">
                                <p>
                                    <del>৳ {{ $value->old_price }}</del>
                                    ৳ {{ $value->new_price }} @if ($value->old_price)
                                    @endif
                                </p>
                            </div>
                            @if (!$value->prosizes->isEmpty() || !$value->procolors->isEmpty())
                            <div class="pro_btn">
                                <div class="cart_btn order_button">
                                    <a href="{{ route('product', $value->slug) }}"
                                        class="addcartbutton">
                                        <span>অর্ডার করুন</span>
                                    </a>
                                </div>
                               
                            </div>
                            @else
                            <div class="pro_btn">
                                <div class="cart_btn order_button">
                                       <form action="{{ route('cart.store') }}" method="POST">
                                        @csrf
                                        <input type="hidden" name="id" value="{{ $value->id }}" />
                                        <input type="hidden" name="qty" value="1" />
                                        <button type="submit">অর্ডার করুন</button>
                                    </form> 
                                </div>
                            </div>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>
            
        </div>
    </div>
</section> -->

@foreach ($homeproducts as $homecat)
    <section class="homeproduct">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="sec_title">
                       
                         <div class="timer_inner">
    <div class="categories_with_lines">
        <div class="line"></div>
        <span class="section-title-name">{{ $homecat->name }}</span>
        <div class="line"></div>
    </div>
</div>
                    </div>
                </div>
                <div style="border-radius:7px;"class="col-sm-12">
                    <div class="product_sliders">
                        @foreach ($homecat->products as $key => $value)
                           <div class="product_item wist_item">
                            <div class="product_item_inner">
                                @if($value->old_price)
                                <div class="sale-badge">
                                    <div class="sale-badge-inner">
                                        <div class="sale-badge-box">
                                            <span class="sale-badge-text">
                                                <p>@php $discount=(((($value->old_price)-($value->new_price))*100) / ($value->old_price)) @endphp {{ number_format($discount, 0) }}%</p>
                                                ছাড়
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                @endif
                                <div class="pro_img">
                                    <a href="{{ route('product', $value->slug) }}">
                                        <img src="{{ asset($value->image ? $value->image->image : '') }}"
                                            alt="{{ $value->name }}" />
                                    </a>
                                </div>
                                <div class="pro_des">
                                    <div class="pro_name">
                                        <a
                                            href="{{ route('product', $value->slug) }}">{{ Str::limit($value->name, 80) }}</a>
                                    </div>
                                    <div class="pro_price">
                                        <p>
                                            @if ($value->old_price)
                                             <del>৳ {{ $value->old_price }}</del>
                                            @endif

                                            ৳ {{ $value->new_price }} 
                                           
                                        </p>
                                    </div>
                                </div>
                            </div>

                            @if (!$value->prosizes->isEmpty() || !$value->procolors->isEmpty())
                                <div class="pro_btn">
                                    <div class="cart_btn">
                                <a data-id="{{$value->id}}" class="addcartbutton">কার্ট</a>
                            </div>
                                    <div class="cart_btn order_button">
                                        <a style="background:#007c71;" href="{{ route('product', $value->slug) }}"
                                            class="addcartbutton">অর্ডার করুন </a>
                                    </div>
                                </div>
                            @else
                                <div class="pro_btn">
                                  <div class="cart_btn">
                                <a data-id="{{$value->id}}" class="addcartbutton">কার্ট</a>
                            </div>
                                    <form action="{{ route('cart.store') }}" method="POST">
                                        @csrf
                                        <input type="hidden" name="id" value="{{ $value->id }}" />
                                        <input type="hidden" name="qty" value="1" />
                                        <button style="background:#007c71;" type="submit">অর্ডার করুন</button>
                                    </form>
                                </div>
                            @endif
                        </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-sm-12">
                    <div  class="show_more_btn">
                        <a style="float:center;border-radius:0px 0px 7px 7px;font-weight:bold;font-size:15px;background:#007c71;"href="{{ route('category', $homecat->slug) }}" class="view_more_btn">View More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endforeach

@endsection @push('script')
<script src="{{ asset('public/frontEnd/js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('public/frontEnd/js/jquery.syotimer.min.js') }}"></script>

<script>
    $(document).ready(function() {
        $(".main_slider").owlCarousel({
            items: 1,
            loop: true,
            dots: false,
            autoplay: true,
            nav: true,
            autoplayHoverPause: false,
            margin: 0,
            mouseDrag: true,
            smartSpeed: 8000,
            autoplayTimeout: 3000,
            animateOut: "fadeOutDown",
            animateIn: "slideInDown",

            navText: ["<i class='fa-solid fa-angle-left'></i>",
                "<i class='fa-solid fa-angle-right'></i>"
            ],
        });
    });
</script>
<script>
    $(document).ready(function() {
        $(".hotdeals-slider").owlCarousel({
            margin: 15,
            loop: true,
            dots: false,
            autoplay: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 3,
                    nav: true,
                },
                600: {
                    items: 3,
                    nav: false,
                },
                1000: {
                    items: 6,
                    nav: true,
                    loop: false,
                },
            },
        });
    });
</script>
<script>
    $(document).ready(function() {
        $(".category-slider").owlCarousel({
            margin: 15,
            loop: true,
            dots: false,
            autoplay: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 5,
                    nav: true,
                },
                600: {
                    items: 3,
                    nav: false,
                },
                1000: {
                    items: 8,
                    nav: true,
                    loop: false,
                },
            },
        });

        $(".product_slider").owlCarousel({
            margin: 15,
            items: 6,
            loop: true,
            dots: false,
            autoplay: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 2,
                    nav: false,
                },
                600: {
                    items: 5,
                    nav: false,
                },
                1000: {
                    items: 6,
                    nav: false,
                },
            },
        });
    });
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
