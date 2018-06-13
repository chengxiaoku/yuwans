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
        <div class="row" style="">
            <!-- left column -->
            <div class="col-md-8" style="">
                <!-- general form elements -->
                <div class="box box-solid" style="">
                    <!-- form start -->
                    <form role="form" method="post" action="<?php echo U('Game/add');?>">
                        <div class="box-body" style="">
                            <div class="form-group"><!-- has-error-->
                                <label>游戏名称 <span class="required">*</span></label>
                                <div>
                                    <input name="title" type="text" placeholder="输入游戏标题 ..."
                                           class="form-control w500 inline-block"
                                           value="">
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group input-group w500">
                                <label>图片</label>
                                <div>

                                    <?php if(!empty($data[thumb])): ?><img src="<?php echo ($data[thumb]); ?>" width="200" id="previewThumb"><?php endif; ?>
                                    <input id="thumb" class="form-control w500 inline-block" name="thumb" type="text" style="margin-bottom:10px;" >
                                    <div style="margin-top:10px;">
                                        <input id="ke-upload-button" type="button" value="上传图片" class="btn btn-success btn-flat">

                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <label>场次</label>
                                <div>
                                    <input name="times" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>最多参与人数</label>
                                <div>
                                    <input name="player_max" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <label>最小参与人数</label>
                                <div>
                                    <input name="player_min" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div> -->

                            <div class="form-group">
                                <label>最大奖金额</label>
                                <div>
                                    <input name="prize_max" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>最小奖金额</label>
                                <div>

                                    <input name="prize_min" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">

                                </div>

                                <div class="form-group">
                                    <label>描述</label>
                                    <textarea name="description" id="content" class="form-control wp50" rows="6"
                                              placeholder="输入描述 ..."></textarea>
                                </div>
                            </div>

                        </div>

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary w100">保存</button>
                            <a type="submit" class="btn btn-info w100 ml20"
                               onclick="history.go('-1')">返回</a>
                        </div>

                    </form>

                </div><!-- /.box -->
            </div><!--/.col (left) -->
        </div>
    </section>
    <!-- /.content  -->
</div>

<!--kind editor-->
<script charset="utf-8" type="text/javascript" src="<?php echo ASSETS;?>plugins/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
    var KIND_EDITOR;
    KindEditor.ready(function (K) {
        var options = {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            height: 300,
            allowFileUpload: true,
            uploadJson: '<?php echo ASSETS;?>plugins/kindeditor/php/upload_json.php',
            items: [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        };
        KIND_EDITOR = K.create('#content', options);

        //上传按钮
        var uploadButton = K.uploadbutton({
            button : K('#ke-upload-button')[0],
            fieldName : 'thumb',
            url : '<?php echo U("Game/upload");?>',
            afterUpload : function(data) {
                console.log(data);
                if (data.error === 0) {
                    $("#previewThumb").attr("src", data.url);
                    $("#thumb").val(data.url);
                } else {
                    alert(data.error);
                }
            }
        });
        uploadButton.fileBox.change(function(e) {
            uploadButton.submit();
        });

    });

    function uploadImage() {

    }

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