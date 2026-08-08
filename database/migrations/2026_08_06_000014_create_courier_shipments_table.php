<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('courier_shipments', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('order_id')->unique();
            $table->string('courier_name', 80);
            $table->string('tracking_number', 120);
            $table->string('shipment_status', 60)->default('booked');
            $table->timestamp('dispatched_at')->nullable();
            $table->timestamp('delivered_at')->nullable();
            $table->text('note')->nullable();
            $table->timestamps();
            $table->index(['courier_name', 'tracking_number']);
            $table->index('shipment_status');
        });
    }

    public function down()
    {
        Schema::dropIfExists('courier_shipments');
    }
};
