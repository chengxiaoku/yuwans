<?php
namespace Admin\Model;
use Think\Model;
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/22
 * Time: 10:28
 */
class UserModel extends Model{
	protected $tableName    = 'admin';
	//pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
	protected $pk           = 'id';
	
	//自动验证
	protected $_validate = array(
		array('name', 'require', '管理员名称不能为空'),
		array('name', '', '游戏名称已存在', 0, 'unique',3),
		array('pwd', 'require', '管理员名称不能为空'),
		array('pwd','repassword','确认密码不正确',0,'confirm'), // 验证确认密码是否和密码一致
		array('realname', 'require', '管理员名称不能为空'),
	);
}