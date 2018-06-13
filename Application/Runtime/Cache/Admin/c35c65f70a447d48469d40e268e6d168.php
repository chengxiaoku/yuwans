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
                            <form method="post" action="<?php echo U('User/netbar');?>">
                                <div class="input-group" style="width:350px; margin-left: 5px;">
                                    <input type="text" name="netbar" class="form-control" value="<?php echo ($keyword); ?>" placeholder="输入网吧名查找">
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
                                <th width="15%" class="vc-middle">网吧名称</th>
                                <th width="10%" class="vc-middle" >管理员</th>
                                <th width="20%" class="vc-middle" >手机号码</th>
                                <th width="20%" class="vc-middle" >所在地</th>
                                <th width="15%" class="vc-middle" >营业执照</th>
                                <th width="20%" style="text-align:center;">管理操作</th>
                            </tr>
                            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                  <td class="vc-middle"><?php echo ($vo[user_netbar][title]); echo ($vo["title"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo["real_name"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo["tel"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo["address"]); ?></td>
                                  <td class="vc-middle">
                                      <img  onclick="show_img(this)" src="<?php echo ($vo["license"]); ?>" style="width: 120px; height: 120px;"/>
                                  </td>
                                  <td style="text-align:center;" class="vc-middle">
                                      <a href="<?php echo U('User/netbarUpdate', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">编辑</a>
                                      <a class="btn btn-default btn-xs" onclick="return del('<?php echo ($vo[id]); ?>',this)"><?php if($vo["status"] == 0): ?>启用<?php else: ?>禁用<?php endif; ?>

                                      </a>
                                            <?php if($vo['user_netbar']['status'] == 1){ ?>
                                          <span class="label label-success" style="cursor: pointer" onclick="sh('<?php echo ($vo[user_netbar][id]); ?>',this)">审核通过</span>
                                          <?php
 }else{ ?>
                                          <span class="label label-danger" style="cursor: pointer" onclick="sh('<?php echo ($vo[user_netbar][id]); ?>',this)">审核未通过</span>
                                            <?php
 } ?>
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
<!--模态框-->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">禁用操作</h4>
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

<!--模态框-->

<div class="modal fade" id="myModal_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">审核操作</h4>
            </div>
            <div class="modal-body">
                <h5 style="color: red;"><span class="glyphicon glyphicon-exclamation-sign" style="margin-right:10px; "></span><span id="data_sum_1"></span></h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="del_ok_1()"> 确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="img_myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">营业执照预览</h4>
            </div>
            <div class="modal-body">
                <img id="img_show" style=" width: 570px; height: 500px;" src="">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
    var del_id = 0;
    var type = '';
    var index_id = 0;
    var string ='';
    function del(a,obj){
        del_id = a;
        index_id = parseInt($(obj).parent().parent().index());
        if($.trim($(obj).text()) == '禁用'){
            type = 'j';
            string = '将导致该用户无法登录';
        }else if($.trim($(obj).text()) == '启用'){
            type = 'q';
            string = '允许该用户登录';
        }
        $("#data_sum").text('是否'+$.trim($(obj).text())+'这条数据?'+string);
        $('#myModal').modal('show');
        return false;
    }
    function del_ok(){
        $('#myModal').modal('hide');
        $.post("<?php echo U('User/jin');?>",{'j':del_id,'q':type},function(result){
            if(result == 1 || result == 3){
                alert('修改失败!');
            }else if(result == 2){
                var a_val = $("tr:eq("+index_id+")").children().last().find("a:eq(1)");
                if($.trim(a_val.text()) == '禁用'){
                    a_val.text('启用');
                }else {
                    a_val.text('禁用');
                }
            }
        });
    }
    var text_id = 0;
    var sel_id = 0;
    //审核
    function sh(id,obj){
        var obj_val = $.trim($(obj).text());


        if(obj_val == '审核未通过'){
            sel_id = parseInt($(obj).parent().parent().index());
            text_id = id;
            $("#data_sum_1").text('确认审核通过？');
            $('#myModal_1').modal('show');
        }else{
            return false;
        }
    }
    function del_ok_1(){
        $('#myModal_1').modal('hide');
        $.post("<?php echo U('User/netbar_ok');?>",{'id':text_id},function(result) {
            if(result == 1){
                alert('修改失败');
            }else if(result == 2){
                var a_val = $("tr:eq("+parseInt(sel_id)+")").children().last().find("span");
                a_val.removeClass('label-danger');
                a_val.addClass('label-success');
                a_val.text('审核通过');
            }
        })
    }

//模态框图片

    function show_img(obj){
        string = $(obj).attr('src');
        img_name = string.substring(string.lastIndexOf('/')+1);
        string_1 = string.substring(0,string.lastIndexOf('/'));
        img_add = string_1.substring(0,string_1.lastIndexOf('/')+1);
        img_src = img_add+img_name;

        $("#img_show").attr('src',img_src);
        $("#img_myModal").modal('show');
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