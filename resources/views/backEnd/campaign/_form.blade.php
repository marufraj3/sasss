@php($isEdit = !empty($campaign))
<div class="col-md-8">
    <label class="form-label" for="name">Landing page title <span class="text-danger">*</span></label>
    <input id="name" name="name" value="{{ old('name', optional($campaign)->name) }}" class="form-control @error('name') is-invalid @enderror" required maxlength="255" placeholder="e.g. Summer Essentials Flash Sale">
    @error('name')<div class="invalid-feedback">{{ $message }}</div>@enderror
</div>
<div class="col-md-4">
    <label class="form-label" for="status">Publication status</label>
    <select id="status" name="status" class="form-select">
        <option value="1" @selected(old('status', optional($campaign)->status ?? 1) == 1)>Published</option>
        <option value="0" @selected(old('status', optional($campaign)->status) == 0)>Draft / inactive</option>
    </select>
</div>
<div class="col-12">
    <label class="form-label" for="banner_title">Hero headline</label>
    <input id="banner_title" name="banner_title" value="{{ old('banner_title', optional($campaign)->banner_title) }}" class="form-control" maxlength="255" placeholder="A short, benefit-led headline customers will understand instantly">
</div>
<div class="col-md-4"><label class="form-label" for="cta_text">Hero CTA text</label><input id="cta_text" name="cta_text" value="{{ old('cta_text', optional($campaign)->cta_text ?: 'অফারগুলো দেখুন') }}" class="form-control" maxlength="80"></div>
<div class="col-md-4"><label class="form-label" for="starts_at">Starts at <small class="text-muted">(optional)</small></label><input id="starts_at" type="datetime-local" name="starts_at" value="{{ old('starts_at', optional(optional($campaign)->starts_at)->format('Y-m-d\TH:i')) }}" class="form-control"></div>
<div class="col-md-4"><label class="form-label" for="ends_at">Offer ends at <small class="text-muted">(countdown)</small></label><input id="ends_at" type="datetime-local" name="ends_at" value="{{ old('ends_at', optional(optional($campaign)->ends_at)->format('Y-m-d\TH:i')) }}" class="form-control"></div>
<div class="col-md-6">
    <label class="form-label" for="banner">Hero banner {!! $isEdit ? '<small class="text-muted">(leave empty to keep current)</small>' : '<span class="text-danger">*</span>' !!}</label>
    <input id="banner" type="file" accept="image/jpeg,image/png,image/webp" name="banner" class="form-control @error('banner') is-invalid @enderror" {{ $isEdit ? '' : 'required' }}>
    @if($isEdit && $campaign->banner)<small class="text-muted d-block mt-1">Current hero image is saved.</small>@endif
    @error('banner')<div class="invalid-feedback">{{ $message }}</div>@enderror
</div>
<div class="col-md-6">
    <label class="form-label" for="video">Product video URL <small class="text-muted">(optional)</small></label>
    <input id="video" type="url" name="video" value="{{ old('video', optional($campaign)->video) }}" class="form-control" placeholder="https://youtube.com/...">
</div>
<div class="col-12">
    <label class="form-label" for="product_ids">Campaign products <span class="text-danger">*</span></label>
    <select id="product_ids" class="select2 form-control @error('product_ids') is-invalid @enderror" name="product_ids[]" multiple required data-placeholder="Search and select one or more products">
        @foreach($products as $product)
            <option value="{{ $product->id }}" @selected(in_array($product->id, $selectedProductIds))>{{ $product->name }} — ৳{{ number_format($product->new_price) }} (stock: {{ $product->stock }})</option>
        @endforeach
    </select>
    <small class="text-muted">The selected order becomes the display order on the landing page. You can add up to 30 products.</small>
    @error('product_ids')<div class="text-danger small mt-1">{{ $message }}</div>@enderror
</div>
<div class="col-md-4">
    <label class="form-label" for="image_one">Product/story image {!! $isEdit ? '<small class="text-muted">(optional)</small>' : '<span class="text-danger">*</span>' !!}</label>
    <input id="image_one" type="file" accept="image/jpeg,image/png,image/webp" name="image_one" class="form-control" {{ $isEdit ? '' : 'required' }}>
</div>
<div class="col-md-4"><label class="form-label" for="image_two">Supporting image <small class="text-muted">(optional)</small></label><input id="image_two" type="file" accept="image/jpeg,image/png,image/webp" name="image_two" class="form-control"></div>
<div class="col-md-4"><label class="form-label" for="image_three">Supporting image <small class="text-muted">(optional)</small></label><input id="image_three" type="file" accept="image/jpeg,image/png,image/webp" name="image_three" class="form-control"></div>
<div class="col-12"><label class="form-label" for="short_description">Why customers should buy <span class="text-danger">*</span></label><textarea id="short_description" name="short_description" class="summernote form-control" required>{{ old('short_description', optional($campaign)->short_description) }}</textarea></div>
<div class="col-12"><label class="form-label" for="description">Details, delivery & trust information <span class="text-danger">*</span></label><textarea id="description" name="description" class="summernote form-control" required>{{ old('description', optional($campaign)->description) }}</textarea></div>
<div class="col-12"><div class="border rounded p-3 bg-light"><div class="d-flex justify-content-between"><strong>Visual landing page section order</strong><small class="text-muted">Drag sections to set display order</small></div>@php($sectionOrder=old('section_order', optional($campaign)->section_order ?: ['products','story','reviews','faq']))<div id="section-builder" class="list-group mt-2">@foreach(['products'=>'Product offer grid','story'=>'Product story & details','reviews'=>'Customer proof / reviews','faq'=>'FAQ'] as $key=>$label)<label class="list-group-item d-flex align-items-center gap-2" draggable="true" data-section="{{ $key }}"><i class="fe-move"></i><input type="checkbox" name="section_order[]" value="{{ $key }}" @checked(in_array($key,$sectionOrder))> {{ $label }}</label>@endforeach</div><div class="row mt-3"><div class="col-md-4"><div class="form-check form-switch"><input class="form-check-input" type="checkbox" name="daily_countdown" value="1" id="daily_countdown" @checked(old('daily_countdown',optional($campaign)->daily_countdown))><label class="form-check-label" for="daily_countdown">Daily 24-hour countdown reset</label></div></div><div class="col-md-4"><input type="time" name="daily_countdown_end" class="form-control" value="{{ old('daily_countdown_end',optional($campaign)->daily_countdown_end) }}"><small class="text-muted">Offer resets every day at this time</small></div></div></div></div>
@php($faqItems = old('faq_question') ? collect(old('faq_question'))->map(fn ($question, $index) => ['question' => $question, 'answer' => old('faq_answer.'.$index)])->all() : (optional($campaign)->faq_items ?? []))
<div class="col-12"><label class="form-label">Frequently asked questions <small class="text-muted">(optional; up to 3)</small></label>@for($i = 0; $i < 3; $i++) @php($faq = $faqItems[$i] ?? [])<div class="row g-2 mb-2"><div class="col-md-4"><input name="faq_question[]" class="form-control" value="{{ $faq['question'] ?? '' }}" placeholder="Question"></div><div class="col-md-8"><input name="faq_answer[]" class="form-control" value="{{ $faq['answer'] ?? '' }}" placeholder="Answer"></div></div>@endfor</div>
<div class="col-md-6"><label class="form-label" for="review">Review/source link <small class="text-muted">(optional)</small></label><input id="review" name="review" value="{{ old('review', optional($campaign)->review) }}" class="form-control" maxlength="1000" placeholder="Optional review or social proof link"></div>
<div class="col-md-6"><label class="form-label" for="image">Customer review images <small class="text-muted">(optional; multiple allowed)</small></label><input id="image" type="file" accept="image/jpeg,image/png,image/webp" name="image[]" class="form-control" multiple></div>
@if($isEdit && $campaign->images->isNotEmpty())
<div class="col-12"><div class="d-flex flex-wrap gap-2">@foreach($campaign->images as $reviewImage)<div class="position-relative"><img src="{{ asset($reviewImage->image) }}" alt="Customer review" style="height:72px;width:72px;object-fit:cover" class="rounded border"><form method="POST" action="{{ route('campaign.image.destroy') }}" class="position-absolute top-0 end-0" onsubmit="return confirm('Delete this image?')">@csrf<input type="hidden" name="id" value="{{ $reviewImage->id }}"><button type="submit" class="btn btn-sm btn-danger">×</button></form></div>@endforeach</div></div>
@endif
