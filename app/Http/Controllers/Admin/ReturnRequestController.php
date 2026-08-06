<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ReturnRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReturnRequestController extends Controller
{
    public function index(Request $request)
    {
        $status = $request->get('status', 'pending');
        $requests = ReturnRequest::with(['order.orderdetails', 'customer'])
            ->when(in_array($status, ['pending', 'approved', 'rejected']), fn ($query) => $query->where('status', $status))
            ->latest()
            ->paginate(20)
            ->withQueryString();

        $counts = [
            'pending' => ReturnRequest::where('status', 'pending')->count(),
            'approved' => ReturnRequest::where('status', 'approved')->count(),
            'rejected' => ReturnRequest::where('status', 'rejected')->count(),
        ];

        return view('backEnd.return-request.index', compact('requests', 'status', 'counts'));
    }

    public function approve(Request $request, ReturnRequest $returnRequest)
    {
        $data = $request->validate(['admin_note' => ['nullable', 'string', 'max:2000']]);

        DB::transaction(function () use ($returnRequest, $data) {
            $returnRequest = ReturnRequest::where('id', $returnRequest->id)->lockForUpdate()->firstOrFail();
            abort_unless($returnRequest->status === 'pending', 422, 'This request has already been processed.');

            $returnRequest->load('order.orderdetails');
            foreach ($returnRequest->order->orderdetails as $detail) {
                Product::where('id', $detail->product_id)->increment('stock', $detail->qty);
            }

            $returnRequest->update(['status' => 'approved', 'admin_note' => $data['admin_note'] ?? null, 'processed_at' => now()]);
        });

        return back()->with('success', 'Return approved and product stock restored.');
    }

    public function reject(Request $request, ReturnRequest $returnRequest)
    {
        $data = $request->validate(['admin_note' => ['required', 'string', 'max:2000']]);
        abort_unless($returnRequest->status === 'pending', 422, 'This request has already been processed.');
        $returnRequest->update(['status' => 'rejected', 'admin_note' => $data['admin_note'], 'processed_at' => now()]);

        return back()->with('success', 'Return request rejected.');
    }
}
