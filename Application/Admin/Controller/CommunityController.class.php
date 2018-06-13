<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 圈子控制器
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/20
 * Time: 12:10
 */
class CommunityController extends BaseController
{

    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 圈子列表
     */
    public function index(){
        $this->assign("page_title", "圈子列表");
        $model = D('Community');
        $pageSize = C('page_size');
        $seek = $_POST['seek'];
        //读取游戏
        if(empty($seek)){
        	$count = $model ->relation('user') ->count();
        	$list = $model ->relation('user') ->order(' add_time desc ') ->page($_GET['p'],$pageSize) ->select();
        }else{
        	$count = $model ->relation('user') ->where(" title like '%$seek%' ") ->count();
        	$list = $model ->relation('user') ->where(" title like '%$seek%' ") ->order(' add_time desc ') ->page($_GET['p'],$pageSize) ->select();
        	$this->assign('keyword',$seek);
        }
        $modelGames = M('games');
        foreach ( $list as $key => $val ){
        	$gamesId = $val['games'];
        	if (empty($gamesId)){
        		$list[$key]['games'] = '';
        	}else{
        		$map['id'] = array('in',$gamesId);
        		$games = $modelGames ->field('title') ->where($map)->select();
        		$list[$key]['games'] = $games;
        	}
        	
        }
        $Page = new \Admin\Common\Util\MyPage($count,$pageSize);
        $page = $Page->show();
        $this->assign('page',$page);
        $this->assign('list',$list);
        $this->display();
    }

    /**
     * 圈子详情
     */
    public function details($id){
        $this->assign("page_title", "圈子详情");
        $model = D('community');
        $modelGames = M('games');
        $data = $model ->relation(true) ->where(" id = $id ") ->page($_GET['p'],$pageSize) ->find();
        $gamesId = $data['games'];
	$map['id'] = array('in',$gamesId);
        $games = $modelGames ->field('title') ->where($map)->select();
        $data['games'] = $games;
        $this->assign('data',$data);
        $this->display();
    }
    /**
     * 删除圈子
     */
    public function del($id){
    	$model = D('community');
    	if (empty($id)){
    		$this->error('删除失败');
    	}
    	if ($model->delete($id)){
    		$this->success('删除成功');
    	}else{
    		$this->error('删除失败');
    	}
    }
}