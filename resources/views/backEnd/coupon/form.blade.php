@extends('backEnd.layouts.master')
@section('title', $coupon->exists ? 'Edit Coupon' : 'Create Coupon')
@section('content')
<div class="container-fluid"><div class="page-title-box d-flex justify-content-between align-items-center"><div><h4 class="page-title">{{ $coupon->exists ? 'Edit coupon' : 'Create coupon' }}</h4><p class="text-muted mb-0">Use clear rules so discounts remain profitable.</p></div><a href="{{ route('coupons.index') }}" class="btn btn-outline-primary">All coupons</a></div>
<div class="card"><div class="card-body"><form class="row g-3" method="POST" action="{{ $coupon->exists ? route('coupons.update', $coupon) : route('coupons.store') }}">@csrf @if($coupon->exists) @method('PUT') @endif
<div class="col-md-5"><label class="form-label">Coupon code *</label><input class="form-control @error('code') is-invalid @enderror" name="code" value="{{ old('code', $coupon->code) }}" required placeholder="WELCOME10"><small class="text-muted">Letters, numbers, dashes and underscores only.</small>@error('code')<div class="invalid-feedback">{{ $message }}</div>@enderror</div>
<div class="col-md-3"><label class="form-label">Discount type *</label><select class="form-select" name="type"><option value="fixed" @selected(old('type', $coupon->type) === 'fixed')>Fixed amount (৳)</option><option value="percent" @selected(old('type', $coupon->type) === 'percent')>Percentage (%)</option></select></div>
<div class="col-md-4"><label class="form-label">Discount amount *</label><input type="number" min="1" class="form-control" name="amount" value="{{ old('amount', $coupon->amount) }}" required></div>
<div class="col-md-4"><label class="form-label">Minimum order amount</label><input type="number" min="0" class="form-control" name="minimum_order" value="{{ old('minimum_order', $coupon->minimum_order ?? 0) }}"></div>
<div class="col-md-4"><label class="form-label">Maximum discount <small class="text-muted">(for %)</small></label><input type="number" min="1" class="form-control" name="maximum_discount" value="{{ old('maximum_discount', $coupon->maximum_discount) }}"></div>
<div class="col-md-4"><label class="form-label">Total usage limit</label><input type="number" min="1" class="form-control" name="usage_limit" value="{{ old('usage_limit', $coupon->usage_limit) }}" placeholder="Unlimited"></div>
<div class="col-md-6"><label class="form-label">Starts at</label><input type="datetime-local" class="form-control" name="starts_at" value="{{ old('starts_at', optional($coupon->starts_at)->format('Y-m-d\TH:i')) }}"></div>
<div class="col-md-6"><label class="form-label">Expires at</label><input type="datetime-local" class="form-control" name="expires_at" value="{{ old('expires_at', optional($coupon->expires_at)->format('Y-m-d\TH:i')) }}"></div>
<div class="col-12"><div class="form-check form-switch"><input class="form-check-input" type="checkbox" name="status" value="1" id="status" @checked(old('status', $coupon->exists ? $coupon->status : true))><label class="form-check-label" for="status">Coupon is active</label></div></div>
<div class="col-12"><button class="btn btn-primary px-4">{{ $coupon->exists ? 'Save changes' : 'Create coupon' }}</button></div>
</form></div></div></div>
@endsection
