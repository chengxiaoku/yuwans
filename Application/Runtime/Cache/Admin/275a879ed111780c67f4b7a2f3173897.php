<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($page_title); ?> | 管理后台</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="<?php echo ASSETS;?>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- FontAwesome 4.3.0 -->
    <link href="<?php echo ASSETS;?>fonts/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Ionicons 2.0.0 -->
    <link href="<?php echo ASSETS;?>fonts/ionicons-2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="<?php echo ASSETS;?>css/AdminLTE.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo ASSETS;?>css/skins/skin-blue.min.css" rel="stylesheet" type="text/css"/>
    <!-- ./wrapper -->
    <script src="<?php echo ASSETS;?>plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="<?php echo ASSETS;?>plugins/jQueryUI/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<?php echo ASSETS;?>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?php echo ASSETS;?>js/app.min.js" type="text/javascript"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<?php echo ASSETS;?>js/html5shiv.min.js"></script>
    <script src="<?php echo ASSETS;?>js/respond.min.js"></script>
    <![endif]-->
    <link href="<?php echo ASSETS;?>css/custom.css" rel="stylesheet" type="text/css"/>
    <script src="<?php echo ASSETS;?>plugins/bootbox.js"></script>
</head>

<body class="skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">YW</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">后台管理</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-user"></i><span><?php echo ($uname); ?></span>
                        </a>
                    </li>

                    <li class="dropdown user user-menu">
                        <a class="dropdown-toggle" href="<?php echo U('Auth/logout');?>">
                            <i class="glyphicon glyphicon-off"></i><span>安全退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</div>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <!--菜单项-->
            <?php echo ($menu); ?>
        </ul>
    </section>
</aside>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
<section class="content-header">
    <h1><?php echo ($page_title); ?><small></small></h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>首页</a></li>
        <li class="active"><?php echo ($page_title); ?></li>
    </ol>
</section>
    <!-- 主体内容 -->
    <section class="content">
        <div class="row">
            <form id="sliderForm" name="form1" action="<?php echo U('Goods/goods_add',array('id'=>$data['id']));?>" method="post">
                <!-- left column -->
                <div class="col-md-8">
                    <!-- general form elements -->
                    <div class="box box-solid">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">商品标题 <span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='title' placeholder="输入标题 ..." id=""
                                           class="form-control wp50" value="<?php echo ($data["title"]); ?>">
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">商品简介<span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='mess' placeholder="输入简介 ..." id=""
                                           class="form-control wp50" value="<?php echo ($data["summary"]); ?>">
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group" id="ContentError">
                                <label for="">商品详情</label>
                                    <textarea name="content" id="content" style="height: 300px;" placeholder="请输入商品详情 ..." rows="10"
                                              class=""><?php echo ($deta); ?></textarea>

                            </div>
                            <div class="form-group">
                                <label for="">商品兑换网址<span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='adress' placeholder="输入商品兑换网址 ..." id=""
                                           class="form-control wp50" value="<?php echo ($data["url"]); ?>">
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">商品兑换码 <span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='num' placeholder="输入商品兑换码 ..." id=""
                                           class="form-control wp50" value="<?php echo ($data["cdkey"]); ?>">
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">虚拟币<span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='money' placeholder="输入虚拟币 ..." id=""
                                           class="form-control wp50" value="<?php echo ($data["paymoney"]); ?>">
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">原价<span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='price' placeholder="输入原价 ..." id=""
                                           class="form-control wp50" value="<?php echo ($data["price"]); ?>">
                                    <em class="help-block">请输入数字</em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="label_mess">商品图片：</label>
                                <div class="input-group" style="position: relative; left: 90px; top: -30px;">
                                    <input type="text" placeholder="上传缩略图 ..." readonly="readonly" style="width: 150px;"  class="form-control" id="uiFileUploadInput1" data-thumb="">
                                    <button onclick="upload1()" type="button" class="btn btn-success btn-flat"><i class="fa fw fa-plus-circle"></i></button>
                                    <span style="margin-left: 15px; font-size: 20px;"><span id="img_num_z" ></span>/<span  id="img_num_f"></span></span><span style="color: red; margin-left: 20px;" id="text"></span>
                                </div>
                            </div>
                            <div class="form-group" id="new_img_adress">
                                <input type="hidden" value="" id="fm_img" name="fm_img">
                                <?php if(is_array($img_arr)): $i = 0; $__LIST__ = $img_arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><span class="pull-left" style="position:relative;background-color: lightgrey; padding: 10px; margin-left: 5px;">
                                        <img style='width: 160px; height: 160px;' src='<?php echo ($img); ?>'/>
                                        <span style="position: absolute; left: 80px;">
                                            <span style='' onclick='fm(this)'>设为封面</span>
                                            <span style='' onclick='img_sc(this)'>删除</span>
                                        </span>

                                        <input type='hidden' name='img[]' value='<?php echo ($img); ?>'>
                                    </span>
                                    </sapn><?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                        </div>

                        <div class="box-footer">
                            <input type="button" id="tj_ok" class="btn btn-primary w100 btn-flat" value="提交">
                        </div>

                    </div><!-- /.box -->
                </div><!--/.col (left) -->
            </form>
        </div>
    </section>
</div>
<!-- 上传图片模态框-->
<div class="modal fade " id="imageUploadModal3_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="">上传图片</h4>
            </div>
            <div class="modal-body no-padding maxh500">
                <div class="images-zone tc thumb-place-holder">

                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-left" style="">
                    <div class="btn btn-success fileinput-button pull-left inline-block">
                        <i class="glyphicon glyphicon-plus"></i>
                        <span>添加图片...</span>
                        <input id="fileupload3_3" type="file" name="files[]" multiple="" data-text-control="#uiFileUploadInput1">
                    </div>
                    <span class="loading action-doing hide inline-block mt5 ml10"><i class="fa fa-refresh fa-spin"></i>&nbsp;文件上传中...</span>
                    <span class="loading action-done hide inline-block mt5 ml10" id="text_ok"><i class="fa fa-check-circle-o"></i>&nbsp;上传成功</span>
                </div>
                <button type="button" class="btn btn-default ml20" data-dismiss="modal" id="img_ok">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 页面底部 -->
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>版本</b> 1.0
    </div>
    <strong>Copyright &copy; 2016 <a href="#">鱼丸网路科技</a></strong> 版权所有.
</footer>
<div class='control-sidebar-bg'></div>

</body>
</html>
<!-- jquery file upload -->
<script src="<?php echo ASSETS;?>plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<?php echo ASSETS;?>plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"></script>
<link href="<?php echo ASSETS;?>plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
<!--文本编辑器-->
<!--文本编辑器-->
<script src="<?php echo ASSETS;?>plugins/ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="<?php echo ASSETS;?>plugins/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">
    $(function (){
        $("#uiFileUploadInput1").val('');
        //指商品图片的初始张数
        var n = $("#new_img_adress > span").length;
        //商品团片的最大张数
        m = 4;
        //图片跟总数 j(获取已有的图片数量)
        j =$("#new_img_adress > span").length ;

        $("#img_num_z").text(n);
        $("#img_num_f").text(m);
    });

    //弹出上传框
    function upload1(){
        if(j<m){
            //格式化上传模态框
            var img_ok = $("#img_ok");
            img_ok.parent().prev().find('img').attr('src','');
            $("#imageUploadModal3_3").modal({});
        }else{
            $("#text").text('图片不能超过'+m+'张');
            return false;
        }

    }
    //文本编辑框

    var ue = UE.getEditor('content', {
        'toolbars': [
            ['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'link', 'unlink', 'emotion', 'inserttable', 'simpleupload', 'insertvideo', 'map', 'help'],
        ],

        'autoHeightEnabled': true,

        //'autoFloatEnabled': true
    });

    var file_url = "<?php echo U('admin/Goods/jqueryFileUpload');?>";
    //上传图片
    function show_img(id_1,id_2){
        $(id_1).fileupload({
            //options
            url: file_url,
            dataType: 'json',
            autoUpload: true,
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
            maxFileSize: 999000,
            //event
            add: function(e, data) {
                //指定模态框容器
                data.context = $(id_2);
                var autoUpload = $.blueimp.fileupload.prototype.options.autoUpload;
                if (autoUpload) {
                    data.submit();
                    data.context.find(".action-doing").removeClass("hide");
                }
                return true;
            },

            progressall: function(e, data) {
                //进度条
                var progress = parseInt(data.loaded / data.total * 100, 10);
            },

            done: function(e, data) {
                var fileInput = data.fileInput;
                var inputTextId = fileInput.attr("data-text-control");
                var inputText = $(inputTextId);
                var placeHolder = data.context.find(".thumb-place-holder");
                placeHolder.html("");
                $.each(data.result.files, function (index, file) {
                    if (file.thumbnailUrl) {

                        $("<img>").attr("src", file.thumbnailUrl).appendTo(placeHolder);
                        inputText.val(file.url);
                        inputText.attr("data-thumb", file.thumbnailUrl);
                    }
                });
                data.context.find(".action-doing").addClass("hide");
                data.context.find(".action-done").removeClass("hide");
            }
        });
    }
    show_img('#fileupload3_3','#imageUploadModal3_3');
    //选择图片之后显示出来
    $("#img_ok").click(function (){
        if(j<m){
            var img_adress = $("#uiFileUploadInput1").attr('data-thumb');
            $("#new_img_adress").append("<span class='pull-left' style='position:relative;background-color: lightgrey; padding: 10px; margin-left: 5px;'><img style='width: 160px; height: 160px;' src='"+img_adress+"'/><span style='position: absolute;left: 80px;'><span onclick='fm(this)'>设为封面</span><span onclick='img_sc(this)'> 删除</span></span><input type='hidden' name='img[]' value='"+img_adress+"'></sapn>");
            j++;
            $("#img_num_z").text(j);
        }else{
            return false;
        }
    });
    //设置为封面
    n=0;
    function fm(a){
        $("#new_img_adress span").css('background-color','lightgrey');
        $(a).parent().parent().css('background-color','red');
        $("#fm_img").val($(a).parent().prev().attr('src'));
        n++;
    }
    //提交检测
    $("#tj_ok").click(function (){
        //设置第一张图片为默认封面
        if(n==0){
            $("#fm_img").val($("#new_img_adress img:eq(0)").attr('src'));
        };
        //提交检测
        var title = $("input[name=title]");
        var mess = $("input[name=mess]");
        var adress = $("input[name=adress]");
        var num = $("input[name=num]");
        var money = $("input[name=money]");
        var price = $("input[name=price]");

        rt = true ;
        function error_s(obj,text){
            if($.trim(obj.val()) == ''){
                obj.parent().parent().addClass('has-error');
                obj.focus();
                obj.next().text(text);
                rt =false;
            }else{
                obj.parent().parent().removeClass('has-error');
                obj.next().text('');
            }
        }
        error_s(title,'商品标题不能为空!');
        error_s(mess,'商品简介不能为空!');
        error_s(adress,'商品兑换网址不能为空!');
        error_s(num,'商品兑换码不能为空!');
        error_s(money,'虚拟币不能为空!');
        error_s(price,'商品原价不能为空!');
        //判断是否有封面照片

        if(j<1){
            if($("#text").next().length<1){
                $("#text").after('<span style="color: red">请选择一张照片!</span>');
                return false;
            }else{
                return false;
            }
        }else{
            $("#text").next('');
        }
        if(rt){
            form1.submit();
        }
    })
    //图片删除
    function img_sc(obj){
        $(obj).parent().parent().slideUp(500,function (){
            $(obj).parent().parent().remove();
        });
        j--;
        $("#img_num_z").text(j);
    }

</script>