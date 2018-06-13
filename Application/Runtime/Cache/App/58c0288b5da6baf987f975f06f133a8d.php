<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo ($title); ?></title>
</head>
<body>
    <h1>
        <?php if(is_array($arr)): $i = 0; $__LIST__ = $arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$newarr): $mod = ($i % 2 );++$i; echo ($newarr); echo ($key); endforeach; endif; else: echo "" ;endif; ?>
    </h1>
</body>
</html>