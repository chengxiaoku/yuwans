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
                            <td width="20%" class="text-right">账单流水号：</td>
                            <td><?php echo ($data[0]['sn']); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">用户：</td>
                            <td><?php echo ($data_name); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">金额：</td>
                            <td><?php echo ($data[0]['money']); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">类型：</td>
                            <td>
                                <?php if($data[0]['type'] == 'payment'): ?>在线支付
                                    <?php elseif($data[0]['type'] == 'transfer'): ?>
                                    转账
                                    <?php elseif($data[0]['type'] == 'recharge'): ?>
                                    代理充值
                                    <?php elseif($data[0]['type'] == 'prize'): ?>
                                    现金
                                    <?php elseif($data[0]['type'] == 'agent_recharge'): ?>
                                    自己充值<?php endif; ?>
                            </td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">支付方式：</td>
                            <td>
                                <?php if($data[0]['pay_type'] == 'alipay'): ?>支付宝支付
                                    <?php elseif($data[0]['pay_type'] == 'wx'): ?>
                                    微信支付
                                    <?php elseif($data[0]['pay_type'] == 'paymoney'): ?>
                                    现金支付<?php endif; ?>
                            </td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">支付状态：</td>
                            <td>
                                <?php if($data[0]['pay_status'] == 'success'): ?><span class="label label-success">成功</span>
                                    <?php elseif($data[0]['pay_status'] == 'fail'): ?>
                                    <span class="label label-danger">失败</span>
                                    <?php elseif($data[0]['pay_status'] == 'pedding'): ?>
                                    <span class="label label-info">正在进行</span><?php endif; ?>
                            </td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">时间：</td>
                            <td><?php echo ($data[0]['add_time']); ?></td>
                        </tr>

                        <tr>
                            <td width="20%" class="text-right">账单说明：</td>
                            <td>
                                <?php echo ($data[0]['remark']); ?>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="text-right"></td>
                            <td>
                                <button class="btn btn-info btn-flat" onclick="javascript:history.go(-1)">返回</button>
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