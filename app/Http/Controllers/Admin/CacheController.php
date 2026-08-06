<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\StorefrontCache;
use Illuminate\Http\RedirectResponse;

class CacheController extends Controller
{
    public function clearStorefront(): RedirectResponse
    {
        StorefrontCache::forget();
        return back()->with('success', 'Storefront cache cleared. Latest products, banners and settings are now visible.');
    }
}
