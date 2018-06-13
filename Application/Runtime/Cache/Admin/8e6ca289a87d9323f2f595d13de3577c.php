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

        <!--表格-->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <a class="btn btn-primary" href="<?php echo U('Role/addadmin');?>">添加角色</a>
                        <a class="btn  btn-danger" id="delall">全部删除</a>
                    </div><!-- /.box-header -->

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th width="5%" class="tc" >
                                    <input type="checkbox" id="selectall">
                                </th>
                                <th width="5%">编号</th>
                                <th width="10%">角色名称</th>
                                <th width="10%">角色描述</th>
                                <th width="10%">状态</th>
                                <th width="10%">管理操作</th>
                            </tr>
                            <?php foreach($data as $val) :?>
                            <tr>
                                <td class="tc"><input type="checkbox" name="check" value="<?php echo ($val['id']); ?>"></td>
                                <td><?php echo ($val['id']); ?></td>
                                <td><?php echo ($val['name']); ?></td>
                                <td><?php echo ($val['description']); ?></td>
                                <!--label-success-->

                                    <?php if($val['enabled'] == '1'){ ?>
                                <td><span class="label label-success">启用</span></td>
                                    <?php
 }else{?>
                                <td><span class="label label-danger">未启用</span></td>
                                    <?php }?>

                                <td>
                                    <a class="btn btn-default btn-xs"  href="<?php echo U('Role/setadmin',array('id'=>$val['id']));?>">权限设置</a>
                                    <a class="btn btn-default btn-xs" href="<?php echo U('Role/updateadmin',array('dat'=>$val['id']));?>">修改</a>
                                    <a href="#" class="btn btn-default btn-xs del_l" d="<?php echo ($val['id']); ?>">删除</a>
                                </td>
                            </tr>
                            <?php endforeach;?>

                            </tbody></table>
                    </div><!-- /.box-body -->

                    <div class="box-footer">

                    </div>

                </div><!-- /.box -->
            </div>
        </div>


    </section><!-- /.content -->
    <!-- /.content  -->
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">警告</h4>
            </div>
            <div class="modal-body">
                <span style="color: red;font-size: 18px"><li class="glyphicon glyphicon-exclamation-sign" style="color: red;margin-right: 10px;"></li>是否删除这<span id="del_text"></span>条数据</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="ok"> 确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    function deleteData() {
        if (confirm("确认要删除该条数据？")) {
            return true;
        } else {
            return false;
        }
    }

    //全选/反选
    $('#selectall').click(function (){
        $("input[name='check']").prop('checked',$(this).is(':checked'));
    });
    $("input[name='check']").click(function (){
        var len = $('input[name=check]:checked').length;
        if (len == $("input[name='check']").length) {
            $('#selectall').prop('checked', true);
        } else {
            $('#selectall').prop('checked', false);
        }
    });

    //删除的ID
    var del_id = '';

    //批量删除提示操作
    $("#delall").click(function (){
        var len =$('input[name=check]:checked').length;
        if(len ==0 ){
            return false;
        }else{
            del_id = '';
            $('input[name=check]:checked').each(function (){
                del_id +=','+$(this).val();
            });
            del_id = del_id.substring(1);
            $("#del_text").text(len);
            $('#myModal').modal('show');
        }
    });
    //单条数据的删除
    $(".del_l").click(function (){
        del_id = '';
        del_id=$(this).attr('d');
        $("#del_text").text(1);
        $('#myModal').modal('show');
    });
    //进行删除操作
    $('#ok').click(function (){
        location.href="/yuwan/admin.php?m=Admin&c=Role&a=del_per&del_id="+del_id;
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