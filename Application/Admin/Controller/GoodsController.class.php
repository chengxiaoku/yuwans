<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
 * 积分商品管理控制器
 * Created by PhpStorm.
 * User: CLF 710425820@qq.com
 * Date: 2016/11/18
 * Time: 16:41
 */

class GoodsController extends BaseController
{
    /**
     * 积分商品列表
     */
    public function index(){
        $this->assign('page_title','积分商品管理');
        $num = C('page_size');
        $count = M('goods')->count();
        $Page = new \Admin\Common\Util\MyPage($count, $num);
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $data = M('goods')->order('add_time desc')->limit($Page->firstRow ,$Page->listRows)->select();
        $show = $Page->show();
        $this->assign('data',$data);
        $this->assign('page', $show);
        $this->display();
    }

    /**
     * 搜索分页
     */
    public function sel(){
        $this->assign('page_title','积分商品管理');
        $sec = I('post.sec','','trim');
        if(!empty($sec)){
            session('goods_sel',$sec);
        }
        $num = C('page_size');
        $sec = empty($sec)?session('goods_sel'):$sec;
        $_data['title'] = array('like',"%$sec%");
        $count= M('goods')->where($_data)->count();
        $Page = new \Admin\Common\Util\MyPage($count, $num);
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $data = M('goods')->where($_data)->order('add_time desc')->limit($Page->firstRow ,$Page->listRows)->select();
        $show = $Page->show();
        $this->assign('data',$data);
        $this->assign('page', $show);
        $this->display('index');
    }
    /**
     *添加商品
     */
    public function goods_add(){
        if(IS_GET){
            $this->assign('page_title','添加商品');
            $this->display();
        }else{

            $id = I('get.id','','trim');
            $title = I('post.title','','trim');
            $mess = I('post.mess','','trim');
            $description = I('post.content','','trim');
            $description = htmlspecialchars($description);
            $adress = I('post.adress','','trim');
            $num = I('post.num','','trim');
            $money = I('post.money','','trim');
            $price = I('post.price','','trim');
            $fm_img = I('post.fm_img','','trim');
            $img = I('post.img','','trim');
            if(empty($title) || empty($mess) || empty($adress) ||empty($num) ||empty($money) ||empty($price)){
                $this->error('缺少信息，请重新填写!',U('Goods/goods_add'));
                exit;
            }
            //入库
            $data['title'] = $title;
            $data['summary'] = $mess;
            $data['details'] = $description;
            $data['url'] = $adress;
            $data['cdkey'] = $num;
            $data['payMoney'] = $money;
            $data['price'] = $price;
            $data['image'] = $fm_img;
            $string = '';
            if(is_array($img)){
                foreach ($img as $value){
                    $string .=','.$value;
                }
            }
            $string = trim($string,',');
            $string = serialize($string);
            $data['images'] = $string;
            $data['add_time'] = date('Y-m-d H:i:s',time());
            if(empty($id)){
                $link = M('goods')->add($data);
                $url = U('Goods/index');
                if($link){
                    $this->success('商品添加成功!',$url);
                }else{
                    $this->error('商品添加失败!',$url);
                }
            }else{
                $data['id'] = $id;
                $link = M('goods')->save($data);
                $url = U('Goods/index');
                if($link){
                    $this->success('商品修改成功!',$url);
                }else{
                    $this->error('商品修改失败!',$url);
                }
            }

        }
    }
    /*
     * 删除数据
     */
    public function del(){
        $del_id = I('get.del_id','','trim');
        if(empty($del_id)){
            $this->error('缺少参数，请重新删除!',U('Goods/index'));
            exit;
        }
        $link = M('goods')->where("id=$del_id")->delete();
        if ($link) {
            $this->success('删除成功!',U('Goods/index'));
        }else{
            $this->error('删除失败!',U('Goods/index'));
        }
    }

    /**
     *异步更改上架下架
     */
    public function aj(){
        $id = I('post.sj_id','','trim');
        $type = I('post.type','','trim');
        if($type == 'sj'){
            $data['add_time'] = '';
            $link = M('goods')->where("id=$id")->save($data);
            if($link){
                echo 1;
            }else{
                echo 2;
            }
        }else if($type == 'xj'){
            $data['add_time'] = date('Y-m-d H:i:s',time());
            $link = M('goods')->where("id=$id")->save($data);
            if($link){
                $arr =  M('goods')->field('add_time')->where("id=$id")->select();
                echo $arr[0]['add_time'];
            }
        }
    }

    /**
     * 修改商品信息
     */
    public function goods_update(){
        $this->assign('page_title','修改商品信息');
        $updat_id = I('get.updat_id','','trim');
        $url = U('Goods/index');
        if(empty($updat_id)){
            $this->error('缺少参数!',$url);
            exit;
        }
        $data = M('goods')->where("id=$updat_id")->select();

        $this->assign('data',$data[0]);
        $img = unserialize($data[0]['images']);
        $deta = htmlspecialchars_decode($data[0]['details']);
        $arr = explode( ',',$img);
        $this->assign('deta',$deta);
        $this->assign('img_arr',$arr);
        $this->display();

    }

    /**
     *兑换历史
     */
    public function history(){
        $this->assign('page_title','兑换历史');
        $num = C('page_size');
        $count = M('goods_history')->count();
        $Page = new \Admin\Common\Util\MyPage($count, $num);
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $sql = 'SELECT a.id,c.image,b.username,c.title,c.payMoney,a.add_time from yw_goods_history as a,yw_user as b,yw_goods as c where a.user_id=b.id and a.goods_id=c.id ORDER BY a.add_time DESC limit '.$Page->firstRow .','.$Page->listRows;
        $data = M('goods_history')->query($sql);
        $show = $Page->show();
        $this->assign('data',$data);
        $this->assign('page', $show);
        $this->display();
    }
    /**
     * 兑换历史分页搜索
     */
    public function history_sel(){
        $this->assign('page_title','兑换历史');
        $sec = I('post.sec','','trim');
        if(!empty($sec)){
            session('history_sel',$sec);
        }
        $sec = empty($sec)?session('history_sel'):$sec;
        $num = C('page_size');
        $sql = "SELECT count(*) from yw_goods_history as a,yw_goods as c where a.goods_id=c.id AND c.title LIKE '%$sec%'";
        $_data = M('goods_history')->query($sql);
        $count = $_data[0]['count(*)'];
        $Page = new \Admin\Common\Util\MyPage($count, $num);
        $Page->setConfig('prev', '上一页');
        $Page->setConfig('next', '下一页');
        $sql = 'SELECT a.id,c.image,b.username,c.title,c.payMoney,a.add_time from yw_goods_history as a,yw_user as b,yw_goods as c where a.user_id=b.id and a.goods_id=c.id AND c.title LIKE \'%'.$sec.'%\' ORDER BY a.add_time DESC limit '.$Page->firstRow .','.$Page->listRows;
        $data = M('goods_history')->query($sql);
        $show = $Page->show();
        $this->assign('data',$data);
        $this->assign('page', $show);
        $this->display('history');
    }

    /**
     * 商品兑换详情
     */
    public function goods_history(){
        $id = I('get.id','','trim');
        $url = U('Goods/history');
        if(empty($id)){
            $this->error('缺少参数!',$url);
        }
        $sql = "SELECT a.add_time,c.title,b.username,c.details,c.cdkey,c.summary,c.url,c.payMoney,c.price,c.images from yw_goods_history as a,yw_user as b,yw_goods as c where a.user_id=b.id and a.goods_id=c.id and a.id =$id";
        $data = M('goods_history')->query($sql);
        $this->assign('data',$data[0]);
        $string = unserialize($data[0]['images']);
        $arr = explode(',',$string );
        $this->assign('img_src',$arr);
        $this->display();
    }
}
