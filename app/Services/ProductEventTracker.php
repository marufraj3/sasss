<?php

namespace App\Services;

use App\Models\ProductEvent;
use Illuminate\Support\Facades\Session;

class ProductEventTracker
{
    public function record(int $productId, string $eventType): void
    {
        ProductEvent::create([
            'product_id' => $productId,
            'event_type' => $eventType,
            'session_id' => Session::getId(),
        ]);
    }

    /** Avoid inflating product view reports when a visitor refreshes the same page. */
    public function recordProductView(int $productId): void
    {
        $key = 'product_viewed_at.' . $productId;
        $lastSeenAt = (int) Session::get($key, 0);
        if ($lastSeenAt > now()->subMinutes(30)->timestamp) {
            return;
        }

        Session::put($key, now()->timestamp);
        $this->record($productId, 'view');
    }
}
