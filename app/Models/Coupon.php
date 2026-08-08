<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $guarded = [];

    protected $casts = [
        'starts_at' => 'datetime',
        'expires_at' => 'datetime',
        'status' => 'boolean',
    ];

    public function isAvailableFor(int $subtotal): bool
    {
        return $this->status
            && $subtotal >= $this->minimum_order
            && (! $this->starts_at || $this->starts_at->isPast())
            && (! $this->expires_at || $this->expires_at->isFuture())
            && (! $this->usage_limit || $this->usage_count < $this->usage_limit);
    }

    /** Checks whether the current cart meets the coupon's all/product/category scope. */
    public function isApplicableToCart($cartItems): bool
    {
        if ($this->scope === 'all') {
            return true;
        }

        $productIds = collect($cartItems)->pluck('id')->map(fn ($id) => (int) $id);
        if ($this->scope === 'product') {
            return $productIds->contains((int) $this->product_id);
        }
        if ($this->scope === 'category') {
            return Product::whereIn('id', $productIds)->where('category_id', $this->category_id)->exists();
        }

        return false;
    }

    public function discountFor(int $subtotal): int
    {
        $discount = $this->type === 'percent'
            ? (int) floor($subtotal * ($this->amount / 100))
            : $this->amount;

        if ($this->maximum_discount) {
            $discount = min($discount, $this->maximum_discount);
        }

        return min($discount, $subtotal);
    }
}
