<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $casts = [
        'starts_at' => 'datetime',
        'ends_at' => 'datetime',
        'faq_items' => 'array',
    ];

    /**
     * Legacy primary product relation. Kept so existing campaigns continue to work.
     */
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id')
            ->select('id', 'name', 'slug', 'old_price', 'new_price', 'stock', 'status');
    }

    /** Products displayed on a multi-product landing page, in admin-defined order. */
    public function products()
    {
        return $this->belongsToMany(Product::class, 'campaigns_products', 'campaign_id', 'product_id')
            ->withPivot('sort_order')
            ->withTimestamps()
            ->orderBy('campaigns_products.sort_order');
    }

    public function images()
    {
        return $this->hasMany(CampaignReview::class, 'campaign_id')
            ->select('id', 'image', 'campaign_id');
    }
}
