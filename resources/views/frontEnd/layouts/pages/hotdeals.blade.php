@extends('frontEnd.layouts.master')
@section('title','Hot Deals')
@section('breadcrumb')Hot Deals@endsection
@push('css')
<style>
.hd-wrap{padding:26px 0 50px}
.hd-hero{background:linear-gradient(120deg,var(--green),var(--green-deep));border-radius:20px;padding:30px;color:#fff;display:flex;justify-content:space-between;align-items:center;gap:20px;flex-wrap:wrap;margin-bottom:26px}
.hd-hero h1{font-size:clamp(1.5rem,3vw,2.3rem);font-weight:850;margin:0 0 6px}
.hd-hero p{margin:0;opacity:.92}
.hd-hero .hd-ico{font-size:46px;opacity:.35}
.hd-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
.hd-empty{background:#fff;border:1px solid var(--line);border-radius:var(--radius);padding:60px 20px;text-align:center;color:var(--muted)}
.pager{display:flex;justify-content:center;margin-top:30px}.pager .pagination{gap:6px}.pager .page-link{border:1.5px solid var(--line);border-radius:9px!important;color:var(--green-dark);font-weight:700;padding:8px 14px}.pager .page-item.active .page-link{background:var(--green);border-color:var(--green);color:#fff}
@media(max-width:991px){.hd-grid{grid-template-columns:repeat(3,1fr)}}
@media(max-width:767px){.hd-wrap{padding:16px 0 40px}.hd-hero{padding:22px}.hd-grid{grid-template-columns:repeat(2,1fr);gap:9px}}
</style>
@endpush
@section('content')
<div class="fashion-container hd-wrap">
    <div class="hd-hero"><div><h1>🔥 আজকের Hot Deals</h1><p>স্টক থাকা পর্যন্ত বিশেষ দামে বাছাই করা পণ্য — দ্রুত অর্ডার করুন।</p></div><div class="hd-ico"><i class="fa fa-bolt"></i></div></div>
    @if($products->isNotEmpty())
    <div class="hd-grid">@foreach($products as $product)@include('frontEnd.layouts.pages.partials.product-card-v2', ['product'=>$product])@endforeach</div>
    @else
    <div class="hd-empty"><i class="fa fa-tags" style="font-size:34px;color:var(--green);margin-bottom:10px"></i><h5 class="fw-bold">এই মুহূর্তে কোনো অফার নেই</h5><p class="mb-1">শীঘ্রই নতুন অফার আসছে।</p><a class="btn mt-2" style="background:var(--green);color:#fff;font-weight:800" href="{{ route('home') }}">হোমে যান</a></div>
    @endif
    @if($products->hasPages())<div class="pager">{{ $products->links('pagination::bootstrap-4') }}</div>@endif
</div>
@endsection
