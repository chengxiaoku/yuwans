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
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">

                        <div class="select pull-right">
                            <form method="post" action="<?php echo U('User/player');?>">
                                <div class="input-group" style="width:350px; margin-left: 5px;">
                                    <input type="text" name="seek" class="form-control" value="<?php echo ($keyword); ?>" placeholder="输入姓名、昵称、电话号码查找">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th width="13%" class="vc-middle">姓名</th>
                                <th width="13%" class="vc-middle" >昵称</th>
                                <th width="13%" class="vc-middle" >手机号码</th>
                                <th width="13%" class="vc-middle" >游戏年龄</th>
                                <th width="13%" class="vc-middle" >余额</th>
                                <th width="15%" class="vc-middle" >战绩</th>
                                <th width="13%" style="text-align:center;">管理操作</th>
                            </tr>
                            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                  <td class="vc-middle"><?php echo ($vo["real_name"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo["nickname"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo["tel"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo[user_player][game_age]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo[user_player][balance]); ?></td>
                                  <td class="vc-middle">
                                      <label class="w80">胜利次数：</label><?php echo ($vo[user_player][win_times]); ?><br>
                                      <label class="w80">失败次数：</label><?php echo ($vo[user_player][lose_times]); ?><br>
                                      <label class="w80">违约次数：</label><?php echo ($vo[user_player][fail_times]); ?>
                                  </td>
                                  <td style="text-align:center;" class="vc-middle">
                                      <a href="<?php echo U('User/playerUpdate', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">编辑</a>
                                      <a href="<?php echo U('User/del', array('id'=>$vo[id],'type'=>'user_player'));?>" class="btn btn-default btn-xs" onclick="return deleteData(this)">删除</a>
                                  </td>
                              </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>

                    </div>
                    <div class="box-footer text-right">
                        <ul class="pagination">
                            <li class="paginate_button "><?php echo ($page); ?></li>
                        </ul>
                    </div>
                </div><!-- end box-->
            </div>
        </div>
    </section>
    <!-- /.content  -->
</div>
<script type="text/javascript">
    function deleteData() {
        if (confirm("确认要删除该条数据？")) {
            return true;
        } else {
            return false;
        }
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