<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\OrderDetails;
use App\Models\OrderStatus;
use App\Models\ProductEvent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductAnalyticsController extends Controller
{
    public function index(Request $request)
    {
        $days = min(max((int) $request->get('days', 30), 1), 365);
        $from = now()->subDays($days - 1)->startOfDay();
        $completedStatus = OrderStatus::where('slug', 'completed')->value('id') ?? 6;

        $events = ProductEvent::query()
            ->select('product_id', DB::raw("SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) as views"), DB::raw("SUM(CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END) as cart_adds"))
            ->where('created_at', '>=', $from)
            ->groupBy('product_id');

        $sales = OrderDetails::query()
            ->select('product_id', DB::raw('SUM(qty) as units_ordered'), DB::raw('SUM(qty * sale_price) as revenue'))
            ->whereHas('order', fn ($query) => $query->where('order_status', $completedStatus)->where('created_at', '>=', $from))
            ->groupBy('product_id');

        $products = DB::table('products')
            ->leftJoinSub($events, 'events', fn ($join) => $join->on('products.id', '=', 'events.product_id'))
            ->leftJoinSub($sales, 'sales', fn ($join) => $join->on('products.id', '=', 'sales.product_id'))
            ->select('products.id', 'products.name', 'products.slug', DB::raw('COALESCE(events.views, 0) as views'), DB::raw('COALESCE(events.cart_adds, 0) as cart_adds'), DB::raw('COALESCE(sales.units_ordered, 0) as units_ordered'), DB::raw('COALESCE(sales.revenue, 0) as revenue'))
            ->where('products.status', 1)
            ->orderByDesc('views')
            ->paginate(30)
            ->withQueryString();

        $summary = [
            'views' => ProductEvent::where('event_type', 'view')->where('created_at', '>=', $from)->count(),
            'cart_adds' => ProductEvent::where('event_type', 'add_to_cart')->where('created_at', '>=', $from)->count(),
            'completed_units' => OrderDetails::whereHas('order', fn ($query) => $query->where('order_status', $completedStatus)->where('created_at', '>=', $from))->sum('qty'),
        ];

        return view('backEnd.analytics.product', compact('products', 'summary', 'days'));
    }
}
