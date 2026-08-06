@extends('backEnd.layouts.master')
@section('title', 'Create Landing Page')
@section('css')
<link href="{{ asset('public/backEnd/assets/libs/summernote/summernote-lite.min.css') }}" rel="stylesheet" />
<link href="{{ asset('public/backEnd/assets/libs/select2/css/select2.min.css') }}" rel="stylesheet" />
@endsection
@section('content')
<div class="container-fluid">
    <div class="page-title-box d-flex justify-content-between align-items-center">
        <div><h4 class="page-title mb-1">Create conversion landing page</h4><p class="text-muted mb-0">Select multiple products, then publish a focused campaign page.</p></div>
        <a href="{{ route('campaign.index') }}" class="btn btn-outline-primary">Manage landing pages</a>
    </div>
    <div class="card"><div class="card-body">
        <form action="{{ route('campaign.store') }}" method="POST" enctype="multipart/form-data" class="row g-3">
            @csrf
            @include('backEnd.campaign._form', ['campaign' => null, 'selectedProductIds' => old('product_ids', [])])
            <div class="col-12"><button class="btn btn-primary px-4" type="submit"><i class="fe-save me-1"></i>Create landing page</button></div>
        </form>
    </div></div>
</div>
@endsection
@section('script')
<script src="{{ asset('public/backEnd/assets/libs/select2/js/select2.min.js') }}"></script>
<script src="{{ asset('public/backEnd/assets/libs/summernote/summernote-lite.min.js') }}"></script>
<script>
$(function () { $('.select2').select2({width: '100%'}); $('.summernote').summernote({height: 180, placeholder: 'Write clear, benefit-led content…'}); let dragged=null; $('#section-builder label').on('dragstart',function(){dragged=this});$('#section-builder label').on('dragover',function(e){e.preventDefault()});$('#section-builder label').on('drop',function(e){e.preventDefault();if(dragged&&dragged!==this)$(this).before(dragged)}); });
</script>
@endsection
