<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('abandoned_carts', function (Blueprint $table) {
            $table->unsignedTinyInteger('reminder_count')->default(0)->after('status');
            $table->timestamp('last_reminder_at')->nullable()->after('reminder_count');
        });
    }

    public function down()
    {
        Schema::table('abandoned_carts', function (Blueprint $table) {
            $table->dropColumn(['reminder_count', 'last_reminder_at']);
        });
    }
};
