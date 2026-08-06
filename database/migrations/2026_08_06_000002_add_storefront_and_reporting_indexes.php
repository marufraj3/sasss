<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /** Index the filters used for storefront listings, orders and dashboard reporting. */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->index(['status', 'category_id'], 'products_status_category_index');
            $table->index(['status', 'topsale'], 'products_status_topsale_index');
            $table->index('slug', 'products_slug_index');
        });

        Schema::table('orders', function (Blueprint $table) {
            $table->index(['order_status', 'created_at'], 'orders_status_created_at_index');
            $table->index('invoice_id', 'orders_invoice_id_index');
            $table->index('customer_id', 'orders_customer_id_index');
        });

        Schema::table('order_details', function (Blueprint $table) {
            $table->index('order_id', 'order_details_order_id_index');
            $table->index('product_id', 'order_details_product_id_index');
        });

        Schema::table('customers', function (Blueprint $table) {
            $table->index('phone', 'customers_phone_index');
        });
    }

    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropIndex('products_status_category_index');
            $table->dropIndex('products_status_topsale_index');
            $table->dropIndex('products_slug_index');
        });
        Schema::table('orders', function (Blueprint $table) {
            $table->dropIndex('orders_status_created_at_index');
            $table->dropIndex('orders_invoice_id_index');
            $table->dropIndex('orders_customer_id_index');
        });
        Schema::table('order_details', function (Blueprint $table) {
            $table->dropIndex('order_details_order_id_index');
            $table->dropIndex('order_details_product_id_index');
        });
        Schema::table('customers', function (Blueprint $table) {
            $table->dropIndex('customers_phone_index');
        });
    }
};
