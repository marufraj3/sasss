@if($searched ?? false)
    @if($products->isNotEmpty())
    <div class="search_product"><ul>@foreach($products as $value)<li><a href="{{ route('product', $value->slug) }}"><div class="search_img"><img src="{{ asset(optional($value->image)->image) }}" alt="{{ $value->name }}"></div><div class="search_content"><p class="name">{{ $value->name }}</p><p class="price">৳{{ number_format($value->new_price) }} @if($value->old_price)<del>৳{{ number_format($value->old_price) }}</del>@endif</p></div></a></li>@endforeach</ul></div>
    @else
    <div class="search_product p-3 text-muted small">কোনো পণ্য পাওয়া যায়নি। অন্য নামে খুঁজে দেখুন।</div>
    @endif
@endif
