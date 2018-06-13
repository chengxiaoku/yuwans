<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 收支明细控制器
 * Created by PhpStorm.
 * User: 程龙飞 710425820@qq.com
 * Date: 2016/7/20
 * Time: 12:11
 */
class RoleController extends BaseController {

    //储存树状数据
    public $cont = array();
    public $con_text = array();

    /**
     * 管理员管理
     */
    public function admin()
    {
        $this->assign("page_title","管理员管理");
        if(IS_GET){
            $model = M("admin");
            $data = $model ->select();
            $this->assign("data",$data);
            $sql ='SELECT yw_admin_role.name FROM yw_admin_role,yw_admin WHERE yw_admin.role_id=yw_admin_role.id';
            $c= $model->query($sql);
            $arr =array();
            foreach ($c as $val){
                foreach ($val as $value){
                    $arr[]=$value;
                }
            }
            $this->assign('cc',$arr);
            $this->display();
        }else{
            $sel = I('post.select','','trim');
            $data['name'] = array('like','%'.$sel.'%');
            $arr = M('admin')->where($data)->select();
            $this->assign('data',$arr);
            $admi_role = M('admin_role');
            $arr_1 = array();
            foreach ($arr as $value){
                $sql = 'SELECT yw_admin_role.name FROM yw_admin_role WHERE yw_admin_role.id ='.$value['role_id'];
                $da = $admi_role->query($sql);
                $arr_1[] = $da[0]['name'];
            }

            $this->assign('cc',$arr_1);
            $this->display();
        }

    }

    /**
     * 数据展示
     * 角色管理
     */
    public function permission()
    {
        $this->assign("page_title","角色管理");
        $data =M('admin_role')->select();
        $this->assign('data',$data);
        $this->display();
    }

    /**
     * 权限设置
     * @param $_data    int ID
     */
    public function setadmin($id)
    {
        $dat = isset($_GET['id'])?$_GET['id']:'';
        $admin_cont = M('admin_role_priv')->where("role_id = $dat")->find();
        //数据处理在前端进行比对
        $module = trim($admin_cont['module'],'/');
        $controller = trim($admin_cont['controller'],'/');
        $action = trim($admin_cont['action'],'/');
        $arr_m = explode('/', $module);
        $arr_c = explode('/', $controller);
        $arr_a = explode('/', $action);
        $arr2 = array();
        $num = count($arr_m);
        for ($i=0;$i<$num;$i++){
            $arr2[]=$arr_m[$i].','.$arr_c[$i].','.$arr_a[$i];
        }
        $this->assign('arr',$arr2);

        $this->assign("page_title","权限设置");
        $menu_items = C("MENU");
        $arr = $this->arr_for($menu_items);
        $this->assign('data',$arr);
        $this->assign('id',$id);
        $this->assign('data1',$this->con_text);
        $arr_key = array();
        $num_1 = count($this->con_text);
        $num_2 = count($arr2);

        for($i=0;$i<$num_1;$i++){
            for($j=0;$j<$num_2;$j++){
                if($this->con_text[$i] == $arr2[$j]){
                    $arr_key[] =$i;
                };
            }
        }
        $this->assign('key_id',$arr_key);
        $this->display();
    }

        /**
         *无限遍历数组
         */
        private function arr_for($arr){

            foreach ($arr as $val){
                    $this->con_text[] =$val['m'].','.$val['c'].','.$val['a'];
                    $this->cont[] =$val['title'];

            }
            return $this->cont;
        }

    /**
     * 权限信息保存
     */
    public function inser_qx(){

        $id = isset($_POST['id'])?$_POST['id']:'';
        $qx = isset($_POST['qx'])?$_POST['qx']:'';
        if(empty($id)){
            $this->error("非法请求",U('Role/permission'));
            exit();
        }
        //为空删除ID 的所有权限记录
        if(!empty($qx)){

            //拼接模板
            $str1 = '';
            //拼接控制器
            $str2 = '';
            //拼接方法
            $str3 = '';
            if(is_array($qx)) {
                foreach ($qx as $value) {
                    $arr = explode(',', $value);
                    $str1 .= '/' . $arr[0];
                    $str2 .= '/' . $arr[1];
                    $str3 .= '/' . $arr[2];
                }
                $data['module'] = $str1;
                $data['controller'] = $str2;
                $data['action'] = $str3;
                $link = M('admin_role_priv')->where("role_id=$id")->save($data);
                $url = U('Role/permission');
                if ($link) {
                    $this->success("权限修改成功", $url);
                    exit();
                } else {
                    $this->error("权限修改失败", $url);
                    exit();
                }
            }
        }
    }
    /**
     *修改角色
     * @param $dat ID
     */
    public function updateadmin($dat){
        $this->assign('page_title','修改角色');
        $data = M('admin_role')->where("id = $dat")->find();
        $this->assign('data',$data);
        $this->display();
    }

    /**
     *修改角色(数据库)
     */
    public function updat_per(){
        $username = isset($_POST['user'])? $_POST['user']:'';
        $enabled = isset($_POST['optionsRadios'])? $_POST['optionsRadios']:'';
        $description = isset($_POST['content'])? $_POST['content']:'';
        $id = isset($_POST['role_id'])? $_POST['role_id']:'';

        $data['name'] = $username;
        $data['description'] = $description;
        $data['enabled'] = $enabled;
        $data['id'] = $id;
        $link = M('admin_role')->save($data);
        $url=U('Role/permission');
        if ($link) {
            $this->success("数据修改成功", $url);
            exit();
        } else {
            $this->error("数据修改失败",$url);
            exit();
        }
    }
    /**
     *添加角色
     */
    public function addadmin(){
        $this->assign('page_title','添加角色');
        $menu_items = C("MENU");
        $arr = $this->arr_for($menu_items);
        $this->assign('data',$arr);
        $this->assign('data1',$this->con_text);
        $this->display();
    }
    /**
     *添加管理员
     */
    public function admins_add(){
        $this->assign('page_title','添加管理员');
        $data = M('admin_role')->select();
        $this->assign('data',$data);
        $this->display();
    }
    /**
     * 修改管理员
     * $val int 数据ID值
     */
    public function admins_update(){
        $url = U('Role/admin');
        if(IS_GET){
            $val = I('get.val','','trim');
            if(empty($val)){
                $this->error("缺少参数,请重新添加!",$url);
                exit;
            }
            $data = M('admin')->where("id = $val")->find();
            $this->assign('page_title','修改管理员');
            $this->assign('data',$data);
            $sel = M('admin_role')->select();
            $this->assign('sel',$sel);
            $this->display();
        }else{
            $username = I('post.username','','trim');
            $name = I('post.name','','trim');
            $per = I('post.per','','trim');
            $id = I('post.role_id','','trim');
            //跳转时间
            $_time = 2;
            if(empty($username)){
                $this->error("缺少用户名!",$url,$_time);
                exit;
            }
            if(empty($name)){
                $this->error('缺少真实姓名!',$url,$_time);
                exit;
            }
            if(empty($per)){
                $this->error('缺少所属角色!',$url,$_time);
                exit;
            }
            if(empty($id)){
                $this->error('缺少参数,请重新添加！',$url,$_time);
            }
            //检测用户名是否重复
            $use_data = M('admin')->field('name')->where("id!=$id")->select();
            foreach ($use_data as $value){
                if($username == $value['name']){
                    $this->error('用户名不能重复,请勿重复添加！',$url,$_time);
                    exit;
                }
            }
            $pwd = I('post.pwd','','trim');
            $pwd_new  = '';
            $admin_m =M('admin');
            if(empty($pwd)){
                $pwd_data = $admin_m->field('pwd')->where("id = $id")->select();
                $pwd_new = $pwd_data[0]['pwd'];
            }else{
                $pwd_new = md5($pwd) ;
            }
            $data['name'] = $username;
            $data['realname'] = $name;
            $data['role_id'] = $per;
            $data['pwd'] = $pwd_new;
            $data['id'] = $id;
            $link = $admin_m->save($data);
            if($link){
                $this->success("数据修改成功", $url);
                exit();
            }else{
                $this->error("数据未修改", $url,2);
                exit();
            }
        }
    }

    /**
     * 增加管理员
     * 插入数据库
     */
    public function inser(){
        $user = isset($_POST['user'])? $_POST['user']:'';
        $paw = isset($_POST['paw'])? $_POST['paw']:'';
        $paw1 = isset($_POST['paw1'])? $_POST['paw1']:'';
        $name = isset($_POST['name'])? $_POST['name']:'';
        $role = isset($_POST['role'])? $_POST['role']:'';
        if(empty($user) || empty($paw) ||empty($paw1) ||empty($name) ||empty($role)){
            $this->error("非法请求",U('Role/admins_add'));
            exit();
        }
        if($paw != $paw1){
            $this->error("密码错误",U('Role/admins_add'));
            exit();
        }
        $use_mes_data = M('admin')->field('name')->select();
        foreach ($use_mes_data as $value){
            if($user == $value['name']){
                $this->error('用户名重复，请勿重复添加!',U('Role/admin'));
            }
        }
        //加密密码
        $paw = md5($paw);
        //获取本地时间
        $time = date('Y-m-d h:i:s',time());
        //获取IP
        $reIP=$_SERVER["REMOTE_ADDR"];

        $data['name']=$user;
        $data['pwd']=$paw;
        $data['role_id']=$role;
        $data['last_ip']=$reIP;
        $data['last_time']=$time;
        $data['realname']=$name;
        $link = M("admin")->add($data);
        $url =U('Role/admin');
        if ($link) {
            $this->success("数据添加成功", $url);
            exit();
        } else {
            $this->error("数据添加失败",$url);
            exit();
        }
    }

    /**
     * 删除管理员操作
     * @param $del_id string 删除数据的ID
     */
    public function del_admin($del_id){
        $model = M("admin");
        $data['id'] = array('in',$del_id);
        $rs = $model->where($data)->delete();
        $url = U("Role/admin");
        if ($rs !== false) {
            $this->success("数据删除成功", $url);
        } else {
            $this->error("数据删除失败",$url);
        }
    }

    /**
     *添加角色
     */
    function insert_per(){

        $user = isset($_POST['user'])? $_POST['user']:'';
        $optionsRadios = isset($_POST['optionsRadios'])? $_POST['optionsRadios']:'';
        $content = isset($_POST['content'])? $_POST['content']:'';
        if(empty($user)){
            $this->error("非法请求",U('Role/permission'));
            exit();
        }
        $data['name']=$user;
        $data['description']=$content;
        $data['enabled']=$optionsRadios;
        $id = M("admin_role")->add($data);
        $qx = isset($_POST['qx'])?$_POST['qx']:'';
        $url =U('Role/permission');
        if(!empty($qx)){
            //拼接模板
            $str1 = '';
            //拼接控制器
            $str2 = '';
            //拼接方法
            $str3 = '';
            if(is_array($qx)) {
                foreach ($qx as $value) {
                    $arr = explode(',', $value);
                    $str1 .= '/' . $arr[0];
                    $str2 .= '/' . $arr[1];
                    $str3 .= '/' . $arr[2];
                }
                $data['module'] = $str1;
                $data['controller'] = $str2;
                $data['action'] = $str3;
                $data['role_id']= $id ;


                $link = M('admin_role_priv')->add($data);
                if ($link) {
                    $this->success("角色添加成功", $url);
                    exit();
                } else {
                    $this->error("角色添加失败",$url);
                    exit();
                }
            }
        }else{
            $data['module'] = '';
            $data['controller'] = '';
            $data['action'] = '';
            $data['role_id']= $id ;

            $link = M('admin_role_priv')->add($data);
            if ($link) {
                $this->success("角色添加成功", $url);
                exit();
            } else {
                $this->error("角色添加失败",$url);
                exit();
            }
        }
    }
    /**
     * 删除角色操作
     * @param $del_id string 删除数据的ID
     */
    public function del_per($del_id){
        $model = M("admin_role");
        $data['id'] = array('in',$del_id);
        $rs = $model->where($data)->delete();
        $url = U("Role/permission");
        if ($rs !== false) {
            $this->success("数据删除成功", $url);
        } else {
            $this->error("数据删除失败",$url);
        }
    }

}