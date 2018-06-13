<?php
namespace App\Model;
use Think\Model;

/**
 * 用户模型类
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/22
 * Time: 10:29
 */
class MyspaceModel extends Model
{
    protected $tableName    = 'myspace';
    //pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
    protected $pk           = 'id';

    /**
     * myspace
     * 发表的说说
     */
    public function sendNormal($data){
		$data['type'] = 'normal';
		if ($this->add($data)){
			return true;
		}else{
			return false;
		}
    }

}