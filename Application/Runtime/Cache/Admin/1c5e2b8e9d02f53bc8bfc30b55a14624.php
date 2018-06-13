<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>提示信息</title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    	<style type="text/css">
			.message-page {
				background: #d2d6de;
			}
			.message-page .hr {
				background: #fff;
				background: rgba(0,0,0,.2);
				/*background-color:#3c8dbc;*/
				display: inline-block;
				height: 5px;
				margin: 10px 0;
				width: 40px;
			}
			
			.login-box,
			.message-box {
				text-align: center;
				width: 360px;
				margin: 7% auto;
				background: #fff;
			}
			
			.message-box-body {
				padding: 30px 20px;
				color: #444;
				border-top: 0;
				color: #666;
				font-size: 16px;
			}
			
			.message-box-msg {
				margin: 0;
				font-size: 16px;
				text-align: center;
				padding: 0 20px 20px 20px;
				color: #F1122D;
			}

			.message-box-header {
				border-bottom: 1px solid #e5e5e5;
			    min-height: 16.43px;
			    padding: 15px;
			    font-size: 18px;
			}
			.message-box-header .fa {
				  color: #F1122D;
				  font-size: 22px;
			}


		</style>
	</head>
	<body class="message-page">
		
		<div class="message-box">
          <div class="message-box-header"><span><i class="fa fw fa-exclamation-circle"></i> &nbsp;信息提示</span></div>
          <div class="message-box-body">
          	
            <!-- <span class="hr"></span> -->
            <p class="message-box-msg"><?php echo($error); ?></p>
    		<p class="jump">
			页面自动 <a id="href" href="<?php echo($jumpUrl); ?>" style="color:#333;">跳转</a> 等待时间： <b id="wait"><?php echo($waitSecond); ?></b>
			</p>
          </div>
        </div>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
</body>
</html>