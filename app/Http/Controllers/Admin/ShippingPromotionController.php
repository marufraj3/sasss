<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ShippingPromotion;
use Illuminate\Http\Request;

class ShippingPromotionController extends Controller
{
    public function edit()
    {
        $promotion = ShippingPromotion::first() ?? new ShippingPromotion(['minimum_order' => 1000, 'status' => true]);
        return view('backEnd.shipping-promotion.edit', compact('promotion'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'minimum_order' => ['required', 'integer', 'min:1'],
            'message' => ['nullable', 'string', 'max:255'],
            'status' => ['nullable', 'boolean'],
        ]);
        $promotion = ShippingPromotion::first() ?? new ShippingPromotion();
        $promotion->minimum_order = $data['minimum_order'];
        $promotion->message = $data['message'] ?? null;
        $promotion->status = $request->boolean('status');
        $promotion->save();

        return back()->with('success', 'Free delivery promotion updated.');
    }
}
