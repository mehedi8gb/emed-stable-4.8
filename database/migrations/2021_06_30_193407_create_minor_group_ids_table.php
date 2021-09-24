<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMinorGroupIdsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('minor_group_ids', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('parent_id');
            $table->string('level')->nullable();
            $table->string('name')->nullable();
            $table->string('commision_rate')->nullable();
            $table->string('order_level')->nullable();
            $table->string('slug')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('minor_group_ids');
    }
}
