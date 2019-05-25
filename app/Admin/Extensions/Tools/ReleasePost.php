<?php

namespace App\Admin\Extensions\Tools;

use Encore\Admin\Grid\Tools\BatchAction;

class ReleasePost extends BatchAction
{
    protected $action;

    public function __construct($action = 1)
    {
        $this->action = $action;
    }

    public function script()
    {
        return <<<EOT

$('{$this->getElementClass()}').on('click', function() {
                  if(confirm("确实要删除吗？")){
                  
                      //alert("正在删除！请稍后。。。").delay(1500).fadeOut();
                  }else {
                      alert("已经取消了删除操作");
                      exit();
                  }
    $.ajax({
        method: 'post',
        url: 'tukus/release',
        data: {
            _token:LA.token,
            ids: selectedRows(),
            action: {$this->action}
        },
        success: function (data) {
            //alert(data);
            $.pjax.reload('#pjax-container');
            toastr.success('操作成功');
        }
    });
});

EOT;

    }
}