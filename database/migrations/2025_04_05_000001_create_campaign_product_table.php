<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Allows one landing page/campaign to feature and sell multiple products.
     */
    public function up()
    {
        if (! Schema::hasTable('campaigns_products')) {
            Schema::create('campaigns_products', function (Blueprint $table) {
                $table->id();
                $table->unsignedInteger('campaign_id');
                $table->unsignedBigInteger('product_id');
                $table->unsignedInteger('sort_order')->default(0);
                $table->timestamps();

                $table->unique(['campaign_id', 'product_id']);
                $table->index(['campaign_id', 'sort_order']);
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('campaigns_products');
    }
};
