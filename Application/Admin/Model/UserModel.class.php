<?php
namespace Admin\Model;
use Think\Model\RelationModel;
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/22
 * Time: 10:28
 */
class UserModel extends RelationModel {
	//关联属性
	public  $_link = array(
		'user_player'=>array(
			'mapping_type'      => self::HAS_ONE,
			'class_name'        => 'user_player',
			'foreign_key '      => 'user_id',
			//'mapping_key'       => 'user_id'
		),
		'user_netbar'=>array(
			'mapping_type'      => self::HAS_ONE,
			'class_name'        => 'user_netbar',
			'foreign_key '      => 'user_id',
		),
	);
	//自动验证
// 	protected $_validate = array(
			
// 	);
	
	
}