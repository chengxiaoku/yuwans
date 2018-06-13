<?php
namespace Admin\Model;
use Think\Model;

/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/23
 * Time: 14:21
 */
class SliderModel extends Model{
    protected $tableName    = 'slider';
    //pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
    protected $pk           = 'id';

    //http://www.kancloud.cn/manual/thinkphp/1776
    protected $_validate = array(
        array('title', 'require', '幻灯片名称不能为空'),
    	array('images','require','幻灯片图片不能为空'),
        //array('title', '', '游戏名称已存在', 0, 'unique',3)
    );
    
    public function getGames(){
    	return $this->select();
    }
    
}