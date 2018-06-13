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
class GamesModel extends Model
{
    protected $tableName    = 'games';
    //pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
    protected $pk           = 'id';

    /**
     * 按ID查询数据库(id可以是多个 id,id,id)的形式
     */
    public function idGetGames($id){
    	$id = trim($id,',');
    	$map['id'] = array('in',$id);
    	$data = $this-> field("id,player_max,prize_max,prize_min,thumb,title,times,bgimage") ->where($map) ->select();
    	if ($data){
    		return $data;
    	}else{
    		return false;
    	}
    }
    /**
     * getGameList
     * 分页取的所有游戏列表
     */
	public function getGameList($title,$page,$pageSize){
		if (empty($title)){
			$list = $this ->field("id,title,thumb,player_max,prize_max,prize_min,times") ->order(' add_time desc ') ->page($page,$pageSize) ->select();
		}else{
			$list = $this ->field("id,title,thumb,player_max,prize_max,prize_min,times") ->where(" title like '%$title%' ") ->order(' add_time desc ') ->page($page,$pageSize) ->select();
		}
		if ($list){
			return $list;
		}else{
			return false;
		}
	}
}