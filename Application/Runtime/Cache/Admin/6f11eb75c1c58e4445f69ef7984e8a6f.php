<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($page_title); ?> | 管理后台</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="<?php echo ASSETS;?>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- FontAwesome 4.3.0 -->
    <link href="<?php echo ASSETS;?>fonts/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="<?php echo ASSETS;?>fonts/ionicons-2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<?php echo ASSETS;?>css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo ASSETS;?>css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />
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
    <link href="<?php echo ASSETS;?>css/custom.css" rel="stylesheet" type="text/css" />
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
                        <a class="dropdown-toggle" href="<?php echo U('Auth/logout');?>" >
                            <i class="glyphicon glyphicon-off"></i><span>安全退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
<style>
    .foncolr {
        color: #dff0d8;
    }
</style>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <!-- <li class="header">MAIN NAVIGATION</li> -->
            <li id="index">
                <a href="<?php echo U('Index/index');?>">
                <i class="fa fa-dashboard"></i> <span>控制面板</span>
                </a>
            </li>
            <li id="war">
                <a href="<?php echo U('War/index');?>">
                    <i class="fa  fa-trophy"></i>
                    <span>对战列表</span>
                </a>
            </li>
            <!--用户中心-->
            <li class="treeview" id="user">
                <a href="<?php echo U('User/player');?>">
                    <i class="glyphicon glyphicon-user"></i>
                    <span>用户管理</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu menu-open">
                    <li><a href="<?php echo U('User/player');?>"><i class="fa fa-circle-o"></i>玩家</a></li>
                    <li><a href="<?php echo U('User/netbar');?>"><i class="fa fa-circle-o"></i>网吧</a></li>
                </ul>
            </li>


            <li id="comm">
                <a href="<?php echo U('Community/index');?>">
                    <i class="fa  fa-weixin"></i>
                    <span>圈子管理</span>
                </a>
            </li>

            <li id="myspace">
                <a href="<?php echo U('Myspace/index');?>">
                    <i class="fa  fa-weixin"></i>
                    <span>说说管理</span>
                </a>
            </li>

            <li id="slider">
                <a href="<?php echo U('Slider/index');?>">
                    <i class="fa  fa-file-image-o"></i>
                    <span>幻灯片</span>
                </a>
            </li>

            <li class="header"></li>

            <li id="money">
                <a href="<?php echo U('Money/index');?>">
                    <i class="glyphicon glyphicon-credit-card"></i>
                    <span>收支明细</span>
                </a>
            </li>
            <li id="admin">
                <a href="<?php echo U('Admin/index');?>">
                    <i class="fa fa-drupal"></i>
                    <span>管理员</span>
                </a>
            </li>
            <li id="game">
                <a href="<?php echo U('Game/index');?>">
                    <i class="fa fa-gamepad"></i>
                    <span>游戏设置</span>
                </a>
            </li>
            <li id="setting">
                <a href="<?php echo U('Setting/index');?>">
                    <i class="fa fa-gear"></i>
                    <span>网站配置</span>
                </a>
            </li>

            <li class="treeview" id="demo">
                <a href="<?php echo U('Demo/index');?>">
                    <i class="fa fa-leaf"></i>
                    <span>UI参考</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu menu-open">
                    <li><a href="<?php echo U('Demo/index');?>"><i class="fa fa-circle-o"></i>ui</a></li>
                    <li><a href="<?php echo U('Demo/blank');?>"><i class="fa fa-circle-o"></i>blank page</a></li>
                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<script type="text/javascript">
    var page = '<?php echo $page; ?>';
    $(function (){
        var page_id = '#' + page;
        $(page_id).addClass("active");
    })


</script>
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
        <h1>空页面</h1>
    </section>
    <!-- /.content  -->

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