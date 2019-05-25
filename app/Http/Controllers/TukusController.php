<?php

namespace App\Http\Controllers;


use App\Exceptions\zipfile;
use App\Models\Category;
use App\Models\Log;
use App\Models\Picture;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TukusController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index(Request $request)
    {
        $search = $request->input('search', '');
        $class = $request->input('class', '');
        $photos = "";
        $addressAll = '';
        if (isset($_COOKIE['idList'])) {
            $idList = $_COOKIE['idList'];
            $idArr = explode(',', $idList);
            $photos = Picture::whereIn('id', $idArr)->get();
            // 获取所有图片的id    批量下载使用  $addressAll
            foreach ($photos as $photo) {
                $addressAll = $addressAll . $photo->id . ',';
            }
            $addressAll = substr($addressAll, 0, strlen($addressAll) - 1);
        }

        $classAll = Category::orderby('order')->get();


        return view('tukus.index', [
            'photos' => $photos,
            'classAll' => $classAll,
            'addressAll' => $addressAll,
            'filters' => [
                'search' => $search,
                'class' => $class,
            ],
        ]);
    }

    //图片集返回
    public function ajax(Request $request)
    {
        if ($request->ajax()) {
            $class = $request->input('class');
            $search = $request->input('search');
            $photos = Picture::where('class_id', '=', $class)
                ->orderby('recommend', 'asc')
                ->skip(0)->take($search)->get();

            $str = "";
            $idList = "";
            foreach ($photos as $photo) {
                //更新推荐次数和推荐时间
                $pid = $photo->id;
                $recommend = $photo->recommend + 1;
                $showtime = time();
                Picture::where('id', '=', $pid)->update(array('recommend' => $recommend, 'retime' => $showtime));
                //把查询过的id值放入cookie中
                $idList = $idList . $pid . ',';
                //前端显示
                $title = $photo->title;
                $str = $str . "<div class=\"col-lg-3 col-md-3 col-sm-6\"><div class=\"pictures\">
                                <a href='/storage/" . $title . " '  download=\"w3logo\">
                                <img src='/storage/" . $title . " ' width='250px;'  id=\"testimg1\"></a>
                                </div><blockquote  class=\"text-center\">
                                        <p>" . $photo->width . " ✖️ " . $photo->height . " | " . $photo->size . "KB | " . $photo->recommend . "次</p>
                                        <p>" . $photo->notes . "</p>
                                    </blockquote></div>";
            }
            $idList = substr($idList, 0, strlen($idList) - 1);
            setcookie("idList", "$idList", time() + 70);

            $str = "<div class=\"col-md-12\"><a href='/tukus/downloadImg?idAll=" . $idList . "'>
                                <button class=\"btn btn-primary btn-sm\">点击一键下载</button></a></div>" . $str;


            $user = Auth::user();
            $data = [
                'user_id' => $user->id,
                'pic_id' => $idList,
                'class_id' => $class,
                'sum' => $search,
                'ip' => $_SERVER["REMOTE_ADDR"],
                'notes' => ""
            ];
            Log::create($data);


            return $str;
        }
    }


    // 文件批量下载
    public function downloadImg()
    {
        //下面是实例操作过程：
        $dfile = @tempnam('/tmp', 'tmp');//产生一个临时文件，用于缓存下载文件
        $zip = new zipfile();
//----------------------
        $filename = 'image.zip'; //下载的默认文件名

//以下是需要下载的图片数组信息，将需要下载的图片信息转化为类似即可
//        $image = array(
//            array('image_src' => 'http://tuku.local/storage/images/pp_20190404thgc_1.jpg', 'image_name' => '图片1.jpg'),
//            array('image_src' => 'http://tuku.local/storage/images/pp_20190404xrgc_1.jpg', 'image_name' => '图片2.jpg'),
//        );

        $idAll = $_GET['idAll'];
        $idAll = explode(',', $idAll);
        $image = [];
        $i = 0;
        foreach ($idAll as $picId) {
            $pic = Picture::find($picId);
            $imgName = md5($i . time() . '图片') . '.jpg';
            $imgPath = './storage/' . $pic->title;
            $image[$i] = ['image_src' => $imgPath, 'image_name' => $imgName];
            $i++;
        }

        foreach ($image as $v) {
            $zip->add_file(file_get_contents($v['image_src']), $v['image_name']);
            // 添加打包的图片，第一个参数是图片内容，第二个参数是压缩包里面的显示的名称, 可包含路径
            // 或是想打包整个目录 用 $zip->add_path($image_path);
        }
//----------------------
        $zip->output($dfile);

// 下载文件
//        ob_clean();
        header('Pragma: public');
        header('Last-Modified:' . gmdate('D, d M Y H:i:s') . 'GMT');
        header('Cache-Control:no-store, no-cache, must-revalidate');
        header('Cache-Control:pre-check=0, post-check=0, max-age=0');
        header('Content-Transfer-Encoding:binary');
        header('Content-Encoding:none');
        header('Content-type:multipart/form-data');
        header('Content-Disposition:attachment; filename="' . $filename . '"'); //设置下载的默认文件名
        header('Content-length:' . filesize($dfile));
        $fp = fopen($dfile, 'r');
        while (connection_status() == 0 && $buf = @fread($fp, 8192)) {
            echo $buf;
        }
        fclose($fp);
        @unlink($dfile);
        @flush();
        @ob_flush();
        exit();
    }


}
