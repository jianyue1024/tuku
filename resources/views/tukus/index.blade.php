@extends('layouts.app')
@section('title', '图片库列表')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!-- 筛选组件开始 -->
                    {{--<form action="{{ route('tukus.index') }}" class="search-form">--}}
                    <div class="form-row">
                        <div class="col-md-3">
                            <select name="class" class="form-control form-control-sm float-right" id="class">
                                <option value="">类别选择</option>
                                @foreach($classAll as $class)
                                    @if($class->parent_id !== 0)
                                        <option value="{{ $class->id }}">&nbsp;&nbsp;{{ $class->name }}</option>
                                    @else
                                        <option value="{{ $class->id }}">{{ $class->name }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="form-row">
                                <div class="col-auto"><input type="text" class="form-control form-control-sm"
                                                             name="search" placeholder="需要图片数" id="search"></div>
                                <div class="col-auto">
                                    <button class="btn btn-primary btn-sm" id="getting">获取图片集</button>
                                </div>
                            </div>
                        </div>
                    </div>
                {{--</form>--}}
                <!-- 筛选组件结束 -->
                    <div class="row products-list" id="test" style="margin-top: 20px;">


                        @if($photos !== "")
                            <div class="col-md-12"><a href="{{ route('tukus.downloadImg') }}?idAll={{ $addressAll }}">
                                    <button class="btn btn-primary btn-sm">点击一键下载</button></a></div>
                            @foreach($photos as $photo)
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="pictures">
                                        <a href="/storage/{{ $photo->title }}"  download="w3logo">
                                            <img src="/storage/{{ $photo->title }}" width="250px" id="testimg1"></a>
                                        {{--<a href="javascript:;" class="down_btn_a">点击下载</a>--}}
                                    </div>
                                    <blockquote class="text-center">
                                        <p>{{ $photo->width }} ✖️ {{ $photo->height }} | {{ $photo->size }}KB
                                            | {{ $photo->recommend }}次</p>
                                        <p>{{ $photo->notes }}</p>
                                    </blockquote>
                                </div>
                            @endforeach
                        @endif
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection

@section('scriptsAfterJs')
    <script>
        var filters = {!! json_encode($filters) !!};
        $(document).ready(function () {
            $('.search-form input[name=search]').val(filters.search);
            // $('.search-form select[name=order]').val(filters.order);
            $('.search-form select[name=class]').val(filters.class);
            // $('.search-form select[name=order]').on('change', function() {
            //   $('.search-form').submit();
            // });
        })
    </script>

{{--点击下载--}}
    <script>
        //判断是否为Trident内核浏览器(IE等)函数
        function browserIsIe() {
            if (!!window.ActiveXObject || "ActiveXObject" in window){
                return true;
            }
            else{
                return false;
            }
        }
        //创建iframe并赋值的函数,传入参数为图片的src属性值.
        function createIframe(imgSrc) {
            //如果隐藏的iframe不存在则创建
            if ($("#IframeReportImg").length === 0){
                $('<iframe style="display:none;" id="IframeReportImg" name="IframeReportImg" onload="downloadImg();" width="0" height="0" src="about:blank"></iframe>').appendTo("body");
            }
            //iframe的src属性如不指向图片地址,则手动修改,加载图片
            if ($('#IframeReportImg').attr("src") != imgSrc) {
                $('#IframeReportImg').attr("src",imgSrc);
            } else {
                //如指向图片地址,直接调用下载方法
                downloadImg();
            }
        }
        //下载图片的函数
        function downloadImg() {
            //iframe的src属性不为空,调用execCommand(),保存图片
            if ($('#IframeReportImg').src != "about:blank") {
                window.frames["IframeReportImg"].document.execCommand("SaveAs");
            }
        }
        //接下来进行事件绑定
        var aBtn = $(".card .down_btn_a");
        if (browserIsIe()) {
            //是ie等,绑定事件
            aBtn.on("click", function() {
                var imgSrc = $(this).siblings("img").attr("src");
                //调用创建iframe的函数
                createIframe(imgSrc);
            });
        } else {
            aBtn.each(function(i,v){
                //支持download,添加属性.
                var imgSrc = $(v).siblings("img").attr("src");
                $(v).attr("download",imgSrc);
                $(v).attr("href",imgSrc);
            })
        }
    </script>

    {{--ajax提交  防刷新--}}
    <script>
        $(function () {
            /*仿刷新：检测是否存在cookie*/
            if ($.cookie("captcha")) {
                var count = $.cookie("captcha");
                var btn = $('#getting');
                btn.text(count + '秒后可重新获取').attr('disabled', true).css('cursor', 'not-allowed');
                var resend = setInterval(function () {
                    count--;
                    if (count > 0) {
                        btn.text(count + '秒后可重新获取').attr('disabled', true).css('cursor', 'not-allowed');
                        $.cookie("captcha", count, {
                            path: "{{ route('tukus.index') }}",
                            expires: (1 / 86400) * count
                        });
                    } else {
                        clearInterval(resend);
                        btn.text("获取图片集").removeClass('disabled').removeAttr('disabled style');
                    }
                }, 1000);
            }

            /*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/
            $('#getting').click(function (event) {
                var reg = /^[0-9]+$/;
                if ($('#class').val() == "") {
                    alert("亲，该填的还是要填的\n要不我怎么知道你要【 什么类别 】的图片？");
                    return false;
                } else if ($('#search').val().length == 0) {
                    alert("亲，该填的还是要填的\n要不我怎么知道你要几张，几张，几张？");
                    return false;
                } else if ($('#search').val() != "" && !reg.test($('#search').val())) {
                    alert('亲，不要乱写，请输入【阿拉伯.数字】！');
                    return false;
                } else if ($('#search').val() != "" && $('#search').val() == 0) {
                    alert('亲，要 0 张，那是要作甚？？？');
                    return false;
                }

                var data = {
                    '_token': '{{csrf_token()}}',
                    search: $('#search').val(),
                    class: $('#class').val()
                };
                $.ajax({
                    type: 'post',
                    url: '{{ route('tukus.ajax') }}',
                    data: data,
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    },
                    success: function (data) {
                        var html = "";
                        if (data) {
                            // alert(data);
                            $("#test").html(data); //在html页面id=test的标签里显示html内容
                        }
                    },
                });

                var btn = $(this);
                var count = 6;
                var resend = setInterval(function () {
                    count--;
                    if (count > 0) {
                        btn.text(count + "秒后可重新获取");
                        $.cookie("captcha", count, {
                            path: "{{ route('tukus.index') }}",
                            expires: (1 / 86400) * count
                        });
                    } else {
                        clearInterval(resend);
                        btn.text("获取图片集").removeAttr('disabled style');
                    }
                }, 1000);
                btn.attr('disabled', true).css('cursor', 'not-allowed');
            });

        });
    </script>

@endsection
