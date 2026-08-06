<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AbandonedCart;
use App\Models\SmsGateway;
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

    public function sendReminder(AbandonedCart $abandonedCart)
    {
        abort_unless($abandonedCart->status === 'active' && $abandonedCart->phone, 422, 'An active cart and phone number are required.');
        abort_if($abandonedCart->last_reminder_at && $abandonedCart->last_reminder_at->gt(now()->subHours(6)), 429, 'A reminder was already sent in the last 6 hours.');

        $gateway = SmsGateway::where('status', 1)->first();
        if (! $gateway || ! $gateway->url) {
            return back()->withErrors(['reminder' => 'No active SMS gateway is configured.']);
        }

        $itemNames = collect($abandonedCart->cart_data)->pluck('name')->take(2)->implode(', ');
        $message = "আপনার কার্টে এখনও {$itemNames} আছে। অর্ডার সম্পন্ন করতে আমাদের ওয়েবসাইটে ফিরে আসুন।";

        try {
            $client = curl_init();
            curl_setopt_array($client, [
                CURLOPT_URL => $gateway->url,
                CURLOPT_POST => true,
                CURLOPT_POSTFIELDS => ['api_key' => $gateway->api_key, 'contacts' => $abandonedCart->phone, 'type' => 'text', 'senderid' => $gateway->serderid, 'msg' => $message],
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_TIMEOUT => 10,
                CURLOPT_SSL_VERIFYPEER => true,
            ]);
            $response = curl_exec($client);
            $error = curl_error($client);
            curl_close($client);
            if ($response === false || $error) {
                throw new \RuntimeException($error ?: 'SMS gateway did not respond.');
            }
        } catch (\Throwable $exception) {
            report($exception);
            return back()->withErrors(['reminder' => 'Reminder could not be sent. Please verify the SMS gateway.']);
        }

        $abandonedCart->increment('reminder_count');
        $abandonedCart->update(['last_reminder_at' => now()]);

        return back()->with('success', 'Recovery reminder sent successfully.');
    }

    public function ignore(AbandonedCart $abandonedCart)
    {
        if ($abandonedCart->status === 'active') {
            $abandonedCart->update(['status' => 'ignored']);
        }

        return back()->with('success', 'Cart marked as ignored.');
    }
}
