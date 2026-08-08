<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('general_settings', function (Blueprint $table) {
            $table->string('primary_color', 20)->nullable();
            $table->string('secondary_color', 20)->nullable();
            $table->string('hotline', 50)->nullable();
            $table->string('whatsapp', 50)->nullable();
            $table->text('footer_text')->nullable();
            $table->text('delivery_policy')->nullable();
            $table->text('return_policy')->nullable();
        });
    }

    public function down()
    {
        Schema::table('general_settings', function (Blueprint $table) {
            $table->dropColumn(['primary_color','secondary_color','hotline','whatsapp','footer_text','delivery_policy','return_policy']);
        });
    }
};
