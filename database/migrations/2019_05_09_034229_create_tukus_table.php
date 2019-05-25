<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTukusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tukus', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('photos','2555')->comment('上传图片集合');
            $table->string('notes')->comment('注释')->nullable();
            $table->smallInteger('class_id')->comment('图片类别ID');
            $table->smallInteger('editer')->comment('编辑人ID');
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
        Schema::dropIfExists('tukus');
    }
}
