@extends('frontEnd.layouts.master')
@section('title',$subcategory->subcategoryName)
@section('breadcrumb')<a href="{{ route('category', optional($subcategory->category)->slug) }}">{{ optional($subcategory->category)->name }}</a><span class="mx-2">›</span>{{ $subcategory->subcategoryName }}@endsection
@push('css')
<style>
.listing-wrap{padding:26px 0 50px}
.listing-head{display:flex;justify-content:space-between;align-items:end;margin-bottom:18px;gap:12px;flex-wrap:wrap}
.listing-head h1{font-size:24px;font-weight:850;margin:0;color:var(--ink)}
.listing-head .count{font-size:12.5px;color:var(--muted)}
.head-tools{display:flex;gap:10px;align-items:center;flex-wrap:wrap}
.filter-mobile{display:inline-flex;align-items:center;gap:6px;border:1.5px solid var(--green);color:var(--green-dark);background:#fff;padding:9px 14px;font-size:12.5px;font-weight:800;border-radius:10px;cursor:pointer}
.listing-sort{border:1.5px solid var(--line);padding:9px 12px;font-size:12.5px;font-weight:700;border-radius:10px;background:#fff;color:var(--ink);outline:0}
.listing-sort:focus{border-color:var(--green)}
.listing-layout{display:grid;grid-template-columns:248px 1fr;gap:24px;align-items:start}
.filter-card{background:#fff;border:1px solid var(--line);border-radius:var(--radius);padding:18px;position:sticky;top:86px}
.filter-block{border-bottom:1px solid var(--line);padding:12px 0}
.filter-block:last-of-type{border:0}
.filter-block h6{font-weight:850;font-size:12.5px;margin:0 0 10px;text-transform:uppercase;letter-spacing:.03em;color:var(--green-deep)}
.filter-block a{display:block;font-size:13px;padding:6px 0;color:#475569}
.filter-block a:hover,.filter-block a.on{color:var(--green-dark);font-weight:800}
.listing-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
.pager{display:flex;justify-content:center;margin-top:30px}
.pager .pagination{gap:6px}.pager .page-link{border:1.5px solid var(--line);border-radius:9px!important;color:var(--green-dark);font-weight:700;padding:8px 14px}.pager .page-item.active .page-link{background:var(--green);border-color:var(--green);color:#fff}
.empty-state{background:#fff;border:1px solid var(--line);border-radius:var(--radius);padding:50px 20px;text-align:center;color:var(--muted)}
@media(max-width:991px){.listing-layout{grid-template-columns:1fr}.filter-card{position:static;display:none}.filter-card.open{display:block}.listing-grid{grid-template-columns:repeat(3,1fr)}}
@media(max-width:767px){.listing-wrap{padding:16px 0 40px}.listing-head h1{font-size:19px}.listing-grid{grid-template-columns:repeat(2,1fr);gap:9px}.head-tools{width:100%}.filter-mobile{flex:1;justify-content:center}.listing-sort{flex:1}}
</style>
@endpush
@section('content')
<div class="fashion-container listing-wrap">
    <div class="listing-head">
        <div><h1>{{ $subcategory->subcategoryName }}</h1><span class="count">{{ $products->total() }} products found</span></div>
        <div class="head-tools">
            <button class="filter-mobile" id="toggle-filter"><i class="fa fa-sliders"></i> Filter</button>
            <form class="d-inline"><select class="listing-sort" name="sort" onchange="this.form.submit()"><option value="1" @selected(request('sort')==1)>Latest</option><option value="3" @selected(request('sort')==3)>Price High to Low</option><option value="4" @selected(request('sort')==4)>Price Low to High</option><option value="5" @selected(request('sort')==5)>Name A-Z</option></select></form>
        </div>
    </div>
    <div class="listing-layout">
        <aside class="filter-card" id="filter-panel">
            <div class="filter-block"><h6>Child Categories</h6>@foreach($childcategories as $child)<a href="{{ route('products',$child->slug) }}">{{ $child->childcategoryName }}</a>@endforeach</div>
            <div class="filter-block"><h6>Price Range</h6><form><div class="d-flex gap-2"><input class="form-control form-control-sm" name="min_price" value="{{ request('min_price') }}" placeholder="Min"><input class="form-control form-control-sm" name="max_price" value="{{ request('max_price') }}" placeholder="Max"></div><button class="btn btn-sm w-100 mt-2" style="background:var(--green);color:#fff;border:0;font-weight:800">Apply</button></form></div>
        </aside>
        <section>
            <div class="listing-grid">@forelse($products as $product)@include('frontEnd.layouts.pages.partials.product-card-v2', ['product'=>$product])@empty<div class="empty-state" style="grid-column:1/-1"><i class="fa fa-box-open" style="font-size:34px;color:var(--green);margin-bottom:10px"></i><h5 class="fw-bold">এখানে কোনো পণ্য পাওয়া যায়নি</h5><a class="btn mt-2" style="background:var(--green);color:#fff;font-weight:800" href="{{ route('home') }}">হোমে যান</a></div>@endforelse</div>
            @if($products->hasPages())<div class="pager">{{ $products->withQueryString()->links('pagination::bootstrap-4') }}</div>@endif
        </section>
    </div>
</div>
@endsection
@push('script')<script>$('#toggle-filter').on('click',function(){$('#filter-panel').toggleClass('open')})</script>@endpush
