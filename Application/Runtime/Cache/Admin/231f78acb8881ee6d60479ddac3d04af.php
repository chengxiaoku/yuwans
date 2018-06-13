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
                        <!--<i class="fa fa-text-width"></i>
                        <h3 class="box-title">这里是标题 - 表格</h3>-->
                        <a class="btn btn-primary btn-flat" href="<?php echo U('War/add');?>">添加官方对战</a>
                        <div class="btn-group" style="margin-left: 50px;">
                            <a href="<?php echo U('war/index',array('status'=>'all'));?>" class="btn btn-default <?php if($status == 'all'): ?>active<?php endif; ?>" type="button">全部</a>
                            <a href="<?php echo U('war/index',array('status'=>'pedding'));?>" class="btn btn-default <?php if($status == 'pedding'): ?>active<?php endif; ?>" type="button">应战中</a>
                            <a href="<?php echo U('war/index',array('status'=>'doing'));?>" class="btn btn-default <?php if($status == 'doing'): ?>active<?php endif; ?>" type="button">比赛中</a>
                            <!-- <a href="<?php echo U('war/index',array('status'=>'draft'));?>" class="btn btn-default <?php if($status == 'draft'): ?>active<?php endif; ?>" type="button">准备中</a> -->
                            <a href="<?php echo U('war/index',array('status'=>'done'));?>" class="btn btn-default <?php if($status == 'done'): ?>active<?php endif; ?>" type="button">已结束</a>
                            <!-- <a href="<?php echo U('war/index',array('status'=>'delay'));?>" class="btn btn-default <?php if($status == 'delay'): ?>active<?php endif; ?>" type="button">已延迟</a> -->
                        </div>
                        <div class="select pull-right">
                            <form method="post" action="<?php echo U('war/index');?>">
                                <div class="input-group" style="width:350px; margin-left: 5px;">
                                    <input type="text" name="seek" class="form-control" value="<?php echo ($keyword); ?>" placeholder="输入游戏名称查找">
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
                                <th width="20%" class="vc-middle" >游戏</th>
                                <th width="10%" class="vc-middle" >房主</th>
                                <th width="10%" class="vc-middle" >网吧</th>
                                <th width="20%" class="vc-middle" >详情</th>
                                <th width="10%" class="vc-middle" >奖金</th>
                                <th width="10%" class="vc-middle" >状态</th>
                                <th width="10%" class="vc-middle" >类型</th>
                                <th width="15%" style="text-align:center;">管理操作</th>
                            </tr>
                            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                  <td class="vc-middle">
                                      <img src="<?php echo ($vo["thumb"]); ?>" width="80"> &nbsp;
                                      <a href="#"><?php echo ($vo["game_title"]); ?></a>
                                  </td>
                                  <td class="vc-middle"><?php echo ($vo["real_name"]); ?></td>
                                  <td class="vc-middle"><?php echo ($vo["netbar_title"]); ?></td>
                                  <td class="vc-middle">
                                      <label class="w80">参与人数：</label><?php echo ($vo["team"]); ?>
                                      <br>
                                      <label class="w80">总共场数：</label><?php echo ($vo["times"]); ?>
                                      <br>
                                      <label class="w80">剩余场数：</label><?php echo ($vo["remain"]); ?>
                                      <br>
                                      <label class="w80">开战时间：</label><?php echo ($vo["begin_time"]); ?>
                                  </td>
                                  <td class="vc-middle">
                                    <?php if($vo[type] == 1 ): echo ($vo["money"]); ?>
                                    <?php else: ?>
                                      <?php echo ($vo["prize"]); endif; ?>

                                  </td>
                                  <td class="vc-middle">
                                    <?php if($vo[status] == 'draft'): ?><span class="label label-success">准备中</span>
                                    <?php elseif($vo[status] == 'doing'): ?>
                                      <span class="label label-success">比赛进行中</span>
                                    <?php elseif($vo[status] == 'pedding'): ?>
                                      <span class="label label-info">比赛应战中</span>
                                    <?php elseif($vo[status] == 'done'): ?>
                                      <span class="label label-default">比赛已结束</span>
                                    <?php elseif($vo[status] == 'delay'): ?>
                                      <span class="label label-waring">比赛延期中</span><?php endif; ?>
                                  </td>
                                  <td class="vc-middle">
                                    <?php if($vo[type] == 1 ): ?><span class="label label-info">官方</span>
                                    <?php else: ?>
                                      <span class="label label-default">普通</span><?php endif; ?>
                                  </td>
                                  <td style="text-align:center;" class="vc-middle">
                                      <?php if($vo[type] == 1 ): ?><a href="<?php echo U('Slider/war', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">轮播图</a><?php endif; ?>
                                      <a href="<?php echo U('War/details', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">详情</a>
                                      <a href="<?php echo U('War/del', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs" onclick="return deleteData(this)">删除</a>
                                  </td>
                              </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            <!-- <tr>
                                <td class="vc-middle">
                                    <img src="<?php echo ASSETS;?>images/game01.jpg" width="80"> &nbsp;
                                    <a href="#">斗地主</a>
                                </td>
                                <td class="vc-middle">王大锤</td>
                                <td class="vc-middle">黑豹网吧</td>
                                <td class="vc-middle">
                                    <label class="w80">参与人数：</label>10
                                    <br>
                                    <label class="w80">总共场数：</label>3
                                    <br>
                                    <label class="w80">剩余场数：</label>2
                                    <br>
                                    <label class="w80">开战时间：</label>2016-07-20
                                </td>
                                <td class="vc-middle">500</td>
                                <td class="vc-middle">
                                    <span class="label label-default">比赛已结束</span>
                                </td>
                                <td style="text-align:center;" class="vc-middle">
                                    <a href="<?php echo U('War/details', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">详情</a>
                                    <a href="<?php echo U('Game/del', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs" onclick="return deleteData(this)">删除</a>
                                </td>
                            </tr>

                            <tr>
                                <td class="vc-middle">
                                    <img src="<?php echo ASSETS;?>images/game01.jpg" width="80"> &nbsp;
                                    <a href="#">斗地主</a>
                                </td>
                                <td class="vc-middle">王大锤</td>
                                <td class="vc-middle">黑豹网吧</td>
                                <td class="vc-middle">
                                    <label class="w80">参与人数：</label>10
                                    <br>
                                    <label class="w80">总共场数：</label>3
                                    <br>
                                    <label class="w80">剩余场数：</label>2
                                    <br>
                                    <label class="w80">开战时间：</label>2016-07-20
                                </td>
                                <td class="vc-middle">500</td>
                                <td class="vc-middle">

                                </td>
                                <td style="text-align:center;" class="vc-middle">
                                    <a href="<?php echo U('War/details', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">详情</a>
                                    <a href="<?php echo U('Game/del', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs" onclick="return deleteData(this)">删除</a>
                                </td>
                            </tr>

                            <tr>
                                <td class="vc-middle">
                                    <img src="<?php echo ASSETS;?>images/game01.jpg" width="80"> &nbsp;
                                    <a href="#">斗地主</a>
                                </td>
                                <td class="vc-middle">王大锤</td>
                                <td class="vc-middle">黑豹网吧</td>
                                <td class="vc-middle">
                                    <label class="w80">参与人数：</label>10
                                    <br>
                                    <label class="w80">总共场数：</label>3
                                    <br>
                                    <label class="w80">剩余场数：</label>2
                                    <br>
                                    <label class="w80">开战时间：</label>2016-07-20
                                </td>
                                <td class="vc-middle">500</td>
                                <td class="vc-middle">

                                </td>
                                <td style="text-align:center;" class="vc-middle">
                                    <a href="<?php echo U('War/details', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs">详情</a>
                                    <a href="<?php echo U('Game/del', array('id'=>$vo[id]));?>" class="btn btn-default btn-xs" onclick="return deleteData(this)">删除</a>
                                </td>
                            </tr> -->

                            </tbody>
                        </table>

                    </div>
                    <div class="box-footer text-right">
                        <ul class="pagination">
                            <li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0"><?php echo ($page); ?></a></li>
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