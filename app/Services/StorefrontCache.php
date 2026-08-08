<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;

class StorefrontCache
{
    /** Clears all currently cached storefront composition data. */
    public static function forget(): void
    {
        Cache::forget('storefront.home.v2');
        Cache::forget('storefront.shared.v2');
    }
}
