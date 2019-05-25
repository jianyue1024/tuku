<?php

namespace App\Admin\Extensions;

use App\Models\Picture;
use Encore\Admin\Admin;
use Illuminate\Support\Facades\DB;

class CheckRow
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function script()
    {
        return <<<SCRIPT

$('.grid-check-row').on('click', function () {

    // Your code.
//    console.log($(this).data('id'));
 alert('ok');
//    var msg = "您真的确定要删除吗？\n\n请确认！"; 
//    if (confirm(msg)==true){ 
////        return true; 
//        location.href='tukus/del/$(this).data('id')';
//    }else{ 
//        return false; 
//    } 

});

SCRIPT;
    }

    protected function render()
    {
        Admin::script($this->script());
//        $url = "tukus/del/{$this->id}";
        return "<a class='btn btn-xs btn-success fa fa-check grid-check-row' data-id='{$this->id}' ></a>";
    }

    public function __toString()
    {
        return $this->render();
    }
}