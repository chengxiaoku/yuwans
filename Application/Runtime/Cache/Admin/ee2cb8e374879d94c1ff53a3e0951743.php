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
        <div class="row" style="">
            <!-- left column -->
            <div class="col-md-8" style="">
                <!-- general form elements -->
                <div class="box box-solid" style="">
                    <!-- form start -->
                    <form role="form" id="warForm" method="post" action="<?php echo U('War/add');?>">
                        <div class="box-body" style="">

                            <div class="form-group input-group w500">
                                <label>游戏对战名称 <span class="required">*</span></label>
                                <div>
                                    <input name="title" value="" type="text" placeholder="请输入对战名称" class="form-control w200 inline-block">
                                </div>
                            </div>

                            <div class="form-group input-group w500"><!-- has-error-->
                                <label>游戏名称 <span class="required">*</span></label>
                                <div>
                                  <select class="form-control wp50" name="game_id">
                                    <option value="0">≡ 请选择游戏 ≡</option>
                                    <?php if(is_array($games)): $i = 0; $__LIST__ = $games;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                  </select>
                                    <!-- <input name="title" type="text" placeholder="输入游戏标题 ..."
                                           class="form-control w500 inline-block"
                                           value=""> -->
                                    <em class="help-block"></em>
                                </div>
                            </div>

                            <div class="form-group input-group w500"><!-- has-error-->
                                <label>网吧名称 <span class="required">*</span></label>
                                <div>
                                  <select class="form-control wp50" name="netbar_id">
                                    <option value="0">≡ 请选择网吧 ≡</option>
                                    <?php if(is_array($netbar)): $i = 0; $__LIST__ = $netbar;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["user_id"]); ?>"><?php echo ($vo["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                  </select>
                                    <!-- <input name="title" type="text" placeholder="输入游戏标题 ..."
                                           class="form-control w500 inline-block"
                                           value=""> -->
                                    <em class="help-block"></em>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>奖金</label>
                                <div>
                                    <input name="money" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>场次</label>
                                <div>
                                    <input name="times" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div>

                            <div class="form-group">
                                <label>人数</label>
                                <div>
                                    <input name="team" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <label>最小参与人数</label>
                                <div>
                                    <input name="player_min" value="" type="text" placeholder=""
                                           class="form-control w200 inline-block">
                                </div>
                            </div> -->

                            <div class="form-group">
                                <label  for="">开战时间</label>
                                <!-- <div class="col-sm-6"> -->
                                    <div class="input-group col-sm-6">
                                        <input type="text" placeholder="" name="begin_time" id="end-time" class="form-control"
                                               value="<?php echo ($endtime); ?>" >
                                               <!-- disabled -->

                                        <div class="input-group-btn">
                                            <button onclick="return selectDate(this, 'end-time')" type="button"
                                                    class="btn btn-success btn-flat"><i class="fa fa-clock-o"></i></button>
                                        </div>
                                    </div>
                                <!-- </div> -->
                            </div>

                            <div class="form-group">
                                <label>规则</label>
                                <textarea name="rule" id="content" class="form-control" rows="6"
                                          placeholder="输入描述 ..."></textarea>
                            </div>
                            <!-- </div> -->

                        </div>

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary w100">保存</button>
                            <a type="submit" class="btn btn-info w100 ml20"
                               onclick="history.go('-1')">返回</a>
                        </div>

                    </form>

                </div><!-- /.box -->
            </div><!--/.col (left) -->
        </div>
    </section>
    <!-- /.content  -->
</div>

<!--kind editor-->
<!--日期-->
<script	src="<?php echo ASSETS;?>/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script	src="<?php echo ASSETS;?>/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"	charset="UTF-8"></script>
<link	href="<?php echo ASSETS;?>/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />

<!-- form validate -->
<script src="<?php echo ASSETS;?>/plugins/jquery-validate/jquery.validate.min.js"></script>
<script src="<?php echo ASSETS;?>/plugins/jquery-validate/additional-methods.min.js"></script>


<script type="text/javascript">

    $(function(){
        //验证表单
        $("#warForm").validate({
            rules: {
                title: "required",
                game_id: "required",
                netbar_id: "required",
                war_id: "required"
            },
            messages: {
                username: "请输入游戏对战名称",
                game_id: "请选择游戏",
                netbar_id: "请选择网吧",
                war_id: "请选择比赛"
            },
            errorPlacement: function(error, element) {
                element.parent().addClass('has-error');
            },
            onfocusout: function(element) {
                //this.element(element);
            },
            success: function(label, element){
                $(element).parent().removeClass('has-error');
            }
        });
    });



/**
 * 选择日期
 * @param o 触发按钮
 * @param id 设置时间输入框ID
 */
function selectDate(o, id) {
  var _id = '#' + id;

  $(_id).datetimepicker({
    format : 'yyyy-mm-dd hh:ii:ss',
    language : 'zh-CN',
    todayBtn : true
  }).on("changeDate", function(e) {
    var me = e.target;
    $(this).datetimepicker('hide');
  });

  $(_id).datetimepicker('show');

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