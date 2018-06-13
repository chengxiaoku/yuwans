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
<?php echo ($page = 'demo'); ?>
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
            <li class="treeview" id="jurisdiction">
                <a href="<?php echo U('User/player');?>">
                    <i class="glyphicon glyphicon-user"></i>
                    <span>管理员设置</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu menu-open">
                    <li><a href="<?php echo U('User/player');?>"><i class="fa fa-circle-o"></i>管理员管理</a></li>
                    <li><a href="<?php echo U('User/netbar');?>"><i class="fa fa-circle-o"></i>角色管理</a></li>
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

        <div class="row">
            <div class="col-md-8">
                <div class="box box-primary">
                    <!-- form start -->
                    <form role="form">
                        <div class="box-body padding20">
                            <div class="form-group has-error">
                                <label for="">设置字段A<span class="required">*</span></label>
                                <div>
                                    <input type="text" class="form-control wp50 inline-block" id="" placeholder="输入设置字段A">
                                    <label for="inputError" class="control-label"><i class="fa fa-times-circle-o"></i> 设置字段A</label>
                                </div>
                            </div>
                            <div class="form-group has-success">
                                <label for="">设置字段B</label>
                                <div>
                                    <input type="text" placeholder="输入 ..." id="inputSuccess" class="form-control wp50 inline-block">
                                    <label for="inputSuccess" class="control-label"><i class="fa fa-check"></i> 验证成功提示</label>
                                </div>
                            </div>
                            <div class="form-group has-warning">
                                <label for="">警告信息</label>
                                <div>
                                    <input type="text" placeholder="输入 ..." id="inputWarning" class="form-control wp50 inline-block">
                                    <label for="inputWarning" class="control-label"><i class="fa fa-bell-o"></i> 警告提示信息</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">设置字段B<span class="required">*</span></label>
                                <input type="text" class="form-control wp50" id="" placeholder="输入设置字段B">
                            </div>
                            <div class="form-group">
                                <label>字段失效</label>
                                <input type="text" class="form-control wp50" disabled="" value="[大首][首页][底部]980*90">
                            </div>
                            <div class="form-group input-group wp50">
                                <label for="">日期字段</label>
                                <div>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="begin-time" placeholder="">
                                        <div class="input-group-btn">
                                            <button class="btn btn-success btn-flat" type="button" onclick="return selectDate(this, 'begin-time')"><i class="fa fa-clock-o"></i></button>
                                        </div>
                                    </div>
                                    <!-- <em class="help-block"></em> -->
                                </div>
                            </div>
                            <div class="form-group input-group wp50">
                                <label for="">上传图片字段</label>
                                <div>
                                    <div class="input-group">
                                        <input type="text" placeholder="上传缩略图 ..." class="form-control">
                                        <div class="input-group-btn">
                                            <button onclick="upload()" type="button" class="btn btn-success btn-flat"><i class="fa fw fa-plus-circle"></i></button>
                                        </div>
                                    </div>
                                    <em class="help-block"></em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>多选框</label>
                                <div>
                                    <div class="checkbox inline-block mt0">
                                        <label>
                                            <input type="checkbox">选项A
                                        </label>
                                    </div>
                                    <div class="checkbox inline-block mt0 ml20">
                                        <label>
                                            <input type="checkbox">选项B
                                        </label>
                                    </div>
                                    <div class="checkbox inline-block mt0 ml20">
                                        <label>
                                            <input type="checkbox">选项C
                                        </label>
                                    </div>
                                    <div class="checkbox inline-block mt0 ml20">
                                        <label>
                                            <input type="checkbox">选项D
                                        </label>
                                    </div>
                                </div>
                                <em class="help-block">说明：备注内容</em>
                            </div>
                            <div class="form-group">
                                <label for="">单选框</label>
                                <div>
                                    <div class="radio inline-block mt0">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="" value="option1" checked="">选项A
                                        </label>
                                    </div>
                                    <div class="radio inline-block mt0 ml20">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="" value="option2">选项B
                                        </label>
                                    </div>
                                    <div class="radio inline-block mt0 ml20">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="" value="option3">选项C
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">下拉框</label>
                                <select class="form-control wp50">
                                    <option value="0">≡ 请选择内容 ≡</option>
                                    <option value="40">选项A</option>
                                    <option value="42">选项B</option>
                                    <option value="44">选项C</option>
                                    <option value="45">选项D</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="">带有图标</label>
                                <div class="input-group wp50">
                                    <input type="text" class="form-control">
                                    <span class="input-group-addon"><i class="fa fa-check"></i></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">带有图标</label>
                                <div class="input-group wp50">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input type="email" placeholder="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer p20 ">
                            <button type="submit" class="btn btn-primary w100">保存</button>
                            <a type="submit" class="btn btn-info w100 ml20" onclick="history.go('-1')">返回</a>
                        </div>
                    </form>
                </div><!--end box-->

                <div class="box box-solid">
                    <div class="box-header">
                        <i class="fa fa-text-width"></i>
                        <h3 class="box-title">这里是标题 - 表格</h3>
                        <div class="select pull-right">
                            <div class="input-group" style="width:250px; margin-left: 5px;">
                                <input type="text" name="" class="form-control  " style="" placeholder="">
                                <div class="input-group-btn">
                                    <button class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th width="10%" class="tc">行号</th>
                                <th width="50%">标题</th>
                                <th width="30%" style="text-align:center;">管理操作</th>
                            </tr>
                            <tr>
                                <td class="tc">1</td>
                                <td><a href="#">当我们关注戛纳的时候</a></td>
                                <td style="text-align:center;">
                                    <a href="#" class="btn btn-default btn-xs">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="tc">1</td>
                                <td><a href="#">当我们关注戛纳的时候</a></td>
                                <td style="text-align:center;">
                                    <a href="#" class="btn btn-default btn-xs">删除</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="tc">2</td>
                                <td><a href="#">当我们关注戛纳的时候</a></td>
                                <td style="text-align:center;">
                                    <a href="#" class="btn btn-default btn-xs">删除</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="text-right">
                            <ul class="pagination">
                                <li class="paginate_button previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">上一页</a></li>
                                <li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
                                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
                                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
                                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li>
                                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li>
                                <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li>
                                <li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">下一页</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary w100">保存</button>
                    </div>
                </div><!-- end box-->

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