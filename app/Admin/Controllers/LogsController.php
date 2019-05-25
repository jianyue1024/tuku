<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\Log;
use App\Http\Controllers\Controller;
use App\Models\Picture;
use App\Models\User;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Box;

class LogsController extends Controller
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
            ->header('编辑日志')
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
            ->header('Edit')
            ->description('description')
            ->body($this->form()->edit($id));
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
            ->header('Create')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Log);
        $grid->id('Id')->sortable();
        $grid->model()->orderBy('id', 'desc');

        $grid->user_id('编辑人')->display(function ($userId) {
            $arr = User::find($userId);
            return $arr['name'];
        });
        $grid->pic_id('图片集')->display(function ($picId) {
            $picArr = explode(',', $picId);
            $pic = "";
            foreach ($picArr as $key => $value) {
                $photo = Picture::find($value);
                $pic = $pic . "<img src=/storage/" . $photo['title'] . " width=50px style='margin-right: 5px;'>";

            }
            return $pic;
        });

        $grid->category()->name('类别栏目');
        $grid->sum('Sum')->sortable()->totalRow(function ($amount) {

            return "<span class='text-danger text-bold'>总共获取图片数 {$amount} 张</span>";

        });
        $grid->ip('Ip');
        $grid->created_at('获取时间')->sortable();
        $grid->notes('备注')->editable('textarea');

        // 表格筛选 时间-注释-类别
        $grid->filter(function ($filter) {
            //1.时间段筛选   设置created_at字段的范围查询
            $filter->between('created_at', '筛选时间')->datetime();
            $filter->like('notes', '备注');
            //3.字段equal 筛选
            $filter->equal('class_id', '类别栏目')->select($this->classOption());
            $filter->equal('user_id', '编辑人')->select($this->editerOption());
            //4.去掉默认的ID搜索
            $filter->disableIdFilter();
            //5.

        });

        // 不在页面显示 `新建` 按钮，因为我们不需要在后台新建用户
        $grid->disableCreateButton();

        $grid->actions(function ($actions) {
            // 不在每一行后面展示查看按钮
            $actions->disableView();
            // 不在每一行后面展示删除按钮
            $actions->disableDelete();
            // 不在每一行后面展示编辑按钮
            $actions->disableEdit();
        });

        $grid->tools(function ($tools) {
            // 禁用批量删除按钮
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
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
        $show = new Show(Log::findOrFail($id));

        $show->id('Id');
        $show->user_id('User id');
        $show->pic_id('Pic id');
        $show->class_id('Class id');
        $show->sum('Sum');
        $show->ip('Ip');
        $show->notes('Notes');
        $show->created_at('Created at');
        $show->updated_at('Updated at');
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Log);

        $form->number('user_id', 'User id');
        $form->text('pic_id', 'Pic id');
        $form->text('class_id', 'Class id');
        $form->number('sum', 'Sum');
        $form->ip('ip', 'Ip');
        $form->text('notes', 'Notes');

        return $form;
    }

    // 筛选类别
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
    // 筛选编辑人
    public function editerOption()
    {
        $editerAll = User::orderby('id')->get();
        foreach ($editerAll as $key => $editer) {
            $classArr[$editer->id] = $editer->name;
        }
        return $classArr;
    }
}
