<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('coupons', function (Blueprint $table) {
            $table->string('scope', 20)->default('all')->after('code');
            $table->unsignedBigInteger('product_id')->nullable()->after('scope');
            $table->unsignedInteger('category_id')->nullable()->after('product_id');
            $table->index(['scope', 'product_id', 'category_id'], 'coupons_scope_index');
        });
    }

    public function down()
    {
        Schema::table('coupons', function (Blueprint $table) {
            $table->dropIndex('coupons_scope_index');
            $table->dropColumn(['scope', 'product_id', 'category_id']);
        });
    }
};
