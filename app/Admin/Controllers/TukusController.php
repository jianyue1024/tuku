<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\CheckRow;
use App\Admin\Extensions\Tools\ReleasePost;
use App\Models\Category;
use App\Models\User;
use Encore\Admin\Facades\Admin;
use App\Http\Request;
use App\Models\Tuku;
use App\Models\Picture;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Tree;
use Illuminate\Support\Facades\Storage;


class TukusController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('图集列表')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(' 编辑图集')
            ->body($this->form()->edit($id));
    }


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        $grid = new Grid(new Picture());
        $grid->model()->orderBy('id', 'desc');
        $grid->id('Id')->sortable();

        $grid->title('图片灯箱')->lightbox(['width' => 100]);
        $grid->width('宽')->display(function ($width) {
            return $width . 'px';
        });;
        $grid->height('高')->display(function ($height) {
            return $height . 'px';
        });;
        $grid->size('图片大小')->display(function ($size) {
            return $size . 'KB';
        })->sortable();

        $grid->category()->name('类别');

        $grid->tuku()->notes('注释');
        $grid->recommend('推荐次数')->sortable();
        $grid->recommend_at('初始推荐次数')->sortable();
        $grid->user_id('编辑人')->display(function ($userId) {
            $arr = DB::table('admin_users')->where('id', $userId)->first();
            return $arr->name;
        });

        //操作按钮
        $grid->actions(function ($actions) {
            // 删除原有按钮
            $actions->disableDelete();
            $actions->disableEdit();
            $actions->disableView();

            $tukuRow = $actions->row;
            // 只能删除自己发布的图片信息  超级管理员不受限制
//            if ($tukuRow->user_id == Admin::user()->id || Admin::user()->can('*')) {
                $tukuId = $actions->getKey();
                // 删除操作
                $url = "tukus/del/{$tukuId}";
                $js = "return confirm('确定删除?');";
                $actions->append("<a href={$url} onClick='return confirm(\"确定删除?\");'><i class='fa fa-paper-plane'>删除</i></a>");
//            }
        });


        // 表格筛选 时间-注释-类别
        $grid->filter(function ($filter) {
            //1.时间段筛选   设置created_at字段的范围查询
            $filter->between('created_at', '筛选时间')->datetime();
            $filter->like('notes', '注释');
            //3.字段equal 筛选
            $filter->equal('class_id', '类别栏目')->select($this->classOption());
            //4.去掉默认的ID搜索
            $filter->disableIdFilter();
            //5.

        });


        // 关闭批量删除
        $grid->tools(function ($tools) {
            //关闭原有的批量删除
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
            //超级管理员 批量删除
//            if (Admin::user()->can('*')) {
                $tools->batch(function ($batch) {
                    $batch->add('批量删除', new ReleasePost(1));
                });
//            }
        });


        return $grid;
    }


    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Tuku::findOrFail($id));

        $show->id('Id');
        $show->title('Title');
        $show->notes('Notes');
        $show->editer('Editer');
        $show->size('Size');
        $show->width('Width');
        $show->height('Height');
        $show->recommend('Recommend');
        $show->class('Class');
        $show->retime('Retime');
        $show->created_at('Created at');
        $show->updated_at('Updated at');

        return $show;
    }


    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('添加图片')
            ->body($this->form());
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */


    protected function form()
    {
        $form = new Form(new Tuku);
        // 类别 下拉 框

        $form->select('class_id', '图片类别')->options($this->classOption())->value('图片类别（ 必选 ）')->rules('required');
        // 注释 输入 框
        $form->text('notes', '图片注释')->placeholder('图片注释（ 非必须 ）');
        // 图片批量上传
        $form->multipleImage('photos', '批量图片')->removable()->sortable()
            ->help('请上传图片格式为 .png .jpg .gif 的图片！')
            ->rules('required', [
                'required' => '您，咋么能不选择图片就点【 提交 】呢？！',
            ]);
        // 当前登录者id 即编辑人
        $form->hidden('editer', '编辑人id')->default(Admin::user()->id);
        // tukus 保存后 prctures 循环插入
        $form->saved(function (Form $form) {
            $imagePhotos = $form->model()->photos;
            $tukuId = $form->model()->id;
            $userId = $form->model()->editer;
            $classId = $form->model()->class_id;
            $notes = $form->model()->notes;
            $created_at = $form->model()->created_at;
            $recommend = Picture::min('recommend');
            foreach ($imagePhotos as $value) {
                $path = "../storage/app/public/" . $value;
                //文件信息集合
                $arr = getimagesize($path);
                $iWidth = $arr[0];
                $iHeight = $arr[1];
                $iSize = filesize($path);
                $iSize = round($iSize /= 1024, 2);
                DB::insert('insert into pictures (title, size,width,height,tuku_id,user_id,class_id,notes,recommend,recommend_at,created_at) values (?, ?,?,?,?,?,?,?,?,?,?)', [$value, $iSize, $iWidth, $iHeight, $tukuId, $userId, $classId, $notes, $recommend, $recommend, $created_at]);
            }
        });
        return $form;
    }

    // 单张图片删除
    public function del($tuid)
    {
        $picture = Picture::find($tuid);

//        if ($picture->user_id == Admin::user()->id || Admin::user()->can('*')){
            $title = $picture->title;
            // 删除上传文件
            Storage::delete('public/' . $title);
            // 删除对应 tukus 表的相应信息
            $tukuId = Picture::find($tuid)->tuku_id;    //获取 tuku_id
            $photoAll = Tuku::find($tukuId);            //获取 tuku 表的 图片集 信息
            $photos = $photoAll->photos;

            $key = array_search($title, $photos);       //删除 tuku 中对应信息
            array_splice($photos, $key, 1);

            $picStr = "";
            foreach ($photos as $value) {               // 数组 转 字符串
                $picStr = $picStr . $value . ',';
            }
            $picStr = rtrim($picStr, ",");

            if ($picStr == ""){                             // tuku 中 图库集为空，直接删除 行
                Tuku::destroy($photoAll->id);
            }else{
                Tuku::where('id', '=', $tukuId)->update(     // 删除后的 信息 重新赋值给 tuku
                    ['photos' => $picStr]
                );
            }

            // 删除 pictures 数据
            Picture::destroy($tuid);
//        }
        return back();
    }

    //批量删除
    public function release(\Illuminate\Http\Request $request)
    {
        foreach (Picture::find($request->get('ids')) as $post) {

            Storage::delete('public/' . $post->title);


            // 删除对应 tukus 表的相应信息
            $tukuId = $post->tuku_id;    //获取 tuku_id
            $photoAll = Tuku::find($tukuId);            //获取 tuku 表的 图片集 信息
            $photos = $photoAll->photos;

            $key = array_search($post->title, $photos);       //删除 tuku 中对应信息
            array_splice($photos, $key, 1);

            $picStr = "";
            foreach ($photos as $value) {               // 数组 转 字符串
                $picStr = $picStr . $value . ',';
            }
            $picStr = rtrim($picStr, ",");

            if ($picStr == ""){                             // tuku 中 图库集为空，直接删除 行
                Tuku::destroy($photoAll->id);
            }else{
                Tuku::where('id', '=', $tukuId)->update(     // 删除后的 信息 重新赋值给 tuku
                    ['photos' => $picStr]
                );
            }

            $post->delete();
        }
    }


    // 调整分类显示
    public function classOption()
    {
        $classAll = Category::orderby('order')->get();
        foreach ($classAll as $key => $class) {
            if ($class->parent_id !== 0) {
                $classArr[$class->id] = ">> " . $class->name;
            } else {
                $classArr[$class->id] = $class->name;
            }
        }
        return $classArr;
    }


}
