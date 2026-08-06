<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CouponController extends Controller
{
    public function index()
    {
        $coupons = Coupon::latest()->paginate(20);
        return view('backEnd.coupon.index', compact('coupons'));
    }

    public function create()
    {
        return view('backEnd.coupon.form', ['coupon' => new Coupon()]);
    }

    public function store(Request $request)
    {
        Coupon::create($this->validatedData($request));
        return redirect()->route('coupons.index')->with('success', 'Coupon created successfully.');
    }

    public function edit(Coupon $coupon)
    {
        return view('backEnd.coupon.form', compact('coupon'));
    }

    public function update(Request $request, Coupon $coupon)
    {
        $coupon->update($this->validatedData($request, $coupon));
        return redirect()->route('coupons.index')->with('success', 'Coupon updated successfully.');
    }

    public function destroy(Coupon $coupon)
    {
        $coupon->delete();
        return back()->with('success', 'Coupon deleted.');
    }

    private function validatedData(Request $request, ?Coupon $coupon = null): array
    {
        $data = $request->validate([
            'code' => ['required', 'string', 'max:60', 'alpha_dash', 'unique:coupons,code' . ($coupon ? ',' . $coupon->id : '')],
            'type' => ['required', 'in:fixed,percent'],
            'amount' => ['required', 'integer', 'min:1'],
            'minimum_order' => ['nullable', 'integer', 'min:0'],
            'maximum_discount' => ['nullable', 'integer', 'min:1'],
            'usage_limit' => ['nullable', 'integer', 'min:1'],
            'starts_at' => ['nullable', 'date'],
            'expires_at' => ['nullable', 'date', 'after:starts_at'],
            'status' => ['nullable', 'boolean'],
        ]);

        if ($data['type'] === 'percent' && $data['amount'] > 100) {
            abort(422, 'Percentage discount cannot exceed 100%.');
        }

        $data['code'] = Str::upper($data['code']);
        $data['status'] = $request->boolean('status');
        $data['minimum_order'] = $data['minimum_order'] ?? 0;
        $data['maximum_discount'] = $data['maximum_discount'] ?? null;
        $data['usage_limit'] = $data['usage_limit'] ?? null;

        return $data;
    }
}
