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
            <!-- left column -->
            <div class="col-md-8" style="">
                <!-- general form elements -->
                <div class="box box-solid" style="">
                    <!-- form start -->
                    <form role="form" method="post" action="<?php echo U('User/netbarUpdate');?>">
                        <div class="box-body" style="">
                            <div class="form-group"><!-- has-error-->
                                <label>网吧名称<span class="required">*</span></label>
                                <div>
                                    <input name="user_netbar[title]" type="text" placeholder="输入网吧名称 ..."
                                           class="form-control w500 inline-block"
                                           value="<?php echo ($data[user_netbar][title]); ?>">
                                    <em class="help-block"></em>
                                </div>
                            </div>


                            <div class="form-group">
                                <label>管理员</label>
                                <div>
                                    <input name="real_name" value="<?php echo ($data[real_name]); ?>" type="text" placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>手机号码</label>
                                <div>
                                    <input name="tel" value="<?php echo ($data[tel]); ?>" type="text" placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>身份证</label>
                                <div>
                                    <input name="identity" value="<?php echo ($data[identity]); ?>" type="text" placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>选择地区<span class="required"></span></label>
                                <div id="region">
                                    <select class="form-control w150 inline-block province"
                                            id="province_id" name="province_id">
                                        <option value="">≡ 请选择省 ≡</option>
                                    </select>
                                    <select class="form-control w150 inline-block city"
                                            id="city_id" name="city_id">
                                        <option value="">≡请选择市≡</option>
                                    </select>
                                    <select class="form-control w150 inline-block district"
                                            id="distract_id" name="distract_id">
                                        <option value="">≡ 请选择区 ≡</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>详细地址</label>
                                <div>
                                    <input name="address" value="<?php echo ($data[address]); ?>" type="text" placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>支付宝</label>
                                <div>
                                    <input name="alipay" value="<?php echo ($data[alipay]); ?>" type="text" placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>银行卡</label>
                                <div>
                                    <input name="bank" value="<?php echo ($data[bank]); ?>" type="text" placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>余额</label>
                                <div>
                                    <input name="user_netbar[balance]" value="<?php echo ($data[user_netbar][balance]); ?>" type="text"
                                           placeholder=""
                                           class="form-control w500 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="label_mess">营业执照上传</label>
                                <div class="input-group" style="position: relative; left: 90px; top: -30px;">
                                    <input type="text" placeholder="营业执照上传 ..." readonly="readonly" style="width: 150px;"  class="form-control" id="uiFileUploadInput1" data-thumb="">
                                    <button id="img_ok_1" onclick="upload1()" type="button" class="btn btn-success btn-flat"><i class="fa fw fa-plus-circle"></i></button>
                                    <span style="margin-left: 15px; font-size: 14px; color: #8aa4af">只能上传一张营业执照</span>
                                </div>
                            </div>
                            <div class="form-group" id="new_img_adress">
                                <div>营业执照</div>

                                    <span class='pull-left' style='position:relative;background-color: lightgrey; padding: 10px; margin-left: 5px;'>
                                    <img id="img" style='width: 160px; height: 160px;' src="<?php echo ($data['license']); ?>"/>
                                    <span style='position: absolute;left: 80px;'>
                                        <span onclick='img_sc(this)'> 删除</span>
                                    </span>
                                        <input type='hidden' name='license' value="<?php echo ($data['license']); ?>">
                                    </sapn>
                                    </span>

                            </div>
                        </div>

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary w100">保存</button>
                            <a type="submit" class="btn btn-info w100 ml20"
                               onclick="history.go('-1')">返回</a>
                        </div>

                        <input type="hidden" name="id" value="<?php echo ($data["id"]); ?>">
                    </form>

                </div><!-- /.box -->
            </div><!--/.col (left) -->
        </div>
    </section>
    <!-- /.content  -->
</div>

<!-- 上传图片模态框-->
<div class="modal fade " id="imageUploadModal3_3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="">上传营业执照</h4>
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
<!--省市区三级联动-->
<script src="<?php echo ASSETS;?>plugins/jquery.cityselect.js" type="text/javascript"></script>

<!-- jquery file upload -->
<script src="<?php echo ASSETS;?>plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<?php echo ASSETS;?>plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"></script>
<link href="<?php echo ASSETS;?>plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />

<!--kind editor-->
<script charset="utf-8" type="text/javascript" src="<?php echo ASSETS;?>plugins/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
    $(function (){
        if($.trim($("#img").attr('src')) != ''){
            $("#img_ok_1").attr('disabled','true');
        }
    });
    function img_sc(obj){
        $(obj).parent().parent().slideUp(500,function (){
            $(obj).parent().parent().remove();
            $("#img_ok_1").removeAttr('disabled');
        });
        $("#uiFileUploadInput1").val('');
    }
    $("#img_ok").click(function (){

            var img_adress = $("#uiFileUploadInput1").attr('data-thumb');
            $("#new_img_adress").append(
                  "<span class='pull-left' style='position:relative;background-color: lightgrey; padding: 10px; margin-left: 5px;'><img id='img' style='width: 160px; height: 160px;' src='"+img_adress+"'/> <span style='position: absolute;left: 80px;'> <span onclick='img_sc(this)'> 删除</span> </span> <input type='hidden' name='license' value='"+img_adress+"'> </sapn> </span>");
        $("#img_ok_1").attr('disabled','true');
    });
    //营业执照上传
    function upload1(){
        var img_ok = $("#img_ok");
        img_ok.parent().prev().find('img').attr('src','');
        $("#imageUploadModal3_3").modal({});
    }

    var province = '<?php echo ($province_id); ?>';
    var city = '<?php echo ($city_id); ?>';
    var distract = '<?php echo ($distract_id); ?>';

    province = parseInt(province);
    city = parseInt(city);
    distract = parseInt(distract);

    $(function () {
        //省市区三级联动
        //注意三级联动结构：#region(自定义) > .province + .city + .district
        $("#region").citySelect({
            nodata: "none",
            required: false,
            province:province, //"河南省"
            city:city,
            district: distract,
            url: "<?php echo U('Base/getCity');?>",
        });

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