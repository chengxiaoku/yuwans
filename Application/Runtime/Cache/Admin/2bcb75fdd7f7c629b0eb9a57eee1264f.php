<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
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
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <div class="btn-group" style="margin-left: 50px;" id="grop">
                            <!--btn-success-->
                            <a class="btn" type="button" href="<?php echo U('money/index',array('type'=>'all'));?>" >全部</a>
                            <a class="btn" type="button" href="<?php echo U('money/index',array('type'=>'bonus'));?>">奖金</a>
                            <a class="btn" type="button" href="<?php echo U('money/index',array('type'=>'recharge'));?>">充值</a>
                            <!-- btn-success btn-default-->
                        </div>
                        <div class="select pull-right">
                            <form method="post" action="<?php echo U('Money/index_type');?>">
                                <div class="input-group" style="width:350px; margin-left: 5px;">
                                    <input type="text" name="sec" class="form-control" value="<?php echo ($keyword); ?>" placeholder="输入流水号、用户姓名查找">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" id="sel_ok" type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th width="13%" class="vc-middle">流水号</th>
                                <th width="10%" class="vc-middle" >用户</th>
                                <th width="10%" class="vc-middle" >金额</th>
                                <th width="10%" class="vc-middle" >类型</th>
                                <th width="20%" class="vc-middle" >时间</th>
                                <th width="13%" class="vc-middle" >方式</th>
                                <th width="13%" class="vc-middle" >状态</th>
                                <th width="10%" style="text-align:center;">管理操作</th>
                            </tr>

                            <?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?><tr>
                                    <td class="vc-middle"><?php echo ($row["sn"]); ?></td>
                                    <td class="vc-middle"><?php echo ($row["username"]); ?></td>
                                    <td class="vc-middle"><?php echo ($row["money"]); ?></td>
                                    <td class="vc-middle">

                                    <?php if($row["type"] == 'payment'): ?>在线支付
                                    <?php elseif($row["type"] == 'transfer'): ?>
                                        转账
                                    <?php elseif($row["type"] == 'recharge'): ?>
                                        代理充值
                                    <?php elseif($row["type"] == 'prize'): ?>
                                        现金
                                    <?php elseif($row["type"] == 'agent_recharge'): ?>
                                        自己充值<?php endif; ?>
                                    </td>
                                    <td class="vc-middle"><?php echo ($row["add_time"]); ?></td>
                                    <td class="vc-middle">
                                        <?php if($row["pay_type"] == 'alipay'): ?>支付宝支付
                                        <?php elseif($row["pay_type"] == 'wx'): ?>
                                            微信支付
                                        <?php elseif($row["pay_type"] == 'paymoney'): ?>
                                            现金支付<?php endif; ?>
                                    </td>
                                    <td class="vc-middle">
                                            <?php if($row["pay_status"] == 'success'): ?><span class="label label-success">成功</span>
                                            <?php elseif($row["pay_status"] == 'fail'): ?>
                                            <span class="label label-danger">失败</span>
                                            <?php elseif($row["pay_status"] == 'pedding'): ?>
                                            <span class="label label-info">正在进行</span><?php endif; ?>
                                    </td>
                                    <td style="text-align:center;" class="vc-middle">
                                        <a href="<?php echo U('Money/details', array('id'=>$row['id']));?>" class="btn btn-default btn-xs">查看详情</a>
                                    </td>
                                </tr><?php endforeach; endif; else: echo "" ;endif; ?>


                            </tbody>
                        </table>

                    </div>
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-sm-5"></div>
                            <div class=" col-sm-7 ">
                                <div class="text-right">
                                    <?php echo ($page); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end box-->
            </div>
        </div>
    </section>
    <!-- /.content  -->
</div>
<script type="text/javascript">
    var type = "<?php echo ($ty); ?>";

    if(type == 'all'){
        $("#grop a:eq(0)").addClass('btn-success');
    }else if(type == 'bonus'){
        $("#grop a:eq(1)").addClass('btn-success');
    }else if(type == 'recharge'){
        $("#grop a:eq(2)").addClass('btn-success');
    }
    //搜索判断 输入为空允许搜索
   $("#sel_ok").click(function (){
       var _val = $("input[name=sec]").val();
       var val = $.trim(_val);
       if(val == ''){
            return false;
       }
   })


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