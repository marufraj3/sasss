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
