<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('customer_tags', function (Blueprint $table) {
            $table->id();
            $table->string('name', 60)->unique();
            $table->string('color', 20)->default('#087f5b');
            $table->timestamps();
        });
        Schema::create('customer_customer_tag', function (Blueprint $table) {
            $table->unsignedInteger('customer_id');
            $table->unsignedBigInteger('customer_tag_id');
            $table->primary(['customer_id', 'customer_tag_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('customer_customer_tag');
        Schema::dropIfExists('customer_tags');
    }
};
