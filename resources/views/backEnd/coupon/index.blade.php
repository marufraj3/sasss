@extends('backEnd.layouts.master')
@section('title', 'Coupons')
@section('content')
<div class="container-fluid">
    <div class="page-title-box d-flex justify-content-between align-items-center"><div><h4 class="page-title mb-1">Coupons & promotions</h4><p class="text-muted mb-0">Create controlled discounts for campaigns and repeat purchases.</p></div><a href="{{ route('coupons.create') }}" class="btn btn-primary"><i class="fe-plus me-1"></i>Create coupon</a></div>
    @if(session('success'))<div class="alert alert-success">{{ session('success') }}</div>@endif
    <div class="card"><div class="card-body table-responsive"><table class="table table-hover align-middle mb-0"><thead><tr><th>Code</th><th>Discount</th><th>Rules</th><th>Usage</th><th>Valid until</th><th>Status</th><th class="text-end">Action</th></tr></thead><tbody>
    @forelse($coupons as $coupon)<tr><td><strong>{{ $coupon->code }}</strong></td><td>{{ $coupon->type === 'percent' ? $coupon->amount.'%' : '৳'.number_format($coupon->amount) }} @if($coupon->maximum_discount)<br><small class="text-muted">Max ৳{{ number_format($coupon->maximum_discount) }}</small>@endif</td><td>Min. ৳{{ number_format($coupon->minimum_order) }}</td><td>{{ $coupon->usage_count }} / {{ $coupon->usage_limit ?: '∞' }}</td><td>{{ $coupon->expires_at ? $coupon->expires_at->format('d M Y, h:i A') : 'No expiry' }}</td><td><span class="badge {{ $coupon->status ? 'bg-soft-success text-success' : 'bg-soft-secondary text-secondary' }}">{{ $coupon->status ? 'Active' : 'Inactive' }}</span></td><td class="text-end"><a href="{{ route('coupons.edit', $coupon) }}" class="btn btn-sm btn-outline-primary">Edit</a><form class="d-inline" method="POST" action="{{ route('coupons.destroy', $coupon) }}" onsubmit="return confirm('Delete this coupon?')">@csrf @method('DELETE')<button class="btn btn-sm btn-outline-danger">Delete</button></form></td></tr>@empty<tr><td colspan="7" class="text-center text-muted py-5">No coupons yet. Create your first campaign code.</td></tr>@endforelse
    </tbody></table><div class="mt-3">{{ $coupons->links() }}</div></div></div>
</div>
@endsection
