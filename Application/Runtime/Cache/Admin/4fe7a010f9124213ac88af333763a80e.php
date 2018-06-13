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
<style>
    .text{
        text-align: center;
    }
</style>
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
                                <form method="post" name="_form">
                                    <div class="input-group" style="width:350px; margin-left: 5px;">
                                        <input type="text" id="ss_id" name="ss" class="form-control" value="" placeholder="搜索说说内容....">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" id="subm"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-hover">
                            <tbody style="text-align: center;">
                            <tr>
                                <th width="15%" class="vc-middle text">用户名</th>
                                <th width="60%" class="vc-middle text" >内容</th>
                                <th width="15%" class="vc-middle text" >时间</th>
                                <th width="10%" class="text" >管理操作</th>
                            </tr>

                            <?php foreach($data as $row) : ?>
                            <tr>
                                <td class="vc-middle"><?php echo $row['username']; ?></td>
                                <td class="vc-middle"><?php echo $row['content']; ?></td>
                                <td class="vc-middle"><?php echo $row['add_time']; ?></td>
                                <td style="text-align:center;" class="vc-middle">
                                    <a href="<?php echo U('Myspace/del', array('id'=>$row['id']));?>" class="btn btn-default btn-xs" onclick="return deleteData(this)">删除</a>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php
 $_page = isset($_GET['page'])?$_GET['page'] :''; if(empty($_page)){ $_page = 1; } ?>
                    <div class="box-footer text-right">
                        <ul class="pagination">
                            <li class="paginate_button previous disabled" id="example2_previous"><a id="sy" aria-controls="example2" data-dt-idx="0" tabindex="0">上一页</a></li>
                            <?php $__FOR_START_20034__=1;$__FOR_END_20034__=$pageCount;for($i=$__FOR_START_20034__;$i < $__FOR_END_20034__;$i+=1){ if( $_page== $i): ?><li class="paginate_button active"><a href="<?php echo U('Myspace/show',array('page'=>$i));?>" aria-controls="example2" data-dt-idx="2" tabindex="0"><?php echo ($i); ?></a></li>
                                <?php else: ?>
                                    <li class="paginate_button"><a href="<?php echo U('Myspace/show',array('page'=>$i));?>" aria-controls="example2" data-dt-idx="2" tabindex="0"><?php echo ($i); ?></a></li><?php endif; } ?>
                            <li class="paginate_button next" id="example2_next"><a id="xy" aria-controls="example2" data-dt-idx="7" tabindex="0">下一页</a></li>
                        </ul>
                    </div>
                </div><!-- end box-->
            </div>
        </div>
    </section>
    <!-- /.content  -->
</div>
<script type="text/javascript">
    //获取总页数
    var _page_num = <?php echo ($pageCount); ?>;
    _page_num -=1;
    //获取当前页数
    var _page_num1 = <?php echo ($_page); ?>;

    function deleteData() {
        if (confirm("确认要删除该条数据？")) {
            return true;
        } else {
            return false;
        }
    }
    $("#subm").click(function (){
        var ss_id=$("#ss_id").val();
        if($.trim(ss_id) ==''){
            alert('搜索不能为空!!');
        }else{
            _form.action="<?php echo U('Myspace/index');?>";
            _form.submit();
        }
    });
    //上一页
    $("#sy").click(function (){
        if(_page_num1 <= _page_num){
            $(this).attr('href',"<?php echo U('Myspace/show',array('page'=>$_page-1));?>");
        }else{
            $(this).attr('href',"<?php echo U('Myspace/show',array('page'=>$_page));?>");
        }

    });
    //下一页
    $("#xy").click(function (){
        if(_page_num1 >= _page_num){
            $(this).attr('href',"<?php echo U('Myspace/show',array('page'=>$_page));?>");
        }else{
            $(this).attr('href',"<?php echo U('Myspace/show',array('page'=>$_page+1));?>");
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