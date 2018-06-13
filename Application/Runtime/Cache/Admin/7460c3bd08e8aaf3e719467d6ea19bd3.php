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
                        <a class="btn btn-success " type="button" href="<?php echo U('Goods/goods_add');?>">添加商品</a>
                        <a class="btn btn-warning" type="button" href="<?php echo U('Goods/history');?>">兑换历史</a>
                        <div class="select pull-right">
                            <form method="post" action="<?php echo U('Goods/sel');?>">
                                <div class="input-group" style="width:310px; margin-left: 5px;">
                                    <input type="text" name="sec" class="form-control" value="<?php echo ($keyword); ?>" placeholder="请输入商品名称..">
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
                                <th width="25%" class="vc-middle">商品封面</th>
                                <th width="18%" class="vc-middle" >商品名称</th>
                                <th width="10%" class="vc-middle" >分值</th>
                                <th width="10%" class="vc-middle" >原价</th>
                                <th width="10%" class="vc-middle" >销量</th>
                                <th width="15%" class="vc-middle" >上架时间</th>
                                <th width="13%" class="vc-middle" >管理</th>
                            </tr>
                            <?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?><tr>
                                    <td class="vc-middle text-center"><img style="width: 120px; height: 120px;" src="<?php echo ($row["image"]); ?>"></td>
                                    <td class="vc-middle text-center"><?php echo ($row["title"]); ?></td>
                                    <td class="vc-middle text-center"><?php echo ($row["paymoney"]); ?></td>
                                    <td class="vc-middle text-center"><?php echo ($row["price"]); ?></td>
                                    <td class="vc-middle text-center"><?php echo ($row["sales"]); ?></td>
                                    <td class="vc-middle text-center">
                                        <?php if($row["add_time"] == '0000-00-00 00:00:00'): ?>已下架
                                            <?php else: ?>
                                            <?php echo ($row["add_time"]); endif; ?>
                                    </td>
                                    <td style="text-align:center;" class="vc-middle">
                                        <a  class="btn btn-default btn-xs" href="<?php echo U('Goods/goods_update',array('updat_id'=>$row['id']));?>">修改</a>
                                        <a  class="btn btn-default btn-xs" onclick="del('<?php echo ($row["id"]); ?>')">删除</a>
                                        <a  class="btn btn-default btn-xs" pp="<?php echo ($row["id"]); ?>" onclick="aj(this)"><?php if($row["add_time"] == '0000-00-00 00:00:00'): ?>上架<?php else: ?>下架<?php endif; ?></a>
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

    <!--模态框-->

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">删除操作</h4>
                </div>
                <div class="modal-body">
                    <h5 style="color: red;"><span class="glyphicon glyphicon-exclamation-sign" style="margin-right:10px; "></span><span id="data_sum"></span></h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="del_ok()"> 确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- /.content  -->
</div>
<script type="text/javascript">
    $("table tr:eq(0) th").each(function () {
        $(this).addClass('text-center');
    });
    del_id = 0;
    function del(a){
        del_id = a;
        $("#data_sum").text('是否删除这条数据?');
        $('#myModal').modal('show');
    }
    //删除
    function del_ok(){
        location.href = './admin.php?m=Admin&c=Goods&a=del&del_id='+del_id;
    }
    //异步上下架
    function aj(obj){
        var pp = $(obj).attr('pp');
        if($(obj).text() == '下架'){
            $.post("<?php echo U('Goods/aj');?>",{sj_id:pp,type:'sj'},function(result){
                if(result ==1){
                    $(obj).parent().prev().text('已下架');
                    $(obj).text('上架');
                }
            });
        }else if($(obj).text() == '上架'){
            $.post("<?php echo U('Goods/aj');?>",{sj_id:pp,type:'xj'},function(result){
                $(obj).parent().prev().text(result);
                $(obj).text('下架');
            });
        }
    }
   $("#sel_ok").click(function (){
       var val = $("input[name=sec]").val();
       if($.trim(val) ==''){
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