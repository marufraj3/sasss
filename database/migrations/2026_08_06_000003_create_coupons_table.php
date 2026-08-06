<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string('code', 60)->unique();
            $table->enum('type', ['fixed', 'percent'])->default('fixed');
            $table->unsignedInteger('amount');
            $table->unsignedInteger('minimum_order')->default(0);
            $table->unsignedInteger('maximum_discount')->nullable();
            $table->unsignedInteger('usage_limit')->nullable();
            $table->unsignedInteger('usage_count')->default(0);
            $table->timestamp('starts_at')->nullable();
            $table->timestamp('expires_at')->nullable();
            $table->boolean('status')->default(true);
            $table->timestamps();

            $table->index(['status', 'starts_at', 'expires_at'], 'coupons_active_window_index');
        });
    }

    public function down()
    {
        Schema::dropIfExists('coupons');
    }
};
