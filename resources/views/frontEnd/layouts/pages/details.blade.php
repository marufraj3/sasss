
@extends('frontEnd.layouts.master')
@section('title', $details->name) 
@push('seo')
<meta name="app-url" content="{{ route('product', $details->slug) }}" />
<meta name="robots" content="index, follow" />
<meta name="description" content="{{ $details->meta_description }}" />
<meta name="keywords" content="{{ $details->slug }}" />

<!-- Twitter Card data -->
<meta name="twitter:card" content="product" />
<meta name="twitter:site" content="{{ $details->name }}" />
<meta name="twitter:title" content="{{ $details->name }}" />
<meta name="twitter:description" content="{{ $details->meta_description }}" />
<meta name="twitter:creator" content="gomobd.com" />
<meta property="og:url" content="{{ route('product', $details->slug) }}" />
<meta name="twitter:image" content="{{ asset(optional($details->image)->image) }}" />

<!-- Open Graph data -->
<meta property="og:title" content="{{ $details->name }}" />
<meta property="og:type" content="product" />
<meta property="og:url" content="{{ route('product', $details->slug) }}" />
<meta property="og:image" content="{{ asset(optional($details->image)->image) }}" />
<meta property="og:description" content="{{ $details->meta_description }}" />
<meta property="og:site_name" content="{{ $details->name }}" />
@endpush

@push('css')
<link rel="stylesheet" href="{{ asset('public/frontEnd/css/zoomsl.css') }}">
<style>
.product-trust-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:8px;margin:14px 0}.product-trust-grid div{padding:9px 7px;background:#f2faf6;border:1px solid #dcece3;border-radius:8px;text-align:center;font-size:12px;font-weight:700;color:#24533f}.product-save{display:inline-block;margin:4px 0 12px;background:#fff0e6;color:#b8520a;padding:5px 9px;border-radius:5px;font-size:.9rem;font-weight:700}.stock-status{font-size:.9rem;font-weight:700;color:#087f5b}@media(max-width:575px){.product-trust-grid{grid-template-columns:1fr}.single_product{gap:8px}.single_product input{width:100%}}
</style>
@endpush

@section('content')
<div class="homeproduct main-details-page">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <section class="product-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 position-relative">
                                @if($details->old_price)
                                <div class="product-details-discount-badge">
                                    <div class="sale-badge">
                                        <div class="sale-badge-inner">
                                            <div class="sale-badge-box">
                                                <span class="sale-badge-text">
                                                    <p> @php $discount=(((($details->old_price)-($details->new_price))*100) / ($details->old_price)) @endphp {{ number_format($discount, 0) }}%</p>
                                                    ছাড়
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @endif
                                <div class="details_slider owl-carousel">
                                    @foreach ($details->images as $value)
                                        <div class="dimage_item">
                                            <img src="{{ asset($value->image) }}" class="block__pic" />
                                        </div>
                                    @endforeach
                                </div>
                                <div
                                    class="indicator_thumb @if ($details->images->count() > 4) thumb_slider owl-carousel @endif">
                                    @foreach ($details->images as $key => $image)
                                        <div class="indicator-item" data-id="{{ $key }}">
                                            <img src="{{ asset($image->image) }}" />
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="details_right">
                                    <div class="breadcrumb">
                                        <ul>
                                            <li><a href="{{ url('/') }}">Home</a></li>
                                            <li><span>/</span></li>
                                            <li><a
                                                    href="{{ url('/category/' . $details->category->slug) }}">{{ $details->category->name }}</a>
                                            </li>
                                            @if ($details->subcategory)
                                                <li><span>/</span></li>
                                                <li><a
                                                        href="#">{{ $details->subcategory ? $details->subcategory->subcategoryName : '' }}</a>
                                                </li>
                                                @endif @if ($details->childcategory)
                                                    <li><span>/</span></li>
                                                    <li><a
                                                            href="#">{{ $details->childcategory->childcategoryName }}</a>
                                                    </li>
                                                @endif
                                        </ul>
                                    </div>

                                    <div class="product">
                                        <div class="product-cart">
                                            <p class="name">{{ $details->name }}</p>
                                            <p class="details-price">
                                                @if ($details->old_price)
                                                    <del>৳{{ $details->old_price }}</del>
                                                @endif ৳{{ $details->new_price }}
                                            </p>
                                            @if($details->old_price && $details->old_price > $details->new_price)
                                                <span class="product-save">আপনি সাশ্রয় করছেন ৳{{ number_format($details->old_price - $details->new_price) }}</span>
                                            @endif
                                            <div class="product-trust-grid">
                                                <div><i class="fa fa-truck"></i><br>দ্রুত ডেলিভারি</div>
                                                <div><i class="fa fa-money-bill-wave"></i><br>ক্যাশ অন ডেলিভারি</div>
                                                <div><i class="fa fa-shield-alt"></i><br>নিরাপদ অর্ডার</div>
                                            </div>
                                            @if($details->stock > 0)<div class="stock-status"><i class="fa fa-circle-check"></i> স্টকে আছে — আজই অর্ডার করুন</div>@endif
                                            <div class="mt-2">
                                                @auth('customer')
                                                    @if($isWishlisted)
                                                        <a href="{{ route('customer.wishlist') }}" class="btn btn-sm btn-outline-danger"><i class="fa fa-heart"></i> Wishlist-এ আছে</a>
                                                    @else
                                                        <form action="{{ route('customer.wishlist.store') }}" method="POST" class="d-inline">@csrf<input type="hidden" name="product_id" value="{{ $details->id }}"><button class="btn btn-sm btn-outline-secondary" type="submit"><i class="fa fa-heart"></i> Wishlist-এ রাখুন</button></form>
                                                    @endif
                                                @else
                                                    <a href="{{ route('customer.login') }}" class="btn btn-sm btn-outline-secondary"><i class="fa fa-heart"></i> Wishlist-এর জন্য লগইন করুন</a>
                                                @endauth
                                            </div>

                                            @if($details->note)
                                            <div class="">
                                                <span class="text-danger font-italic fs-5"><strong class="bg-danger text-light px-1 py-1">Note :</strong> <strong> {{ $details->note }}</strong> </span>
                                            </div>
                                            @endif
                                            <form action="{{ route('cart.store') }}" method="POST" name="formName">
                                                @csrf
                                                <input type="hidden" name="id" value="{{ $details->id }}" />
                                                @if ($productcolors->count() > 0)
                                                    <div class="pro-color" style="width: 100%;">
                                                        <div class="color_inner">
                                                            <p>Color -</p>
                                                            <div class="size-container">
                                                                <div class="selector">
                                                                    @foreach ($productcolors as $procolor)
                                                                        <div class="selector-item">
                                                                            <input type="radio"
                                                                                id="fc-option{{ $procolor->id }}"
                                                                                value="{{ $procolor->color ? $procolor->color->colorName : '' }}"
                                                                                name="product_color"
                                                                                class="selector-item_radio emptyalert"
                                                                                required />
                                                                            <label for="fc-option{{ $procolor->id }}"
                                                                                style="margin-right:5px;background-color: {{ $procolor->color ? $procolor->color->color : '' }}"
                                                                                class="selector-item_label">
                                                                                
                                                                                <span>
                                                                                    <img src="{{ asset('public/frontEnd/images') }}/check-icon.svg"
                                                                                        alt="Checked Icon" />
                                                                                       
                                                                                </span>
                                                                                
                                                                            </label>
                                                                             {{$procolor->color->colorName}}
                                                                        </div>
                                                                    @endforeach
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @endif @if ($productsizes->count() > 0)
                                                        <div class="pro-size" style="width: 100%;">
                                                            <div class="size_inner">
                                                                <p>Size - <span class="attibute-name"></span></p>
                                                                <div class="size-container">
                                                                    <div class="selector">
                                                                        @foreach ($productsizes as $prosize)
                                                                            <div class="selector-item">
                                                                                <input type="radio"
                                                                                    id="f-option{{ $prosize->id }}"
                                                                                    value="{{ $prosize->size ? $prosize->size->sizeName : '' }}"
                                                                                    name="product_size"
                                                                                    class="selector-item_radio emptyalert"
                                                                                    required />
                                                                                <label
                                                                                    for="f-option{{ $prosize->id }}"
                                                                                    class="selector-item_label">{{ $prosize->size ? $prosize->size->sizeName : '' }}</label>
                                                                            </div>
                                                                        @endforeach
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        @endif
                                                        @if ($details->pro_unit)
                                                            <div class="pro_unig">
                                                                <label>Unit: {{ $details->pro_unit }}</label>
                                                                <input type="hidden" name="pro_unit"
                                                                    value="{{ $details->pro_unit }}" />
                                                            </div>
                                                        @endif
                                                        <div class="pro_brand">
                                                            <p>Brand :
                                                                {{ $details->brand ? $details->brand->name : 'N/A' }}
                                                            </p>
                                                        </div>
                                                        
                                                        @if($details->stock < 1)
                                                        <p class="text-danger text-center border border-danger p-2">স্টক আউট</p>
                                                        @else
                                                        
                                                        <div class="row">
                                                            <div class="qty-cart col-sm-12">
                                                                <div class="quantity">
                                                                    <span class="minus">-</span>
                                                                    <input type="text" name="qty"
                                                                        value="1" />
                                                                    <span class="plus">+</span>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex single_product col-sm-12">
                                                                <input type="submit" class="btn px-4 add_cart_btn"
                                                                    onclick="return sendSuccess();" name="add_cart"
                                                                    value="কার্টে যোগ করুন " />

                                                                <input type="submit"
                                                                    class="btn px-4 order_now_btn order_now_btn_m"
                                                                    onclick="return sendSuccess();" name="order_now"
                                                                    value="অর্ডার করুন" />
                                                            </div>
                                                        </div>
                                                        
                                                        @endif
                                                        <div class="mt-md-2 mt-2 ">
                                                           
                                                            <div class="shadow mt-2">
                                                                <a href="tel:{{ $contact->hotline }}" 
                                                                class="btn btn-primary  d-block   text-light fw-bolder">
                                                                    কল করুন <i class="fa-solid fa-phone"></i> {{ $contact->hotline }} 
                                                                    </a>
                                                             </div>
                                                             <div class="shadow mt-2">
                                                                <a href="https://wa.me/88{{ $contact->hotline }}?text={{ urlencode('Hello, I am interested in your product: ' . $details->name . '. Here is the link: ' . url('/products/' . $details->slug)) }}" 
   target="_blank" 
   class="btn btn-success d-block text-light fw-bolder">
    Whatsapp <i class="fa-brands fa-whatsapp"></i> 88{{ $contact->hotline }}
</a>

                                                             </div>
                                                          
                                                        </div>
                                                        <div class="mt-md-2 mt-2">
                                                            <table class="table table-bordered border-1 border-dark">
                                                                <tr>
                                                                    <th colspan="2" class="text-center">
                                                                        কুরিয়ার ডেলিভারি খরচ
                                                                    </th>
                                                                </tr>
                                                                @foreach ($shippingcharge as $key => $value)
                                                                <tr>
                                                                    <td>{{ $value->name }}</td>
                                                                    <td class="text-end">৳ {{ $value->amount }}</td>
                                                                </tr>
                                                                 @endforeach
                                                            </table>
                                                            {{--<div class="del_charge_area">
                                                                <div class="alert alert-info text-m">
                                                                    <div class="flext_area">
                                                                        
                                                                        <i class="fa-solid fa-cubes"></i>
                                                                        <div>

                                                                            @foreach ($shippingcharge as $key => $value)
                                                                                <h4>{{ $value->name }} </h4>
                                                                            @endforeach
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>--}}
                                                        </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>

<div class="description-nav-wrapper">
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <div class="description-nav">
                    <ul class="desc-nav-ul">
                        {{-- <li class="active">
                            <a href="#specification" target="_self">Specification</a>
                        </li> --}}
                        <li>
                            <a href="#description" target="_self">Description</a>
                        </li>
                        <li>
                            <a href="#orderpolicy" target="_self">Order Policy</a>
                        </li>
                        <li>
                            <a href="#writeReview" target="_self">Reviews ({{ $reviews->count() }}) </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="pro_details_area">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="description tab-content details-action-box" id="description">
                    <h2>বিস্তারিত</h2>
                    <p>{!! $details->description !!}</p>
                </div>
                 <div class="description tab-content details-action-box" id="orderpolicy">
                    <h2>Order Policy</h2>
                    <p>{!! $generalsetting ->order_policy !!}</p>
                </div>
                
                <div class="tab-content details-action-box" id="writeReview">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="section-head">
                                    <div class="title">
                                        <h2>Reviews ({{ $reviews->count() }})</h2>
                                        <p>Get specific details about this product from customers who own it.</p>
                                    </div>
                                    <div class="action">
                                        <div>
                                            <button type="button" class="details-action-btn question-btn btn-overlay"
                                                data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Write a review
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                @if ($reviews->count() > 0)
                                    <div class="customer-review">
                                        <div class="row">
                                            @foreach ($reviews as $key => $review)
                                                <div class="col-sm-12 col-12">
                                                    <div class="review-card">
                                                        <p class="reviewer_name"><i data-feather="message-square"></i>
                                                            {{ $review->name }}</p>
                                                        <p class="review_data">{{ $review->created_at->format('d-m-Y') }}</p>
                                                        <p class="review_star">{!! str_repeat('<i class="fa-solid fa-star"></i>', $review->ratting) !!}</p>
                                                        <p class="review_content">{{ $review->review }}</p>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @else
                                    <div class="empty-content">
                                        <i class="fa fa-clipboard-list"></i>
                                        <p class="empty-text">This product has no reviews yet. Be the first one to write a review.</p>
                                    </div>
                                @endif
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog  modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Your review</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="insert-review">
                                                    @if (Auth::guard('customer')->user())
                                                        <form action="{{ route('customer.review') }}" id="review-form"
                                                            method="POST">
                                                            @csrf
                                                            <input type="hidden" name="product_id" value="{{ $details->id }}">
                                                            <div class="fz-12 mb-2">
                                                                <div class="rating">
                                                                    <label title="Excelent">
                                                                        ☆
                                                                        <input required type="radio" name="ratting"
                                                                            value="5" />
                                                                    </label>
                                                                    <label title="Best">
                                                                        ☆
                                                                        <input required type="radio" name="ratting"
                                                                            value="4" />
                                                                    </label>
                                                                    <label title="Better">
                                                                        ☆
                                                                        <input required type="radio" name="ratting"
                                                                            value="3" />
                                                                    </label>
                                                                    <label title="Very Good">
                                                                        ☆
                                                                        <input required type="radio" name="ratting"
                                                                            value="2" />
                                                                    </label>
                                                                    <label title="Good">
                                                                        ☆
                                                                        <input required type="radio" name="ratting"
                                                                            value="1" />
                                                                    </label>
                                                                </div>
                                                            </div>
                
                                                            <div class="form-group">
                                                                <label for="message-text" class="col-form-label">Message:</label>
                                                                <textarea required class="form-control radius-lg" name="review" id="message-text"></textarea>
                                                                <span id="validation-message" style="color: red;"></span>
                                                            </div>
                                                            <div class="form-group">
                                                                <button class="details-review-button" type="submit">Submit
                                                                    Review</button>
                                                            </div>
                
                                                        </form>
                                                    @else
                                                        <a class="customer-login-redirect" href="{{ route('customer.login') }}">Login
                                                            to Post
                                                            Your Review</a>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           @if(!empty($details->pro_video))
<div class="col-sm-4">
    <div class="pro_vide">
        <h2>ভিডিও</h2>
        <iframe 
            src="https://www.facebook.com/plugins/video.php?href={{ urlencode($details->pro_video) }}&show_text=0&width=560" 
            width="100%" height="315" 
            style="border:none;overflow:hidden" 
            scrolling="no" 
            frameborder="0" 
            allowfullscreen="true" 
            allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share">
        </iframe>
    </div>
</div>
@endif
        </div>
    </div>
</section>

@if($recommendedProducts->isNotEmpty())
<section class="related-product-section" style="background:#f5faf7; padding:26px 0; margin-top:24px;">
    <div class="container">
        <div class="related-title"><h3 style="font-weight:800;">একসাথে কিনলে ভালো লাগতে পারে</h3><p>এই পণ্যটির সাথে customer-রা এগুলোও পছন্দ করেন</p></div>
        <div class="row g-3">
            @foreach($recommendedProducts as $recommendedProduct)
            <div class="col-6 col-md-3"><div class="card h-100 border-0 shadow-sm"><a href="{{ route('product', $recommendedProduct->slug) }}"><img loading="lazy" src="{{ asset(optional($recommendedProduct->image)->image ?: 'public/uploads/default/product.png') }}" alt="{{ $recommendedProduct->name }}" class="card-img-top" style="aspect-ratio:1;object-fit:cover"></a><div class="card-body p-3"><a href="{{ route('product', $recommendedProduct->slug) }}" class="text-decoration-none text-dark fw-bold">{{ Str::limit($recommendedProduct->name, 42) }}</a><p class="text-success fw-bold my-2">৳{{ number_format($recommendedProduct->new_price) }}</p>@if($recommendedProduct->prosizes->isNotEmpty() || $recommendedProduct->procolors->isNotEmpty())<a href="{{ route('product', $recommendedProduct->slug) }}" class="btn btn-sm btn-outline-success w-100">অপশন দেখুন</a>@else<form action="{{ route('cart.store') }}" method="POST">@csrf<input type="hidden" name="id" value="{{ $recommendedProduct->id }}"><input type="hidden" name="qty" value="1"><button name="add_cart" class="btn btn-sm btn-success w-100">কার্টে যোগ করুন</button></form>@endif</div></div></div>
            @endforeach
        </div>
    </div>
</section>
@endif
<section class="related-product-section">
    <div class="container">
        <div class="row">
            <div class="related-title">
                <h5>Related Product</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="product-inner owl-carousel related_slider">
                    @foreach ($products as $key => $value)
                        <div class="product_item wist_item wow fadeInDown" data-wow-duration="1.5s"
                            data-wow-delay="0.{{ $key }}s">
                            <div class="product_item_inner">
                                @if($value->old_price)
                                <div class="sale-badge">
                                    <div class="sale-badge-inner">
                                        <div class="sale-badge-box">
                                            <span class="sale-badge-text">
                                                <p>@php 
                                                $discount=(((($value->old_price)-($value->new_price))*100) / ($value->old_price)) 
                                                @endphp 
                                                {{ number_format($discount, 0) }}%</p>
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
                                    @if($value->stock < 1)
                                    <div class="stock-out-overlay">STOCK OUT</div>
                                    @endif
                                </div>
                                <div class="pro_des">
                                    <div class="pro_name">
                                        <a
                                            href="{{ route('product', $value->slug) }}">{{ Str::limit($value->name, 80) }}</a>
                                    </div>
                                    <div class="pro_price">
                                        <p>
                                            <del>৳ {{ $value->old_price }}</del>
                                            ৳ {{ $value->new_price }} @if ($value->old_price)
                                            @endif
                                        </p>
                                    </div>
                                </div>
                            </div>

                            @if (!$value->prosizes->isEmpty() || !$value->procolors->isEmpty() || !$value->stock)
                                <div class="pro_btn">
                                   
                                    <div class="cart_btn order_button">
                                        <a href="{{ route('product', $value->slug) }}"
                                            class="addcartbutton">অর্ডার করুন</a>
                                    </div>
                                </div>
                            @else
                                <div class="pro_btn">
                                  
                                    <form action="{{ route('cart.store') }}" method="POST">
                                        @csrf
                                        <input type="hidden" name="id" value="{{ $value->id }}" />
                                        <input type="hidden" name="qty" value="1" />
                                        <button type="submit">অর্ডার করুন</button>
                                    </form>
                                </div>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

@endsection @push('script')
<script src="{{ asset('public/frontEnd/js/owl.carousel.min.js') }}"></script>

<script src="{{ asset('public/frontEnd/js/zoomsl.min.js') }}"></script>

<script>
    $(document).ready(function() {
        $(".details_slider").owlCarousel({
            margin: 15,
            items: 1,
            loop: true,
            dots: false,
            autoplay: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
        });
        $(".indicator-item").on("click", function() {
            var slideIndex = $(this).data("id");
            $(".details_slider").trigger("to.owl.carousel", slideIndex);
        });
    });
</script>
<!-- Ecommerce tracking -->
@php
    $analyticsItem = [
        'item_id' => (string) $details->id,
        'item_name' => $details->name,
        'price' => (float) $details->new_price,
        'item_brand' => optional($details->brand)->name,
        'item_category' => optional($details->category)->name,
        'item_variant' => $details->pro_unit,
        'currency' => 'BDT',
        'quantity' => 1,
    ];
@endphp
<script>
(function () {
    const item = @json($analyticsItem);
    window.dataLayer = window.dataLayer || [];
    dataLayer.push({ ecommerce: null });
    dataLayer.push({ event: 'view_item', ecommerce: { currency: 'BDT', value: item.price, items: [item] } });
    if (typeof window.fbq === 'function') {
        fbq('track', 'ViewContent', { content_ids: [item.item_id], content_name: item.item_name, content_type: 'product', value: item.price, currency: 'BDT' });
    }
    document.querySelectorAll('input[name="add_cart"], input[name="order_now"]').forEach(function (button) {
        button.addEventListener('click', function () {
            const quantity = Number(document.querySelector('input[name="qty"]')?.value || 1);
            const trackedItem = Object.assign({}, item, { quantity: quantity });
            dataLayer.push({ ecommerce: null });
            dataLayer.push({ event: 'add_to_cart', ecommerce: { currency: 'BDT', value: trackedItem.price * quantity, items: [trackedItem] } });
            if (typeof window.fbq === 'function') fbq('track', 'AddToCart', { content_ids: [item.item_id], content_type: 'product', value: trackedItem.price * quantity, currency: 'BDT' });
        });
    });
})();
</script>
<script>
    $(document).ready(function() {
        $(".related_slider").owlCarousel({
            margin: 10,
            items: 6,
            loop: true,
            dots: true,
            nav: true,
            autoplay: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 2,
                    nav: true,
                },
                600: {
                    items: 3,
                    nav: false,
                },
                1000: {
                    items: 6,
                    nav: true,
                    loop: true,
                },
            },
        });
        // $('.owl-nav').remove();
    });
</script>
<script>
    $(document).ready(function() {
        $(".minus").click(function() {
            var $input = $(this).parent().find("input");
            var count = parseInt($input.val()) - 1;
            count = count < 1 ? 1 : count;
            $input.val(count);
            $input.change();
            return false;
        });
        $(".plus").click(function() {
            var $input = $(this).parent().find("input");
            $input.val(parseInt($input.val()) + 1);
            $input.change();
            return false;
        });
    });
</script>

<script>
    function sendSuccess() {
        // size validation
        size = document.forms["formName"]["product_size"].value;
        if (size != "") {
            // access
        } else {
            toastr.warning("Please select any size");
            return false;
        }
        color = document.forms["formName"]["product_color"].value;
        if (color != "") {
            // access
        } else {
            toastr.error("Please select any color");
            return false;
        }
    }
</script>
<script>
    $(document).ready(function() {
        $(".rating label").click(function() {
            $(".rating label").removeClass("active");
            $(this).addClass("active");
        });
    });
</script>
<script>
    $(document).ready(function() {
        $(".thumb_slider").owlCarousel({
            margin: 15,
            items: 4,
            loop: true,
            dots: false,
            nav: true,
            autoplayTimeout: 6000,
            autoplayHoverPause: true,
        });
    });
</script>

<script type="text/javascript">
    $(".block__pic").imagezoomsl({
        zoomrange: [3, 3]
    });
</script>
@endpush
