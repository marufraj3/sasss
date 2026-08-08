<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /** Makes a clean migration schema compatible with the legacy order code and SQL export. */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            if (! Schema::hasColumn('orders', 'admin_note')) $table->text('admin_note')->nullable();
            if (! Schema::hasColumn('orders', 'user_id')) $table->unsignedInteger('user_id')->nullable()->index();
            if (! Schema::hasColumn('orders', 'note')) $table->string('note', 256)->nullable();
        });
        Schema::table('order_details', function (Blueprint $table) {
            if (! Schema::hasColumn('order_details', 'product_discount')) $table->integer('product_discount')->default(0);
            if (! Schema::hasColumn('order_details', 'product_size')) $table->string('product_size')->nullable();
            if (! Schema::hasColumn('order_details', 'product_color')) $table->string('product_color')->nullable();
        });
        Schema::table('categories', function (Blueprint $table) {
            if (! Schema::hasColumn('categories', 'front_view')) $table->boolean('front_view')->nullable();
            if (! Schema::hasColumn('categories', 'meta_description')) $table->text('meta_description')->nullable();
        });
    }

    public function down()
    {
        // Retain legacy fields on rollback so existing orders are never damaged.
    }
};
