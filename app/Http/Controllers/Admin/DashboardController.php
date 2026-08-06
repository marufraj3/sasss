<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\OrderStatus;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Toastr;
use Auth;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $today = Carbon::today();
        $monthStart = now()->startOfMonth();
        $previousMonthStart = now()->subMonthNoOverflow()->startOfMonth();
        $previousMonthEnd = now()->subMonthNoOverflow()->endOfMonth();
        $completedStatus = OrderStatus::where('slug', 'completed')->value('id') ?? 6;

        $total_order = Order::count();
        $today_order = Order::whereDate('created_at', $today)->count();
        $total_product = Product::count();
        $total_customer = Customer::count();
        $pendingOrders = Order::where('order_status', OrderStatus::where('slug', 'pending')->value('id') ?? 1)->count();

        $totalRevenue = Order::where('order_status', $completedStatus)->sum('amount');
        $monthRevenue = Order::where('order_status', $completedStatus)->where('created_at', '>=', $monthStart)->sum('amount');
        $previousMonthRevenue = Order::where('order_status', $completedStatus)->whereBetween('created_at', [$previousMonthStart, $previousMonthEnd])->sum('amount');
        $todayRevenue = Order::where('order_status', $completedStatus)->whereDate('created_at', $today)->sum('amount');
        $revenueChange = $previousMonthRevenue > 0 ? round((($monthRevenue - $previousMonthRevenue) / $previousMonthRevenue) * 100, 1) : null;

        $latest_order = Order::with(['customer', 'status'])->latest()->limit(8)->get();
        $latest_customer = Customer::latest()->limit(6)->get();
        $ordersByStatus = OrderStatus::where('status', 1)->orderBy('id')->get()->map(function ($status) {
            $status->order_count = Order::where('order_status', $status->id)->count();
            return $status;
        });

        $topProducts = OrderDetails::query()
            ->select('product_id', 'product_name', DB::raw('SUM(qty) as units_sold'), DB::raw('SUM(qty * sale_price) as sales_total'))
            ->whereHas('order', fn ($query) => $query->where('order_status', $completedStatus))
            ->groupBy('product_id', 'product_name')
            ->orderByDesc('units_sold')
            ->limit(5)
            ->get();

        $salesByDay = Order::selectRaw('DATE(created_at) as sale_date, SUM(amount) as revenue, COUNT(*) as orders')
            ->where('order_status', $completedStatus)
            ->where('created_at', '>=', now()->subDays(29)->startOfDay())
            ->groupBy('sale_date')
            ->orderBy('sale_date')
            ->get()
            ->keyBy('sale_date');

        $chartLabels = [];
        $chartRevenue = [];
        $chartOrders = [];
        foreach (range(29, 0) as $daysAgo) {
            $date = now()->subDays($daysAgo);
            $key = $date->toDateString();
            $chartLabels[] = $date->format('d M');
            $chartRevenue[] = (int) optional($salesByDay->get($key))->revenue;
            $chartOrders[] = (int) optional($salesByDay->get($key))->orders;
        }

        return view('backEnd.admin.dashboard', compact(
            'total_order', 'today_order', 'total_product', 'total_customer', 'pendingOrders',
            'totalRevenue', 'monthRevenue', 'todayRevenue', 'revenueChange', 'latest_order',
            'latest_customer', 'ordersByStatus', 'topProducts', 'chartLabels', 'chartRevenue', 'chartOrders'
        ));
    }

    public function changepassword()
    {
        return view('backEnd.admin.changepassword');
    }

    public function newpassword(Request $request)
    {
        $this->validate($request, [
            'old_password' => 'required',
            'new_password' => 'required|min:8',
            'confirm_password' => 'required_with:new_password|same:new_password',
        ]);

        $user = User::findOrFail(Auth::id());
        if (Hash::check($request->old_password, $user->password)) {
            $user->update(['password' => Hash::make($request->new_password)]);
            Toastr::success('Success', 'Password changed successfully!');
            return redirect()->route('dashboard');
        }

        Toastr::error('Failed', 'Old password does not match!');
        return back();
    }

    public function locked()
    {
        Session::put('locked', true);
        return view('backEnd.auth.locked');
    }

    public function unlocked(Request $request)
    {
        $request->validate(['password' => 'required']);
        if (! Auth::check()) {
            return redirect()->route('login');
        }

        if (Hash::check($request->password, Auth::user()->password)) {
            Session::forget('locked');
            Toastr::success('Success', 'You are logged in successfully!');
            return redirect()->route('dashboard');
        }

        Toastr::error('Failed', 'Your password does not match!');
        return back();
    }
}
