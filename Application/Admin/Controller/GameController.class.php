<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 游戏设置控制器
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/20
 * Time: 12:08
 */
class GameController extends BaseController {

    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 列表
     */
    public function index()
    {
        $this->assign("page_title", "游戏列表");
        $searchKey = isset($_POST['s']) ? trim($_POST['s']) : null;
        $pageSize = C('page_size');
        if (empty($searchKey)) {
        	$count = $data = D("game")->count();
            $data = D("game")->order(' add_time desc ') ->page($_GET['p'],$pageSize)->select();
        } else {
            $map['title'] = array('like', "%$searchKey%");
            $count = $data = D("game")->where($map)->count();
            $data = D("game")->where($map)->order(' add_time desc ')->page($_GET['p'],$pageSize)->select();
            $this->assign("keyword", $searchKey);
        }
        $Page = new \Think\Page($count,$pageSize);
        $page = $Page->show();
        $this->assign('page',$page);
        $this->assign("data", $data);
        $this->display();
    }

    /**
     * 编辑
     * @param null $id
     */
    public function edit($id = null)
    {
        if (IS_POST) {
            $model = D("game");
            if ($model->create()) {
                if ($model->save()!==false) {
                    $this->success("数据修改成功");
                } else {
                    $this->error("数据修改失败：" . $model->getError());
                }
            } else {
                $this->error("数据修改失败：" . $model->getError());
            }
        } else {
            if (is_null($id)) {
                $this->error("缺少参数ID");
            }
            $data = D("game")->find($id);
            $this->assign("data", $data);
            $this->assign("page_title", "游戏修改");
            $this->display();
        }
    }

    /**
     * 添加游戏
     */
    public function add()
    {
        if (IS_POST) {
            $model = D("game");
            if ($model->create()) {
                if ($model->add()) {
                    $this->success("数据添加成功");
                } else {
                    $this->error("数据添加失败：" . $model->getError());
                }
            } else {
                $this->error("数据添加失败：" . $model->getError());
            }
        } else {
            $this->assign("page_title", "新增游戏");
            $this->display();
        }
    }

    /**
     * 删除
     * @param $id
     */
    public function del($id)
    {
        if (empty($id)) {
            $this->error("删除失败：缺少参数ID");
        }
        $model = D("game");
        $rst = $model->delete($id);
        if ($rst) {
            $this->error("删除成功");
        } else {
            $this->error("删除失败：" . $model->getError());
        }
    }
}