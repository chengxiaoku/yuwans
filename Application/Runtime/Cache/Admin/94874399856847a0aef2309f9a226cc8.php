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
            <!-- left column -->
            <div class="col-md-8">
                <form method="post" action="">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a aria-expanded="true" data-toggle="tab" href="#tab_1">基础配置</a></li>
                            <li class=""><a aria-expanded="false" data-toggle="tab" href="#tab_2">费用配置</a></li>
                            <li class=""><a aria-expanded="false" data-toggle="tab" href="#tab_3">积分清零周期</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab_1" class="tab-pane active">
                                <div class="form-group">
                                    <label for="">站点名称</label>
                                    <div>
                                        <input name="site_name" type="text" value="<?php echo ($data["site_name"]); ?>" class="form-control w500 inline-block" placeholder="输入页面名称 ...">

                                        <em class="help-block">说明：站点名称.</em>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="">站点域名</label>
                                    <div>
                                        <input name="domain_name" value="<?php echo ($data["domain_name"]); ?>" type="text" class="form-control w500 inline-block"  placeholder="输入站点域名 ...">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="">网站关键词</label>
                                    <div>
                                        <input name="site_keywords" value="<?php echo ($data["site_keywords"]); ?>" type="text" class="form-control w500 inline-block" placeholder="输入网站关键词 ...">
                                        <em class="help-block">说明：SEO配置.</em>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="">网站描述</label>
                                    <div>
                                        <textarea placeholder="网站描述 ..."  rows="3" class="form-control w500" name="site_description"><?php echo ($data["site_description"]); ?></textarea>
                                        <em class="help-block">说明：SEO配置.</em>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="">备案号 <span class="required">*</span></label>
                                    <div>
                                        <input type="text" name="site_icp" value="<?php echo ($data["site_icp"]); ?>" class="form-control w500 inline-block" placeholder="输入网站备案号 ...">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="">站点状态</label>
                                    <div>
                                        <div class="radio inline-block mt0">
                                            <label>
                                                <input type="radio" <?php if($data[site_status] == 'option1'): ?>checked="checked"<?php endif; ?>  value="option1" name="site_status">开启
                                            </label>
                                        </div>
                                        <div class="radio inline-block mt0 ml20">
                                            <label>
                                                <input type="radio" <?php if($data[site_status] == 'option2'): ?>checked="checked"<?php endif; ?> value="option2" name="site_status">关闭
                                            </label>
                                        </div>
                                    </div>
                                </div>


                            </div><!-- /.tab-pane -->


                            <div id="tab_2" class="tab-pane">

                                <div class="form-group">
                                    <label for="">平台服务费比例</label>
                                    <div>
                                        <input type="text" name="service_charge" class="form-control w200 inline-block" id="" placeholder="" value="<?php echo ($data["service_charge"]); ?>">&nbsp;%
                                    </div>
                                    <em class="help-block">说明：输入整数（10表示10%）。</em>
                                </div>

                                <div class="form-group">
                                    <label for="">推荐鱼丸奖励</label>
                                    <div>
                                        <input type="text" name="referral_bonuses" class="form-control w200 inline-block" id="" placeholder="" value="<?php echo ($data["referral_bonuses"]); ?>">&nbsp;鱼丸
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>

                                <div class="form-group">
                                    <label for="">签到奖励1</label>
                                    <div>
                                        连续签到&nbsp;<input type="text" name="signin[1][day]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][1][day]); ?>">
                                        &nbsp;天后奖励<input type="text" name="signin[1][aw]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][1][aw]); ?>">
                                        &nbsp;积分
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                                <div class="form-group">
                                    <label for="">签到奖励2</label>
                                    <div>
                                        连续签到&nbsp;<input type="text" name="signin[2][day]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][2][day]); ?>">
                                        &nbsp;天后奖励<input type="text" name="signin[2][aw]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][2][aw]); ?>">
                                        &nbsp;积分
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                                <div class="form-group">
                                    <label for="">签到奖励3</label>
                                    <div>
                                        连续签到&nbsp;<input type="text" name="signin[3][day]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][3][day]); ?>">
                                        &nbsp;天后奖励<input type="text" name="signin[3][aw]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][3][aw]); ?>">
                                        &nbsp;积分
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                                <div class="form-group">
                                    <label for="">签到奖励4</label>
                                    <div>
                                        连续签到&nbsp;<input type="text" name="signin[4][day]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][4][day]); ?>">
                                        &nbsp;天后奖励<input type="text" name="signin[4][aw]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[signin][4][aw]); ?>">
                                        &nbsp;积分
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>

                                <div class="form-group">
                                    <label for="">充值</label>
                                    <div>
                                        充值&nbsp;<input type="text" name="recharge[0][money]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][0][money]); ?>">
                                        &nbsp;元现金得<input type="text" name="recharge[0][exchange]" class="form-control w80 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][0][exchange]); ?>">
                                        &nbsp;鱼丸
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                                <div class="form-group">
                                    <label for="">充值</label>
                                    <div>
                                        充值&nbsp;<input type="text" name="recharge[1][money]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][1][money]); ?>">
                                        &nbsp;元现金得<input type="text" name="recharge[1][exchange]" class="form-control w80 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][1][exchange]); ?>">
                                        &nbsp;鱼丸
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                                <div class="form-group">
                                    <label for="">充值</label>
                                    <div>
                                        充值&nbsp;<input type="text" name="recharge[2][money]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][2][money]); ?>">
                                        &nbsp;元现金得<input type="text" name="recharge[2][exchange]" class="form-control w80 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][2][exchange]); ?>">
                                        &nbsp;鱼丸
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                                <div class="form-group">
                                    <label for="">充值</label>
                                    <div>
                                        充值&nbsp;<input type="text" name="recharge[3][money]" class="form-control w50 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][3][money]); ?>">
                                        &nbsp;元现金得<input type="text" name="recharge[3][exchange]" class="form-control w80 inline-block" id="" placeholder="" value="<?php echo ($data[recharge][3][exchange]); ?>">
                                        &nbsp;鱼丸
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>

                            </div><!-- /.tab-pane -->

                            <div id="tab_3" class="tab-pane">

                                <div class="form-group">
                                    <label for="">玩家积分清零周期</label>
                                    <div>
                                        <input type="text" name="per_jifen" value="<?php echo ($data["per_jifen"]); ?>" class="form-control w200 inline-block" id="" placeholder="" >&nbsp;月
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>

                                <div class="form-group">
                                    <label for="">圈子创建积分下限</label>
                                    <div>
                                        <input type="text" name="jifen_xiaxian" value="<?php echo ($data["jifen_xiaxian"]); ?>" class="form-control w200 inline-block" id="" placeholder="">&nbsp;分
                                    </div>
                                    <em class="help-block">说明：输入整数。</em>
                                </div>
                            </div>

                            <div class="box-footer">
                                <button class="btn btn-primary w100 btn-flat" type="submit">保存</button>
                            </div>
                        </div><!-- /.tab-content -->
                    </div>
                </form>
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