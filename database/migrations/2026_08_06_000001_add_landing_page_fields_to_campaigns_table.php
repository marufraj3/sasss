<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /** Keep legacy campaign installations compatible with the landing-page builder. */
    public function up()
    {
        Schema::table('campaigns', function (Blueprint $table) {
            if (! Schema::hasColumn('campaigns', 'banner_title')) {
                $table->string('banner_title')->nullable();
            }
            if (! Schema::hasColumn('campaigns', 'banner')) {
                $table->string('banner')->nullable();
            }
            if (! Schema::hasColumn('campaigns', 'video')) {
                $table->string('video')->nullable();
            }
            if (! Schema::hasColumn('campaigns', 'product_id')) {
                $table->unsignedBigInteger('product_id')->nullable()->index();
            }
        });
    }

    public function down()
    {
        // Columns are deliberately retained on rollback to avoid data loss on legacy stores.
    }
};
