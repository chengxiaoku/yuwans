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
<?php echo ($page = 'permission'); ?>
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
<style type="text/css">
    .error{
        color: red;
    }

</style>
<div class="content-wrapper">
    <!--引入表单验证-->
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
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
            <div class="col-md-8">
                <!-- general form elements -->
                <div class="box box-primary">

                    <!-- form start -->
                    <form role="form" id="Myform" action="<?php echo U('Role/admins_update');?>" method="post">

                        <div class="box-body padding20">
                            <div class="form-group ">
                                <input type="hidden" value="<?php echo ($data['id']); ?>" name="role_id">
                                <label for="">用户名<span class="required">*</span></label>
                                <div>
                                    <input type="text" placeholder="输入用户名称" name="username" value="<?php echo ($data['name']); ?>" class="form-control wp50 inline-block">
                                </div>
                            </div>

                            <div class="form-group"><!-- has-error-->
                                <label>密码 <span class="required">*</span></label>
                                <div>
                                    <input name="pwd" id="pwd" type="password" placeholder="输入密码 ..."
                                           class="form-control wp50"
                                    >
                                    <em class="help-block">提示：空表示不修改密码</em>
                                </div>
                            </div>

                            <div class="form-group"><!-- has-error-->
                                <label>确认密码 <span class="required">*</span></label>
                                <div>
                                    <input name="repassword" type="password" placeholder="再一次确认密码 ..."
                                           class="form-control wp50"
                                    >
                                    <em class="help-block"></em>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="">真实姓名<span class="required">*</span></label>
                                <input type="text" placeholder="输入姓名" id="" name="name" value="<?php echo ($data['realname']); ?>" class="form-control wp50" >
                            </div>


                            <div class="form-group">
                                <label for="">所属角色</label>
                                <select class="form-control wp50" name="per">
                                    <?php foreach($sel as $val) :?>
                                        <?php
 if($val['id'] == $data['role_id']){ ?>
                                        <option value="<?php echo ($val['id']); ?>" selected><?php echo ($val['name']); ?></option>
                                    <?php
 }else{ ?>
                                        <option value="<?php echo ($val['id']); ?>" ><?php echo ($val['name']); ?></option>
                                    <?php
 } ?>
                                    <!--<option value="0">≡ 请选择会员组 ≡</option>-->

                                    <?php endforeach;?>
                                </select>
                            </div>

                        </div><!-- /.box-body -->

                        <div class="box-footer p20 ">
                            <button class="btn btn-primary w100" type="submit">保存</button>
                            <a onclick="history.go('-1')" class="btn btn-info w100 ml20" type="submit">返回</a>
                        </div>
                    </form>
                </div><!-- /.box -->

            </div>

        </div>



    </section><!-- /.content -->

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

    $('#Myform').validate({
        rules: {
            username: {
                required: true,
                rangelength:[3,7],
            },

            name:{
                required: true,
                rangelength:[2,7],
            },

            repassword:{
                equalTo: "#pwd"
            }
        },
        messages: {
            username:{
                required:'用户名不能为空!',
                rangelength:'用户名在3~7个字符之间',
            },
            name:{
                required:'真实姓名不能为空!',
                rangelength:'真实姓名个数应该在2~7之间！',
            }
            ,
            repassword:{
                equalTo: "两次密码要相同!"
            }
        },
        focusInvalid:true,
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