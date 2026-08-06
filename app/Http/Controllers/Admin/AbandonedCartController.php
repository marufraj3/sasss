<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AbandonedCart;
use Illuminate\Http\Request;

class AbandonedCartController extends Controller
{
    public function index(Request $request)
    {
        $status = $request->get('status', 'active');
        $carts = AbandonedCart::with('customer')
            ->when(in_array($status, ['active', 'recovered', 'ignored']), fn ($query) => $query->where('status', $status))
            ->latest('last_activity_at')
            ->paginate(25)
            ->withQueryString();

        $summary = [
            'active' => AbandonedCart::where('status', 'active')->count(),
            'recoverable_value' => AbandonedCart::where('status', 'active')->sum('subtotal'),
            'recovered' => AbandonedCart::where('status', 'recovered')->count(),
        ];

        return view('backEnd.abandoned-cart.index', compact('carts', 'status', 'summary'));
    }

    public function ignore(AbandonedCart $abandonedCart)
    {
        if ($abandonedCart->status === 'active') {
            $abandonedCart->update(['status' => 'ignored']);
        }

        return back()->with('success', 'Cart marked as ignored.');
    }
}
