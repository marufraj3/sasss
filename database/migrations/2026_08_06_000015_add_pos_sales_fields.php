<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('order_page', 120)->nullable()->after('note');
            $table->string('utm_source', 120)->nullable()->after('order_page');
            $table->text('office_note')->nullable()->after('utm_source');
        });
        Schema::table('payments', function (Blueprint $table) {
            $table->unsignedInteger('paid_amount')->default(0)->after('amount');
            $table->unsignedInteger('due_amount')->default(0)->after('paid_amount');
        });
    }

    public function down()
    {
        Schema::table('orders', function (Blueprint $table) { $table->dropColumn(['order_page', 'utm_source', 'office_note']); });
        Schema::table('payments', function (Blueprint $table) { $table->dropColumn(['paid_amount', 'due_amount']); });
    }
};
