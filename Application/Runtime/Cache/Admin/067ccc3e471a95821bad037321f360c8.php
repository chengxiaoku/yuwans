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
            <form id="sliderForm" action="<?php echo U('slider/add');?>" method="post">
                <!-- left column -->
                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="box box-solid">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">幻灯片标题 <span class="required" aria-required="true">*</span></label>
                                <div>
                                    <input type="text" name='title' placeholder="输入标题 ..." id=""
                                           class="form-control wp50">
                                    <!--<label class="control-label"><i class="fa fa-times-circle-o"></i> 错误提示信息</label>-->
                                    <em class="help-block"></em>
                                </div>
                            </div>

                            <div class="form-group  ">
                                <label>选择展示板块</label>
                                    <select class="form-control wp50" id="type" name="type" onchange="select_type()">
                                        <option value="home">网吧广告</option>
                                        <option value="community">圈子广告</option>
                                    </select>
                            </div>

                            <div class="form-group">
                                <label for="">选择网吧区域<span class="required">*</span></label>
                                <div id="region">
                                    <select class="form-control w100 inline-block province"
                                            id="province_id" name="province_id">
                                        <option value="">≡ 请选择省 ≡</option>
                                    </select>
                                    <select class="form-control w100 inline-block city"
                                            id="city_id" name="city_id">
                                        <option value="">≡请选择市≡</option>
                                    </select>
                                    <select class="form-control w100 inline-block district"
                                            id="distract_id" name="distract_id">
                                        <option value="">≡ 请选择区 ≡</option>
                                    </select>
                                    <a type="submit" class="btn btn-info w100 ml20 btn-flat" id="searchNetbar">检索</a>
                                </div>
                            </div>
<div id="quzi_type">
                            <div class="form-group">
                                <label>选择网吧</label>
                                <select class="form-control wp50" id="netbar" name="netbar_id">
                                    <option value="">选择网吧</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>选择游戏</label>
                                <select class="form-control wp50" id="game" name="game_id">
                                    <option value="">选择游戏</option>
                                    <?php if(is_array($games)): $i = 0; $__LIST__ = $games;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>选择比赛</label>
                                <select class="form-control wp50" id="war" name="war_id">
                                    <option value="">选择比赛</option>
                                    <?php if(is_array($wars)): $i = 0; $__LIST__ = $wars;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>
</div>
                            <div class="form-group" id="html_vessel">

                            </div>
                            <div class="form-group">
                                <button class="btn btn-success flat wp50" onclick="return addSlide();">添加幻灯片图片</button>
                            </div>
                        </div>

                        <div class="box-footer">
                            <input type="submit" class="btn btn-primary w100 btn-flat" value="保存">
                            <a type="submit" class="btn btn-info w100 ml20 btn-flat" onclick="history.go('-1')">返回</a>
                        </div>

                    </div><!-- /.box -->
                </div><!--/.col (left) -->

                <!-- right column -->
                <div class="col-md-6">
                    <!-- 动态添加幻灯片 -->
                    <div id="slides_placehold">
                    </div>

                </div><!--/.col (right) -->
            </form>
        </div>
    </section>
</div>

<!-- 上传图片 -->
<div class="modal fade " id="FileUploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">上传图片</h4>
            </div>

            <div class="modal-body no-padding maxh500">
                <div id="images-zone" class="images-zone tc"></div>
            </div>

            <div class="modal-footer">

                <div class="pull-left" style="">
                    <div class="btn btn-success fileinput-button pull-left inline-block">
                        <i class="glyphicon glyphicon-plus"></i>
                        <span>添加图片</span>
                        <input id="fileupload" type="file" name="files[]" multiple="">
                    </div>
                    <span id="loading-progress" class="loading inline-block mt5 ml10 to-hidden"><i
                            class="fa fa-refresh fa-spin"></i>&nbsp; 数据加载中...<em id="progress"></em></span>
                    <span id="loading-done" class="loading block mt5 ml10 to-hidden"><i
                            class="fa fa-check-circle-o"></i>上传成功</span>
                </div>
                <input type="hidden" value="" name="image_url_hidden" id="imageUrlHidden">
                <button type="button" class="btn btn-default ml20" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="return onUpload()">确定</button>
            </div>
        </div>
    </div>
</div>


<!-- 幻灯片添加 -->
<script type="text/x-tmpl" id="tmpl-slide">
<div class="box box-success direct-chat direct-chat-success collapsed-box">
  <div class="box-header with-border">
    <h3 class="box-title">图片</h3>

    <div class="box-tools pull-right">
      <button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-plus"></i></button> <!--fa-minus-->
      <!-- onclick="removeSlider(this);" -->
      <button data-widget="remove" class="btn btn-box-tool" ><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body form-horizontal"  style="padding:10px 0;">
      <div class="form-group">
        <label class="col-sm-2 control-label" for="">标题</label>
        <div class="col-sm-10  ">
          <input type="text" placeholder="标题..." id="title_{%=o.idx%}" name="images[{%=o.idx%}][title]" class="form-control inline-block wp50"
onblur="chk('{%=o.idx%}')">
          <label for="inputError" class="control-label" id="title_{%=o.idx%}_error" style="display:none;"><i class="fa"></i> <span id="title_{%=o.idx%}_error_msg">图片名不能为空</label>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label" for="">预览</label>
        <div class="col-sm-10">
          <div class="input-group wp50">
            <img id="img_{%=o.idx%}" src="" width="300">
          </div>
        </div>
      </div>
      <!--<div class="form-group">
        <label class="col-sm-2 control-label" for="">连接</label>
        <div class="col-sm-10 ">
          <input type="text" placeholder="连接地址..." id="link_{%=o.idx%}" name="images[{%=o.idx%}][url]" class="form-control wp50">
        </div>
      </div>-->
      <div class="form-group">
        <label class="col-sm-2 control-label" for="">图片</label>
        <div class="col-sm-10">
          <input type="hidden" value="{%=o.idx%}">
          <div class="input-group wp50">
              <input type="text" class="form-control " id="image_{%=o.idx%}" placeholder="上传图片 ..." name="images[{%=o.idx%}][img]" readonly>
              <div class="input-group-btn">
                <button class="btn btn-success btn-flat" type="button" onclick="upload(this)"><i class="fa fw fa-plus-circle"></i></button>
              </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label" for="">内容</label>
        <div class="col-sm-10 ">
          <textarea rows="2" placeholder="输入内容 ..." class="form-control wp50" name="images[{%=o.idx%}][description]"></textarea>
        </div>
      </div>


      <!--<div class="form-group">
        <label class="col-sm-2 control-label" for="">序号</label>
        <div class="col-sm-10  ">
          <input type="text" placeholder="" value="{%=o.idx%}" id="" name="images[{%=o.idx%}][listorder]" class="form-control inline-block w50">
        </div>
      </div>-->
  </div>
</div>

</script>


<!--js template-->
<script src="<?php echo ASSETS;?>plugins/tmpl.min.js" type="text/javascript"></script>
<script src="<?php echo ASSETS;?>plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="<?php echo ASSETS;?>plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
<link type="text/css" rel="stylesheet" href="<?php echo ASSETS;?>/plugins/jquery-file-upload/css/jquery.fileupload.css">
<!--省市区三级联动-->
<script src="<?php echo ASSETS;?>plugins/jquery.cityselect.js" type="text/javascript"></script>

<!-- form validate -->
<script src="<?php echo ASSETS;?>/plugins/jquery-validate/jquery.validate.min.js"></script>
<script src="<?php echo ASSETS;?>/plugins/jquery-validate/additional-methods.min.js"></script>



<script type="text/javascript">
    $('#type').change(function (){
        if($(this).val() == 'community'){
            $('#quzi_type').hide();
        }else{
            $('#quzi_type').show();
        }
    });
    $(function(){
        //验证表单
        $("#sliderForm").validate({
            rules: {
                title: "required",
                war_id: "required",
                netbar_id: "required",
                game_id: "required"
            },
            messages: {
                title: "请输入幻灯片标题",
                war_id: "请选择比赛",
                netbar_id: "请选择网吧",
                game_id: "请选择游戏"
            },
            errorPlacement: function(error, element) {
                element.parent().addClass('has-error');
            },
            onfocusout: function(element) {
                //this.element(element);
            },
            success: function(label, element){
                $(element).parent().removeClass('has-error');
            }
        });
    });

    var game_url = "<?php echo U('slider/gameSelect');?>";
    function select_type() {
        if ($("#type").val() == 'game') {
            $.getJSON(game_url, {}, function (data) {
                var select_html = '<select class="form-control wp50" name="fk">';
                for (var i = 0; i < data.length; i++) {
                    select_html += '<option value="' + data[i]['id'] + '">' + data[i]['title'] + '</option>';
                }
                select_html += '</select>';
                $("#html_vessel").html(select_html);
            });
        } else {
            $("#html_vessel").html('');
        }

    }
    var is_true = true;
    function chk(a) {
        var b = 'title_' + a;
        var c = 'title_' + a + '_error';
        var d = 'title_' + a + '_error i';
        var e = 'title_' + a + '_error_msg';
        var val = $('#' + b).val();
        $('#' + b).parent().parent().removeClass('has-error').removeClass('has-success').removeClass('has-warning');
        $('#' + d).removeClass('fa-times-circle-o').removeClass('fa-check').removeClass('fa-bell-o');
        $('#' + c).hide();
        if (val == '') {
            $('#' + b).parent().parent().addClass('has-error');
            $('#' + d).addClass('fa-times-circle-o');
            $('#' + e).show();
            $('#' + c).show();
            is_true = false;
        } else {
            $('#' + b).parent().parent().addClass('has-success');
            $('#' + c).attr('for', 'inputSuccess');
            $('#' + d).addClass('fa-check');
            $('#' + e).hide();
            $('#' + c).show();
        }
    }
    $(function () {
        $('#title').blur(function () {
            var that = $(this);
            var val = that.val();
            $(this).parent().parent().removeClass('has-error').removeClass('has-success').removeClass('has-warning');
            $('#title_error i').removeClass('fa-times-circle-o').removeClass('fa-check').removeClass('fa-bell-o');
            $('#title_error').hide();
            if (val == '') {
                $(this).parent().parent().addClass('has-error');
                $('#title_error i').addClass('fa-times-circle-o');
                $('#title_error_msg').show();
                $('#title_error').show();
            } else {
                var url = "<?php echo U('admin/slider/check_title_ajax');?>";
                $.ajax({
                    async: false,
                    type: 'post',
                    data: 'title=' + val,
                    url: url,
                    success: function (data) {
                        if (data == 1) {
                            that.parent().parent().addClass('has-warning');
                            $('#title_error').attr('for', 'inputWarning');
                            $('#title_error').show();
                            $('#title_error_msg').html("该幻灯片已存在，请更换标题名称！");
                            $('#title_error i').addClass('fa-bell-o');
                            $('#title_error_msg').show();
                        } else {
                            that.parent().parent().addClass('has-success');
                            $('#title_error').attr('for', 'inputSuccess');
                            $('#title_error i').addClass('fa-check');
                            $('#title_error_msg').hide();
                            $('#title_error').show();
                        }
                    }
                });
            }
        });
    });
    function sub() {
        var title = $('#title').val();
        if (title == '') {
            $('#title').parent().parent().addClass('has-error');
            $('#title_error i').addClass('fa-times-circle-o');
            $('#title_error_msg').show();
            $('#title_error').show();
            is_true = false;
        } else {
            var url = "<?php echo U('admin/slider/check_title_ajax');?>";
            $.ajax({
                async: false,
                type: 'post',
                data: 'title=' + title,
                url: url,
                success: function (data) {
                    if (data == 1) {
                        $('#title').parent().parent().addClass('has-warning');
                        $('#title_error').attr('for', 'inputWarning');
                        $('#title_error').show();
                        $('#title_error_msg').html("该幻灯片已存在，请更换标题名称！");
                        $('#title_error i').addClass('fa-bell-o');
                        $('#title_error_msg').show();
                        is_true = false;
                    } else {
                        $('#title').parent().parent().addClass('has-success');
                        $('#title_error').attr('for', 'inputSuccess');
                        $('#title_error i').addClass('fa-check');
                        $('#title_error_msg').hide();
                        $('#title_error').show();
                    }
                }
            });
        }
        if (istrue) {
            return false;
        } else {
            return false;
        }
    }
    //===================BEGIN 添加幻灯片======================
    //页面配置項
    var PageModule = {
        sindex: 0
    };
    function addSlide() {
        var i = PageModule.sindex + 1;
        PageModule.sindex = i;
        var tpl = tmpl("tmpl-slide", {idx: i});

        $("#slides_placehold").append(tpl);
        $.AdminLTE.boxWidget.activate();
        return false;
    }
    //动态删除图片Box
    function removeSlider(o) {
        bootbox.confirm("您确定要删除该图片吗？", function (data) {
            if (data == false) {
                return false;
            } else {
                $(o).parent().parent().parent().remove();
            }
        });
        return false;
    }
    //===================END 添加幻灯片======================

    var thumb_id = null;
    var img_id = null;
    //上传图片
    function upload(a) {
        thumb_id = $(a).parent().prev().attr('id');
        img_id = $(a).parent().parent().prev().attr('value');
        $('#FileUploadModal').modal({});
    }
    var file_upload_url = '<?php echo U("slider/slider_upload");?>';

    //上传图片
    $('#fileupload').fileupload({
        url: file_upload_url,
        dataType: 'json',
        autoUpload: true,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 999000,
        // Enable image resizing, except for Android and Opera,
        // which actually support image resizing, but fail to
        // send Blob objects via XHR requests:
        disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
        previewMaxWidth: 100,
        previewMaxHeight: 100,
        previewCrop: true
    }).on("fileuploadadd", function (e, data) {
        data.context = $("#images-zone");
        //init
        data.context.html("");
        $("#progress").html("");

        $("#loading-progress").hide();
        $("#loading-done").css('display', 'inline-block');

    }).on("fileuploadprogressall", function (e, data) {

        var progress = parseInt(data.loaded / data.total * 100, 10);
        $("#progress").html(progress + '%');

    }).on("fileuploaddone", function (e, data) {

        $.each(data.result.files, function (index, file) {
            var img_url = file.url;
            var thumbnail = $('<img>').attr('src', file.thumbnailUrl);
            data.context.append(thumbnail);
            $("#imageUrlHidden").val(img_url);
        });
        $("#loading-progress").hide();
        $("#loading-done").css('display', 'inline-block');

    }).on("fileuploadfail", function (e, data) {
        console.log("file upload fail");
    });
    //上传完毕点击确定
    function onUpload() {
        var img_url = $("#imageUrlHidden").val();
        $('#' + thumb_id).attr('value', img_url);
        $("#img_" + img_id).attr('src', img_url);
        $("#imageUrlHidden").val('');
        $("#images-zone").find('img').attr('src', '');
        $("#loading-done").hide();
        $('#FileUploadModal').modal('hide');
    }
    $(function () {
        //省市区三级联动
        //注意三级联动结构：#region(自定义) > .province + .city + .district
        $("#region").citySelect({
            nodata: "none",
            required: false,
            //province:17,//"河南省"
            //city:189,
            //district: 22222,
            url: "<?php echo U('Base/getCity');?>",
        });

        $("#searchNetbar").click(function () {
            var url = "<?php echo U('Base/searchNetbar');?>";
            $.getJSON(url, {
                'province': $("#province_id").val(),
                'city': $("#city_id").val(),
                'distract': $("#distract_id").val()
            }, function (data) {
                console.log(data);
                var selOpt = $("#netbar option");
                selOpt.remove();
                for (var i = 0; i < data.length; i++) {
                    var selObj = $("#netbar");
                    selObj.append("<option value='" + data[i].id + "'>" + data[i].title + "</option>");
                }
            });
        });

    });

</script>
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