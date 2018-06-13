<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;


/**
 * 收支明细控制器
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/20
 * Time: 12:11
 */
class MoneyController extends BaseController {

    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 财务列表
     */
    public function index()
    {
            $this->assign("page_title","收支明细");
            $num = C('page_size');
            $money = M('money');
            $type = I('get.type','','trim');
            if (empty($type)) {
                $type = 'all';
            }
            if($type !='all' && $type !='bonus' && $type !='recharge'){
                $type = 'all';
            }
            $this->assign('ty',$type);
        
            if ($type == 'all') {
                $count = $money->count();
            } elseif ($type == 'bonus') {
                //奖金
                $where['type'] = 'prize';
                $count = $money->where($where)->count();
            } elseif ($type == 'recharge') {
                //充值
                $sql  = "SELECT COUNT(*) AS tp_count FROM `yw_money` WHERE `type` = 'agent_recharge' OR `type` = 'recharge' LIMIT 1 ";
                $_count = $money->query($sql);
                $count = $_count[0]['tp_count'];
            }
            $Page = new \Admin\Common\Util\MyPage($count, $num);
            $Page->setConfig('prev', '上一页');
            $Page->setConfig('next', '下一页');
            $show = $Page->show();
            if ($type == 'all') {
                //查询全部数据元素
                $sql = 'SELECT a.id, a.sn,a.money,a.type,a.add_time,a.pay_type,a.pay_status,b.username from yw_money as a, yw_user as b WHERE a.user_id = b.id ORDER BY a.id DESC limit '.$Page->firstRow . ',' . $Page->listRows;
            } elseif ($type == 'bonus') {
                //查询奖金的数据
                $sql = 'SELECT a.id, a.sn,a.money,a.type,a.add_time,a.pay_type,a.pay_status,b.username from yw_money as a, yw_user as b WHERE a.user_id = b.id AND a.type = \'prize\' ORDER BY a.id DESC  limit '.$Page->firstRow . ',' . $Page->listRows;
            } elseif ($type == 'recharge') {
                $sql = 'SELECT a.id, a.sn,a.money,a.type,a.add_time,a.pay_type,a.pay_status,b.username from yw_money as a, yw_user as b WHERE a.user_id = b.id AND (a.type = \'recharge\' OR a.type = \'agent_recharge\') ORDER BY a.id DESC  limit '.$Page->firstRow . ',' . $Page->listRows;
            }
            $list = $money->query($sql);
            // 赋值数据集
        $this->assign('data', $list);
        // 赋值分页输出
        $this->assign('page', $show);
        $this->display();
    }

    /**
     * 查询搜索
     */
    public function index_type(){

        $this->assign("page_title","收支明细");
        $num = C('page_size');
        $p = I("get.p",'','trim');
        if(empty($p)){
            $p = 1;
        }
        $start = ($p-1)*$num;
        $money = M('money');
        //获取输入值
        $sec = I('post.sec','','trim');
        if(!empty($sec)){
            session('money_sec',$sec);
        }
        $sec = empty($sec)?session('money_sec'):$sec;

        $type = I('get.type','','trim');
        if (empty($type)) {
            $type = 'all';
        }
        if($type !='all' && $type !='bonus' && $type !='recharge'){
            $type = 'all';
        }
        $this->assign('ty',$type);

        if ($type == 'all') {
            //$count = $money->count();
            $sql =" SELECT COUNT(*) from yw_money ,yw_user where yw_money.user_id = yw_user.id AND (sn LIKE '%$sec%' OR username LIKE '%$sec%')";
            $data = $money->query($sql);
            $count = $data[0]['count(*)'];
        } elseif ($type == 'bonus') {
            //奖金
           $sql = "SELECT COUNT (*) from yw_money ,yw_user where yw_money.user_id = yw_user.id and yw_money.type = 'prize' AND (sn LIKE '%$sec%' OR username LIKE '%$sec%') ";
            $data = $money->query($sql);
            $count = $data[0]['count(*)'];
        } elseif ($type == 'recharge') {
            //充值
            $sql = "SELECT COUNT (*) from yw_money ,yw_user where yw_money.user_id = yw_user.id and `type` = 'agent_recharge' OR `type` = 'recharge' AND (sn LIKE '%$sec%' OR username LIKE '%$sec%') ";
            $data = $money->query($sql);
            $count = $data[0]['count(*)'];
        }
        $Page = new \Admin\Common\Util\MyPage($count, $num);
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $show = $Page->show();
        if ($type == 'all') {
            //查询全部数据元素
            $sql = 'SELECT a.id, a.sn,a.money,a.type,a.add_time,a.pay_type,a.pay_status,b.username from yw_money as a, yw_user as b WHERE a.user_id = b.id AND (sn LIKE \'%'.$sec.'%\' OR username LIKE \'%'.$sec.'%\') ORDER BY a.id DESC limit '.$Page->firstRow . ',' . $Page->listRows;
        } elseif ($type == 'bonus') {
            //查询奖金的数据
            $sql = 'SELECT a.id, a.sn,a.money,a.type,a.add_time,a.pay_type,a.pay_status,b.username from yw_money as a, yw_user as b WHERE a.user_id = b.id AND a.type = \'prize\' AND (sn LIKE \'%'.$sec.'%\' OR username LIKE \'%'.$sec.'%\') ORDER BY a.id DESC  limit '.$Page->firstRow . ',' . $Page->listRows;
        } elseif ($type == 'recharge') {
            $sql = 'SELECT a.id, a.sn,a.money,a.type,a.add_time,a.pay_type,a.pay_status,b.username from yw_money as a, yw_user as b WHERE a.user_id = b.id AND (a.type = \'recharge\' OR a.type = \'agent_recharge\') AND (sn LIKE \'%'.$sec.'%\' OR username LIKE \'%'.$sec.'%\') ORDER BY a.id DESC  limit '.$Page->firstRow . ',' . $Page->listRows;
        }
        $list = $money->query($sql);
        // 赋值数据集
        $this->assign('data', $list);
        // 赋值分页输出
        $this->assign('page', $show);
        $this->assign('keyword',$sec);
        $this->display('index');
    }



    /**
     * 账单详情
     */
    public function details($id="")
    {

        $url = U('Admin/Money/index');
        if($id==''){
            $this->error('缺少参数!',$url);
            exit;
        }
        //检测是否为数字
        if(!is_numeric($id)){
            $this->error('参数错误!',$url);
            exit;
        }
        $this->assign("page_title","账单详情");
        $data = M('money')->field('sn,user_id,money,type,pay_type,pay_status,add_time,remark')->where("id=$id")->select();
        $this->assign('data',$data);
        $user_id = $data[0]['user_id'];
        $data_name = M('user')->field('username')->where("id=$user_id")->select();
        $data_name1 =$data_name[0]['username'];
        $this->assign('data_name',$data_name1);
        $this->display();
    }

}