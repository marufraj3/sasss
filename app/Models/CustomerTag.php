<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerTag extends Model
{
    protected $guarded = [];

    public function customers()
    {
        return $this->belongsToMany(Customer::class, 'customer_customer_tag');
    }
}
