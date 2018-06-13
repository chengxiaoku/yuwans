<?php
return array(
	//'配置项'=>'配置值'
	'MULTI_MODULE'         =>  true,
	'MODULE_ALLOW_LIST'    =>    array('App','Admin','Home'),
	'DEFAULT_MODULE'       =>    'App',

	//路由模式
	'URL_MODEL' => 0,
	//不区分大小写
	'URL_CASE_INSENSITIVE' =>true,

	'PAGE_SIZE' => 10,
	//开启页面调试
	'SHOW_PAGE_TRACE' =>true
);