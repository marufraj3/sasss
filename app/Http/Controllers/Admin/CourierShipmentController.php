<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CourierShipment;
use App\Models\Courierapi;
use App\Models\Order;
use Illuminate\Http\Request;

class CourierShipmentController extends Controller
{
    public function index()
    {
        $shipments = CourierShipment::with(['order.shipping', 'order.customer'])->latest()->paginate(25);
        $couriers = Courierapi::where('status', 1)->orderBy('type')->get(['id', 'type']);
        $orders = Order::with(['shipping', 'courierShipment'])->latest()->limit(100)->get();

        return view('backEnd.courier-shipment.index', compact('shipments', 'couriers', 'orders'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'order_id' => ['required', 'integer', 'exists:orders,id'],
            'courier_name' => ['required', 'string', 'max:80'],
            'tracking_number' => ['required', 'string', 'max:120'],
            'shipment_status' => ['required', 'in:booked,picked_up,in_transit,delivered,failed_delivery,returned'],
            'note' => ['nullable', 'string', 'max:2000'],
        ]);

        $shipment = CourierShipment::firstOrNew(['order_id' => $data['order_id']]);
        $shipment->fill($data);
        $shipment->dispatched_at = in_array($data['shipment_status'], ['picked_up', 'in_transit', 'delivered']) ? ($shipment->dispatched_at ?? now()) : null;
        $shipment->delivered_at = $data['shipment_status'] === 'delivered' ? now() : null;
        $shipment->save();

        return back()->with('success', 'Courier shipment saved.');
    }

    public function updateStatus(Request $request, CourierShipment $courierShipment)
    {
        $data = $request->validate(['shipment_status' => ['required', 'in:booked,picked_up,in_transit,delivered,failed_delivery,returned']]);
        $courierShipment->shipment_status = $data['shipment_status'];
        if (in_array($data['shipment_status'], ['picked_up', 'in_transit', 'delivered']) && ! $courierShipment->dispatched_at) $courierShipment->dispatched_at = now();
        if ($data['shipment_status'] === 'delivered') $courierShipment->delivered_at = now();
        $courierShipment->save();

        return back()->with('success', 'Shipment status updated.');
    }
}
