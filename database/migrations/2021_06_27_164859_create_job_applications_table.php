<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJobApplicationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('job_applications', function (Blueprint $table) {
            $table->bigIncrements('id')->unique();
            $table->string('user_id');
            $table->string('name');
            $table->string('father_name');
	        $table->string('mother_name');
            $table->string('present_division');
            $table->string('present_district');
            $table->string('present_thana');
            $table->string('present_area');
            $table->string('present_road');
	        $table->string('present_house');
            $table->string('permanent_division');
            $table->string('permanent_district');
            $table->string('permanent_thana');
            $table->string('permanent_area');
            $table->string('permanent_road');
	        $table->string('permanent_house');
            $table->string('nationality');
            $table->string('marital');
            $table->string('nid');
            $table->string('email');
            $table->string('mobile');
            $table->softDeletes();
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
        Schema::dropIfExists('job_applications');
    }
}
