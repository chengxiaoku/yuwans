<?php





return array(
    // 加载扩展配置文件
    'LOAD_EXT_CONFIG' => 'database,menu',
	'page_size' => 20,
	'accessKey'       => 'LfnVOa0JhBu0hgJ9FdvWcjOYsVgI9TWOfr49pJsu',
	'secretKey'       => 'YdlTTaqhRV8HB7tLSK7kI1-c4XD-L7g1FFrZ05_8',
	'bucket'          => 'yuwan', //七牛云空间

	//会话过期时间
	'SESSION_EXPIRE' => 3600*24, 	//会话过期时间

	//信息提示模板
	'TMPL_ACTION_ERROR'     => 'Public/error_jump', // 默认错误跳转对应的模板文件
	'TMPL_ACTION_SUCCESS'   => 'Public/success_jump', // 默认成功跳转对应的模板文件

);