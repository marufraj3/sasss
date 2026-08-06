<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('campaigns', function (Blueprint $table) {
            $table->json('section_order')->nullable();
            $table->boolean('daily_countdown')->default(false);
            $table->time('daily_countdown_end')->nullable();
        });
    }

    public function down()
    {
        Schema::table('campaigns', function (Blueprint $table) {
            $table->dropColumn(['section_order','daily_countdown','daily_countdown_end']);
        });
    }
};
