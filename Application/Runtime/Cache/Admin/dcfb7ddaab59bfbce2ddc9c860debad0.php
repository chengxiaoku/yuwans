<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><?php echo ($title); ?></title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <link href="<?php echo ASSETS;?>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <link href="<?php echo ASSETS;?>/fonts/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo ASSETS;?>/fonts/ionicons-2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />    
    <link href="<?php echo ASSETS;?>/css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo ASSETS;?>/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />
   
    <link href="<?php echo ASSETS;?>/css/custom.css" rel="stylesheet" type="text/css" />

    <script src="<?php echo ASSETS;?>/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="<?php echo ASSETS;?>/plugins/jQueryUI/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<?php echo ASSETS;?>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
    <script src="<?php echo ASSETS;?>/plugins/bootbox.js" type="text/javascript"></script>
	
	<!-- form validate -->
	<script src="<?php echo ASSETS;?>/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script src="<?php echo ASSETS;?>/plugins/jquery-validate/additional-methods.min.js"></script>
		
	<style type="text/css">
	.login-box, .register-box {
      
    }

    .text-align {
        text-align: center;
    }
    
    .login-box-body .btn {
        font-size: 16px;
    }
    
    #header {
        height: 60px;
        margin: 0 auto !important;
       background: #3c8dbc none repeat scroll 0 0;
        margin: 0 auto !important;
        text-align: center;
        line-height: 60px;
        color: #fff;
    }
    
    .header_title {
        font-size: 21px;
    }
    
    .btn-social *:first-child {
        font-size: 14px !important;
    }
    
    .login-page {
        background: #ededed url("./Public/assets/img/login-bg.png") no-repeat scroll center top;
    }

    .my-tips {
      color: #a8a8a8;
    }

    #verifyImg {
      position: absolute;
      left: 0;
      top: 2px;
    }
    
    .footer {
        text-align: center;
        
        border-top: 1px solid #d2d6de;
        color: #444;
        padding: 20px;
      }
      
	
	</style>
  </head>

  <body class="login-page" onload="document.forms.loginform.username.focus()">
    
     <div id="header">
        <div class="header_title"><i class="fa fa-street-view"></i>&nbsp;&nbsp;<?php echo ($site_title); ?></div>
    </div>
        
        
    
    
    <div class="login-box">
      
      <div class="login-box-body p20"> 
      	<!-- 
        <div class="login-logo"><i class="glyphicon glyphicon-fire"></i>&nbsp;&nbsp;<?php echo ($meta_title); ?></div>
        
        <hr>
         -->
        <p class="login-box-msg"><span style="font-size:18px;">管理员登录</span></p>
        
       
        <form action="<?php echo U('auth/login');?>" method="post" name="loginform" id="myform">
          <!--信息提示框-->
          <!-- 
          <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <i class="icon fa fa-warning"></i> 登录失败!用户名或密码不正确
          </div>
 		
          <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <i class="icon fa fa-warning"></i> 登录失败!用户名或密码不正确
          </div>
          -->
          
          <?php if($error != ''): ?><div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <i class="icon fa fa-warning"></i> 登录失败:<?php echo ($error); ?>
          </div><?php endif; ?>
          

          <div class="form-group has-feedback">
            <input type="text" name="username" class="form-control" placeholder="用户名" tabindex="1"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          
          <div class="form-group has-feedback">
            <input name="password" type="password" class="form-control" placeholder="密码"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          
          <div class="row">
            <div class="col-xs-8">    
               
              <input type="text" name="verify" class="form-control" placeholder="输入验证码" >
			      
            </div><!-- /.col -->
            <div class="col-xs-4">
            	<img id="verifyImg" src="<?php echo U('auth/verify');?>" onClick="changeVerify()" title="点击刷新验证码"/>
            </div><!-- /.col -->
          </div>
          
          <div class="row">
            <div class="col-xs-12">    
              <br>
              <input type="hidden" name="http_referer" value="<?php echo ($ref); ?>">
              <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
              <a class="btn btn-success btn-block btn-flat" href="#">下载APP</a>
            </div>
          </div>
          	
        </form>

        

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
    
<script type="text/javascript">

function changeVerify() {
  var timenow = new Date().getTime();
  var url = "<?php echo U('auth/verify');?>" + '&t=' + timenow;
  document.getElementById('verifyImg').src=url;  
}


$(document).ready(function(){
	//验证表单
	$("#myform").validate({
		rules: {
			username: "required",
			password: "required",
            verify: "required"
		},
		messages: {
			username: "用户名不能为空",
			password: "密码不能为空",
            verify: "验证码不能为空"
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
</script>
    
</body>
</html>