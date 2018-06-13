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
class Community_postModel extends Model
{
    protected $tableName    = 'Community_post';
    //pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
    protected $pk           = 'id';

    /**
     * myspace
     * 发表的说说
     */
    public function sendCommunity(){
    	
    }

}