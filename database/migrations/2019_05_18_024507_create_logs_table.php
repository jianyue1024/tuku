<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->smallInteger('user_id')->comment('对应用户表id');
            $table->string('pic_id')->comment('获取的图片id');
            $table->string('class_id')->comment('获取的图片类别');
            $table->smallInteger('sum')->comment('获取图片数量');
            $table->string('ip','12')->comment('获取登录IP');
            $table->string('notes')->comment('注释')->nullable();
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
        Schema::dropIfExists('logs');
    }
}
