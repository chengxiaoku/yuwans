<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
use Pingpp\Error\Base;
use Think\Session\Driver\Mysqli;

/**
 * 说说控制器
 * Created by PhpStorm.
 * User:  程龙飞   710425820@qq.com
 * Date: 2016/10/28
 * Time: 13:32
 */
class MyspaceController extends BaseController
{
    //每页显示的数据条数
    public $page_num= 20;
    //数据库连接资源
    public $model= null;

    public $search_key = '';

    public function index()
    {
        $search_key = isset($_POST['ss']) ? $_POST['ss'] : '';
        $search_key = trim($search_key);
        $this->search_key = $search_key;
        $this->assign("page_title", "说说管理");

        $this->mess_sum();
        $this->show(1);
        //$this->display();
    }

    /**
     * 删除操作
     * @param $id 待删除数据的ID值
     */
    public function del($id) {
        $model = M("myspace");
        $rs = $model->where(array('id'=>$id))->delete();
        $url = U("Myspace/index");
        if ($rs !== false) {
            $this->success("数据删除成功", $url);
        } else {
            $this->error("数据删除失败");
        }
    }

    /**
     * 计算数据的总数
     */
    function mess_sum(){
        $this->model = M("myspace");
        $s = $this->search_key;
        if (empty($s)) {
            $sql='SELECT COUNT(*) FROM yw_user,yw_myspace WHERE yw_myspace.user_id = yw_user.id';
        } else {
            $sql="SELECT COUNT(*) FROM yw_user,yw_myspace WHERE yw_myspace.user_id = yw_user.id and (yw_myspace.content like '%$s%' OR yw_user.username like '%$s%')";
        }

        $mess_num=$this->model->query($sql);
        //数据总数
        $mess_num=(int)$mess_num[0]['count(*)'];
        $pageCount =ceil($mess_num/$this->page_num);
        $this->assign("pageCount",$pageCount+1 );
    }

    /**
     * 数据的分页显示
     * @param string $page 从第几页开始显示
     */
    public function show($page){
        $this->assign("page_title", "说说管理");
        $page = isset($page)?$page:1;
        if($page <= 1){
            $page =1;
        }
        $page = $this->page_num * ($page-1);
        $this->mess_sum();

        $s = $this->search_key;
        if (empty($s)) {
            $sql = 'SELECT yw_user.username,yw_myspace.id,yw_myspace.content,yw_myspace.add_time 
                FROM yw_user,yw_myspace WHERE yw_myspace.user_id = yw_user.id limit '.$page.','.$this->page_num;
        } else {
            $sql = "SELECT yw_user.username,yw_myspace.id,yw_myspace.content,yw_myspace.add_time 
                FROM yw_user,yw_myspace WHERE yw_myspace.user_id = yw_user.id and (yw_myspace.content like '%$s%' OR yw_user.username like '%$s%') limit ".$page.",".$this->page_num;
        }
        
        $data = $this->model->query($sql);
        $this->assign("data", $data);
        $this->display('index');
    }
    
}