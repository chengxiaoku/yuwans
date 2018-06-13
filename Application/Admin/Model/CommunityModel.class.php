<?php
namespace Admin\Model;
use Think\Model\RelationModel;

/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/23
 * Time: 14:21
 */
class CommunityModel extends RelationModel
{
    protected $tableName    = 'community';
    //pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
    protected $pk           = 'id';
	
    protected $_link        =  array(
		'user' => array(
			'mapping_type'      => self::BELONGS_TO,
			'class_name'        => 'user',
			'foreign_key '      => 'id',
			'mapping_fields'    => 'real_name',
		)
	);
    
    
}