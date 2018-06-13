<?php
namespace Admin\Controller;
use Think;
use Think\Controller;

/**
 * 身份认证控制器
 *
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/20
 * Time: 18:18
 */
class AuthController extends Controller
{
	/**
	 * 初始化函数
	 * (non-PHPdoc)
	 * @see BackendAction::_initialize()
	 */
	protected function _initialize() {
		define('ASSETS', ROOT_PATH . 'Public/assets');
		$site_name = C("SITE_NAME");
		$this->assign('title', $site_name);
	}
	
	/**
	 * 入口
	 */
	public function index() {
		$this->login();
	}
	
	/**
	 * 判断是否登录
	 */
	private function is_login() {
		$userid = session('userid');
		return empty($userid) ? false : true;
	}
	
	/**
	 * 登录动作
	 */
	public function login() {
		if (IS_POST) {
			$username = I('post.username', '', 'trim');
			$password = I('post.password', '', 'trim');
			$verify = I('post.verify', '', 'trim');
			if ($username == "") {
				$this->assign('error', '用户名不能为空');
				$this->display();
				exit;
			}
			if ($password == "") {
				$this->assign('error', '密码不能为空');
				$this->display();
				exit;
			}
			if ($verify == "") {
				$this->assign('error', '验证码不能为空');
				$this->display();
				exit;
			}
			//检测验证码
			$verifyObject = new \Think\Verify();
			if (!$verifyObject->check($verify, 'login')) {
				$this->assign('error', '输入验证码有误');
				$this->display();
				exit;
			}

			$model = M("admin");
			$user = $model->where(array('name'=>$username))->find();
			if (empty($user)) {
				$this->assign('error', '用户不存在');
				$this->display();
				exit;
			}
			
			$_password = $user['pwd'];
			if (md5($password) !== $_password) {
				$this->assign('error', '密码不正确');
				$this->display();
				exit;
			}
			//
			$lastDate = date("Y-m-d H:i:s");

			//保存登录时间
			$model->where(array('id'=>$user['id']))->data(array('last_time'=>$lastDate))->save();
			//$admin = M('admin')->where("user_guid = '$user[guid]'")->find();
			//
			session('uid', $user['id']);
			session('uname', $user['name']);
			session('last_date', $user['last_time']);
			session('real_name', $user['real_name']);
			// Taking now logged in time.
			//$_SESSION['start'] = time();
			$start = time();
			session("start",$start);
			$session_expire = C('SESSION_EXPIRE');
			// $session_expire = isset($session_expire) ? $session_expire : 3600;

			session("expire", $start + $session_expire);
			//$_SESSION['expire'] = $_SESSION['start'] + $session_expire;

			//$ref = session('redirect_url');
			$url =U('index/index');
			redirect($url);
			
		} else {
			
			if ($this->is_login()) {
				$ref = session('redirect_url');
				$url = !empty($ref) ? $ref : U('index/index');
				redirect($url);
			}
			
			$this->assign('ref', $redirect_url);
			$this->display('login');
		}
	}
	
	/**
	 * 退出
	 */
	public function logout() {
		session('uid', null);
		session('uname', null);
		session('start', 0);
		session('expire', 0);
		session(null);
		$url = U('auth/login');
		redirect($url);
	}
	
	/**
	 * 生成验证码
	 */
	public function verify() {
		ob_clean();
		//import("ORG.Util.Think.Image");
		$verify = new \Think\Verify();
		$verify->codeSet = '0123456789';
		$verify->imageW = 100;
		$verify->imageH = 35;
		$verify->fontSize = 16;
		$verify->length = 4;
		$verify->entry('login');
	}
}