<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('product_events', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->string('event_type', 30);
            $table->string('session_id', 100)->nullable();
            $table->timestamps();
            $table->index(['product_id', 'event_type', 'created_at'], 'product_events_product_type_date_index');
            $table->index(['event_type', 'created_at'], 'product_events_type_date_index');
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_events');
    }
};
