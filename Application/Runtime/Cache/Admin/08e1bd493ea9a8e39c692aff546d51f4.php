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
            <div class="col-md-12 " style="">
                <div class="box box-solid padding20" style="">
                    <table class="table table-hover table-noboder">
                        <tbody>
                        <tr>
                            <td width="20%" class="text-right">游戏比赛标题：</td>
                            <td><?php echo ($data["title"]); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">游戏名称：</td>
                            <td><?php echo ($data["game_title"]); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">房主：</td>
                            <td><?php echo ($data["real_name"]); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">开始时间：</td>
                            <td><?php echo ($data["begin_time"]); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">游戏人数：</td>
                            <td><?php echo ($data["team"]); ?>人</td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">游戏奖金：</td>
                            <td><?php echo ($data["prize"]); ?>元</td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">比赛场数：</td>
                            <td><?php echo ($data["times"]); ?>场</td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">已进行场数：</td>
                            <td><?php echo ($data[times] - $data[remain]); ?>场</td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">游戏状态：</td>
                            <td>
                                <?php if($data[status] == 'draft'): ?><span class="label label-success">准备中</span>
                                <?php elseif($data[status] == 'doing'): ?>
                                  <span class="label label-success">比赛进行中</span>
                                <?php elseif($data[status] == 'pedding'): ?>
                                  <span class="label label-info">比赛应战中</span>
                                <?php elseif($data[status] == 'done'): ?>
                                  <span class="label label-default">比赛已结束</span>
                                <?php elseif($data[status] == 'delay'): ?>
                                  <span class="label label-waring">比赛延期中</span><?php endif; ?>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="text-right">所在网吧：</td>
                            <td>
                                <?php echo ($data["netbar_title"]); ?>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="text-right">游戏规则：</td>
                            <td>
                                <?php echo ($data["rule"]); ?>
                            </td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right"></td>
                            <td>
                                <a href="<?php echo U('war/index');?>" class="btn btn-info btn-flat">返回游戏桌列表</a>
                            </td>
                        </tr>



                        </tbody>
                    </table>
                </div>
            </div>
        </div>


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