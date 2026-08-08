<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('abandoned_carts', function (Blueprint $table) {
            $table->id();
            $table->uuid('token')->unique();
            $table->unsignedInteger('customer_id')->nullable();
            $table->string('phone', 25)->nullable();
            $table->json('cart_data');
            $table->unsignedInteger('subtotal')->default(0);
            $table->enum('status', ['active', 'recovered', 'ignored'])->default('active');
            $table->timestamp('recovered_at')->nullable();
            $table->timestamp('last_activity_at');
            $table->timestamps();

            $table->index(['status', 'last_activity_at'], 'abandoned_carts_status_activity_index');
            $table->index('customer_id');
            $table->index('phone');
        });
    }

    public function down()
    {
        Schema::dropIfExists('abandoned_carts');
    }
};
