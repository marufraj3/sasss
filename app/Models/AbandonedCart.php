<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AbandonedCart extends Model
{
    protected $guarded = [];

    protected $casts = [
        'cart_data' => 'array',
        'last_activity_at' => 'datetime',
        'recovered_at' => 'datetime',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
