<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Payment;
use App\Models\PaymentGateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use Throwable;
use Toastr;

class BkashController extends Controller
{
    private string $baseUrl = '';
    private string $appKey = '';
    private string $appSecret = '';
    private string $username = '';
    private string $password = '';

    public function __construct()
    {
        $gateway = PaymentGateway::where(['status' => 1, 'type' => 'bkash'])->first();
        if ($gateway) {
            $this->baseUrl = rtrim((string) $gateway->base_url, '/');
            $this->appKey = (string) $gateway->app_key;
            $this->appSecret = (string) $gateway->app_secret;
            $this->username = (string) $gateway->username;
            $this->password = (string) $gateway->password;
        }
    }

    public function create(Request $request)
    {
        $request->validate(['order_id' => ['required', 'integer', 'exists:orders,id']]);
        $this->ensureConfigured();

        $order = Order::with('payment')->findOrFail($request->order_id);
        abort_unless($order->payment && $order->payment->payment_method === 'bkash', 403);
        if ($order->payment->payment_status === 'paid') {
            return redirect()->route('customer.order_success', $order->id);
        }

        try {
            $response = $this->request('/tokenized/checkout/create', 'POST', [
                'mode' => '0011',
                'payerReference' => '',
                'callbackURL' => route('url-callback', ['orderId' => $order->id]),
                'amount' => number_format((float) $order->amount, 2, '.', ''),
                'currency' => 'BDT',
                'intent' => 'sale',
                'merchantInvoiceNumber' => Str::limit('ORDER-' . $order->invoice_id, 30, ''),
            ]);
        } catch (Throwable $exception) {
            report($exception);
            Toastr::error('bKash connection failed. Please try another payment method.', 'Payment unavailable');
            return redirect()->route('customer.order_success', $order->id);
        }

        if (empty($response['paymentID']) || empty($response['bkashURL'])) {
            Toastr::error($response['statusMessage'] ?? 'bKash could not create this payment.', 'Payment failed');
            return redirect()->route('customer.order_success', $order->id);
        }

        Cache::put($this->paymentCacheKey($response['paymentID']), $order->id, now()->addHours(2));
        return redirect()->away($response['bkashURL']);
    }

    public function callback(Request $request)
    {
        $orderId = (int) $request->query('orderId');
        $order = Order::with('payment')->findOrFail($orderId);

        if (! $order->payment || $order->payment->payment_method !== 'bkash') {
            abort(403);
        }
        if ($order->payment->payment_status === 'paid') {
            return redirect()->route('customer.order_success', $order->id);
        }

        if (in_array($request->query('status'), ['failure', 'cancel'], true)) {
            $order->payment->update(['payment_status' => $request->query('status')]);
            Toastr::error('Your bKash payment was not completed.', 'Payment cancelled');
            return redirect()->route('customer.order_success', $order->id);
        }

        $paymentId = (string) $request->query('paymentID');
        abort_unless($paymentId && Cache::get($this->paymentCacheKey($paymentId)) === $order->id, 403);

        try {
            $response = $this->request('/tokenized/checkout/execute', 'POST', ['paymentID' => $paymentId]);
        } catch (Throwable $exception) {
            report($exception);
            Toastr::error('bKash verification failed. We will verify the payment shortly.', 'Verification pending');
            return redirect()->route('customer.order_success', $order->id);
        }

        if (($response['statusCode'] ?? null) !== '0000') {
            $order->payment->update(['payment_status' => 'failed']);
            Toastr::error($response['statusMessage'] ?? 'bKash payment failed.', 'Payment failed');
            return redirect()->route('customer.order_success', $order->id);
        }

        $order->payment->update([
            'trx_id' => $response['trxID'] ?? $paymentId,
            'sender_number' => $response['payerReference'] ?? null,
            'payment_status' => 'paid',
        ]);
        Cache::forget($this->paymentCacheKey($paymentId));

        Toastr::success('Your bKash payment was completed successfully.', 'Payment successful');
        return redirect()->route('customer.order_success', $order->id);
    }

    private function ensureConfigured(): void
    {
        abort_if(! $this->baseUrl || ! $this->appKey || ! $this->appSecret || ! $this->username || ! $this->password, 503, 'bKash is not configured.');
    }

    private function token(): string
    {
        $this->ensureConfigured();
        $key = 'bkash.token.' . sha1($this->baseUrl . $this->appKey . $this->username);

        return Cache::remember($key, now()->addMinutes(50), function () {
            $response = $this->rawRequest('/tokenized/checkout/token/grant', 'POST', [
                'app_key' => $this->appKey,
                'app_secret' => $this->appSecret,
            ], [
                'Content-Type: application/json',
                'username: ' . $this->username,
                'password: ' . $this->password,
            ]);
            if (empty($response['id_token'])) {
                throw new \RuntimeException($response['statusMessage'] ?? 'Unable to obtain bKash token.');
            }
            return $response['id_token'];
        });
    }

    private function request(string $path, string $method, array $payload): array
    {
        return $this->rawRequest($path, $method, $payload, [
            'Content-Type: application/json',
            'Authorization: ' . $this->token(),
            'X-APP-Key: ' . $this->appKey,
        ]);
    }

    private function rawRequest(string $path, string $method, array $payload, array $headers): array
    {
        $curl = curl_init($this->baseUrl . $path);
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => $headers,
            CURLOPT_CUSTOMREQUEST => $method,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_TIMEOUT => 30,
            CURLOPT_CONNECTTIMEOUT => 10,
            CURLOPT_SSL_VERIFYPEER => true,
            CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
        ]);
        $body = curl_exec($curl);
        $error = curl_error($curl);
        $status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);

        if ($body === false || $error) {
            throw new \RuntimeException($error ?: 'bKash network error.');
        }
        $response = json_decode($body, true);
        if (! is_array($response)) {
            throw new \RuntimeException('Invalid bKash response (HTTP ' . $status . ').');
        }
        return $response;
    }

    private function paymentCacheKey(string $paymentId): string
    {
        return 'bkash.payment.' . sha1($paymentId);
    }
}
