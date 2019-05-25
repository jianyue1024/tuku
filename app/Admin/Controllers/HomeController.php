<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\InfoBox;
use Illuminate\Support\Facades\DB;


class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->header('Pictures Index')
            ->description('盟招网图片库系统首页')
//            ->row(Dashboard::title())
            ->row(function (Row $row) {
                $row->column(3, function (Column $column) {
                    $sum = DB::select('SELECT COUNT(*) as number FROM users');
                    $infoBox = new InfoBox('编辑人员注册数', 'users', 'aqua', '/admin/users', $sum[0]->number );
                    $column->append($infoBox->render());
                });
                $row->column(3, function (Column $column) {
                    $sum = DB::select('SELECT COUNT(*) as number FROM pictures');
                    $infoBox = new InfoBox('图片库图片储存数', 'bar-chart', 'green', '/admin/tukus', $sum[0]->number);
                    $column->append($infoBox->render());
                });
                $row->column(3, function (Column $column) {
                    $sum = DB::select('SELECT sum( sum  )  as number FROM logs');
                    $infoBox = new InfoBox('获取图片总次数', 'commenting', 'yellow', '/admin/logs', $sum[0]->number);
                    $column->append($infoBox->render());
                });
                $row->column(3, function (Column $column) {
                    $sum = DB::select('select sum( sum  )  as number from logs where date(created_at) = curdate()');
                    $infoBox = new InfoBox('今日获取图片数', 'plane', 'red', '/admin/logs', $sum[0]->number);
                    $column->append($infoBox->render());
                });
            })
            ->row(function (Row $row) {
                $row->column(4, function (Column $column) {
                    $weeks = $this->get_week();
                    $b="";
                    $a="";
                    foreach ($weeks as $week){
                        $weekStart = $week.' 00:00:00';
                        $weekEnd = $week.' 23:59:59';
                        $sum = DB::select("select sum( sum  )  as number from logs where date(created_at) between '".$weekStart."' and '".$weekEnd."' ");
                        if ($sum[0]->number == NULL){
                            $sum[0]->number = 0;
                        }
                        $a = $a.$sum[0]->number.',';
                        $b = $b."'".$week."'".',';
                    }
                    $a = substr($a, 0, strlen($a) - 1);
                    $b = substr($b, 0, strlen($b) - 1);
//                    $a = '12, 19, 3, 5, 12, 3, 13';
//                    $b = '"05-20", "周二", "周三", "周四", "周五", "周六", "周日"';
                    $column->append(new Box('近7日获取总量图', view('admin.chartjs',['a' => $a,'b' => $b])));
                });
                $row->column(4, function (Column $column) {
                    $a = "";
                    $b = "";
                    $alls = User::all();
                    foreach ($alls as $all){
                        $b = $b."'".$all->name."'".',';
                        $sql = "select sum( sum  )  as number from logs where date(created_at) = curdate() and user_id = ".$all->id." ";
                        $num = DB::select($sql);
                        $a = $a.$num[0]->number.',';
                    }
                    $a = substr($a, 0, strlen($a) - 1);
                    $b = substr($b, 0, strlen($b) - 1);
                    $column->append(new Box('editor获取图', view('admin.chartjs2',['a' => $a,'b' => $b])));
                });
                $row->column(4, function (Column $column) {

                    $content1 = "技巧：<br/>
                    <p>怎么查看某位编辑某天的获取总量？<br/>
                    在编辑日志界面点击筛选选择日志和编辑人，可在表格底部查看统计数；</p>
                    <p>栏目分类改排序太麻烦？不存在！<br/>
                    在栏目分类界面左侧可直接拖拽分类名进行排序；</p>
                    <p>前端用户注册邮箱没有收到邮件怎么办？<br/>
                    在用户管理界面编辑邮箱验证时间，将注册时间复制到邮箱验证时间即可完成用户的验证；此方法不推荐使用，还是用自己邮箱好</p>
                    1、图片新增中的批量上传可直接将图片拖入图片选择框中<br/>
                    2、图片库中图片可点击放大查看<br/>
                    3、后台管理员可自定义头像及重置密码<br/>
                    <hr>
                    <p>注意：因删除权限已放开，删除需谨慎，删除后无法恢复</p>
                    ";
                    $box = new Box('系统文档', $content1);
                    $box->removable();
                    $box->collapsable();
                    $box->style('info');

                    $content2 = "
                    新增功能：<br/>
                    增加右上角➕图库新增快捷键！点击小房子按钮回前台；<br/>
                    用户管理列表可点击用户名查看改用户近10次获取图片记录；<br/>
                    编辑日志可自定义编辑备注；<br/>
                    前端增加一键打包下载功能（图片名进行md5编译）
                    ";
                    $box2 = new Box('最近更新', $content2);
                    $box2->removable();
                    $box2->collapsable();
                    $box2->style('success');

                    $column->append($box->solid());
                    $column->append($box2->solid());
                });

            });
    }

    // 获取近7日日期
    function get_week($time = '', $format='Y-m-d'){
        $time = $time != '' ? $time : time();
        //组合数据
        $date = [];
        for ($i=1; $i<=7; $i++){
            $date[$i] = date($format ,strtotime( '+' . $i-7 .' days', $time));
        }
        $date = array_reverse($date);
        return $date;
    }
}
