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
use Encore\Admin\Widgets\Collapse;
use Encore\Admin\Widgets\Table;



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
                    $collapse = new Collapse();

                    $collapse->add('使用说明', 'xxxxx');
                    $collapse->add('更新文档', new Table());

                    $column->append($collapse->render());
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
