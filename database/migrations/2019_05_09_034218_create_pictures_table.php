<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePicturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pictures', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title')->comment('图片名');
            $table->float('size')->comment('图片大小');
            $table->smallInteger('width')->comment('宽');
            $table->smallInteger('height')->comment('高');
            $table->smallInteger('tuku_id')->comment('图库集合id');
            $table->smallInteger('user_id')->comment('编辑人id');
            $table->smallInteger('class_id')->comment('类别id');
            $table->string('notes')->comment('注释')->nullable();
            $table->smallInteger('recommend')->comment('推荐次数')->nullable();
            $table->smallInteger('recommend_at')->comment('初始推荐次数')->nullable();
            $table->integer('retime')->comment('最后一次推荐时间')->nullable();
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
        Schema::dropIfExists('pictures');
    }
}
