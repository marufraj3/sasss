<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('campaigns', function (Blueprint $table) {
            $table->string('cta_text', 80)->nullable()->after('banner_title');
            $table->timestamp('starts_at')->nullable()->after('video');
            $table->timestamp('ends_at')->nullable()->after('starts_at');
            $table->json('faq_items')->nullable()->after('description');
        });
    }

    public function down()
    {
        Schema::table('campaigns', function (Blueprint $table) {
            $table->dropColumn(['cta_text', 'starts_at', 'ends_at', 'faq_items']);
        });
    }
};
