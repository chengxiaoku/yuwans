<?php
namespace Admin\Controller;
use Think\Controller;
use Admin\Common\Util\UploadHandler;

/**
 * 基类控制器
 *
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/20
 * Time: 10:20
 */
class BaseController extends Controller
{

	/**
	 * 初始化
	 */
	public function _initialize()
	{
		define('ASSETS', './Public/assets/');

		//检测会话是否过期
		$now = time();
		$expire = session('expire');
		if (is_null($expire)) {
			$expire = 0;
		}
		if ($now > $expire) {
			session_destroy();
			session('redirect_url', $_SERVER['REQUEST_URI']);
			$url = U('auth/login');
			redirect($url);
			exit;
		}

		//检测是否登录
		$userid = session('uid');
		if (empty($userid)) {
			session('redirect_url', $_SERVER['REQUEST_URI']);
			$url = U('auth/login');
			redirect($url);
		}

		//设置用户信息
		$this->assign("uname", session("uname"));
		$this->assign("uid", session("uid"));
		$this->assign("real_name", session("real_name"));

		//获取菜单
		$menu = $this->getMenu();
		$this->assign("menu", $menu);

	}

	/**
	 * 获取属性值
	 *
	 * @param unknown $property
	 * @param string $default
	 * @return mixed $property value
	 */
	public function get_var($property, $default = null)
	{
		if (isset($this->$property)) {
			return $this->$property;
		}
		return $default;
	}

	/**
	 * 设置属性值
	 *
	 * @param unknown $property
	 * @param string $value
	 * @return mixed $previous value
	 */
	public function set_var($property, $value = null)
	{
		$previous = isset($this->$property) ? $this->$property : null;
		$this->$property = $value;
		return $previous;
	}

	/**
	 * 文件上传-调用TP自带的文件上传类
	 * @link http://www.kancloud.cn/manual/thinkphp/1876
	 */
	public function upload()
	{
		//$save_path = ROOT_PATH . 'Public/upload/';
		$config = array(
			'maxSize' => 3145728,
			'rootPath' => ROOT_PATH . 'Public/',
			'savePath' => 'upload/',
			'saveName' => 'uniqid',
			'exts' => array('jpg', 'gif', 'png', 'jpeg'),
			'autoSub' => true,
			'subName' => array('date', 'Ymd'),
		);
		$upload = new \Think\Upload($config);
		//返回数据格式
		$data = array(
			'error' => 0,
			'url' => '',
			'message' => 'aa'
		);
		// 上传文件
		$info = $upload->upload();
		if (!info) {
			$error = $upload->getError();
			$data['error'] = 1;
			$data['message'] = $error;
		} else {
			require './ThinkPHP/Library/Org/Qiniuyun/autoload.php';
//        	header('Access-Control-Allow-Origin:*');
			$accessKey = C('accessKey');
			$secretKey = C('secretKey');
			$auth = new \Qiniu\auth($accessKey, $secretKey);
			$bucket = C('bucket');
			foreach ($info as $file) {
				$upToken = $auth->uploadToken($bucket);
				$filePath = $upload->rootPath . $file['savepath'] . $file['savename'];
				$key = $file['savename'];
				$uploadMgr = new \Qiniu\Storage\UploadManager();

				list($ret, $err) = $uploadMgr->putFile($upToken, $key, 'C:/xampp/htdocs' . trim($filePath, '.'));
				if ($err !== null) {
				} else {
					$data['url'] = 'http://oaqx2e3yr.bkt.clouddn.com/' . $key;
				}

			}
		}
		echo json_encode($data);
	}

	/**
	 * 文件上传类-页面使用jquery file upload 插件
	 * @see https://github.com/blueimp/jQuery-File-Upload/
	 */
	public function jqueryFileUpload()
	{
		$sub_dir = date("Ymd", time());
		$save_path = ROOT_PATH . 'Public/upload/' . $sub_dir . '/';
		$upload_url = ROOT_PATH . 'Public/upload/' . $sub_dir . '/';
		$file_name = $this->generateRandomString(16);
		$options = array(
			'file_name' => $file_name,
			'upload_dir' => $save_path,
			'upload_url' => $upload_url,
			'image_versions' => array(
				'thumbnail' => array('max_width' => 200, 'max_height' => 200)
			)
		);
		new UploadHandler($options);
	}

	/**
	 * 上传文件展示
	 */
	public function fileupload()
	{
		import("@.ORG.UploadHandler");

		$sub_dir = date('Ymd');
		$save_path = ROOT_PATH . 'data/upload/' . $sub_dir . '/';
		$upload_url = 'data/upload/' . $sub_dir . '/';    //C('site_url') .

		$options = array(
			'upload_dir' => $save_path,
			'upload_url' => $upload_url,
			'image_versions' => array(
				'thumbnail' => array('max_width' => 400, 'max_height' => 400)
			)
		);
		$upload_handler = new UploadHandler($options);
	}

	public function slider_upload()
	{
		//$save_path = ROOT_PATH . 'Public/upload/';
		$config = array(
			'maxSize' => 3145728,
			'rootPath' => ROOT_PATH . 'Public/',
			'savePath' => 'upload/',
			'saveName' => 'uniqid',
			'exts' => array('jpg', 'gif', 'png', 'jpeg'),
			'autoSub' => true,
			'subName' => array('date', 'Ymd'),
		);
		$upload = new \Think\Upload($config);
		//返回数据格式
		$data = array(
			'error' => 0,
			'url' => '',
			'message' => 'aa'
		);
		// 上传文件
		$info = $upload->upload();
		if (!info) {
			$error = $upload->getError();
			$data['error'] = 1;
			$data['message'] = $error;
		} else {
			require './ThinkPHP/Library/Org/Qiniuyun/autoload.php';
			//        	header('Access-Control-Allow-Origin:*');
			$accessKey = C('accessKey');
			$secretKey = C('secretKey');
			$auth = new \Qiniu\auth($accessKey, $secretKey);
			$bucket = C('bucket');
			foreach ($info as $file) {
				$upToken = $auth->uploadToken($bucket);
				$filePath = $upload->rootPath . $file['savepath'] . $file['savename'];
				$key = $file['savename'];
				$uploadMgr = new \Qiniu\Storage\UploadManager();

				list($ret, $err) = $uploadMgr->putFile($upToken, $key, 'C:/xampp/htdocs' . trim($filePath, '.'));
				if ($err !== null) {
				} else {

					$data['files'][0] = array(
						'deleteType' => 'DELETE',
						'deleteUrl' => 'http://oaqx2e3yr.bkt.clouddn.com/' . $key,
						'name' => $key,
						'size' => 10000,
						'thumbnailUrl' => 'http://oaqx2e3yr.bkt.clouddn.com/' . $key,
						'type' => "image/png",
						'url' => 'http://oaqx2e3yr.bkt.clouddn.com/' . $key,
					);

				}

			}
		}
		echo json_encode($data);
	}

	public function qnToken()
	{
		require './ThinkPHP/Library/Org/Qiniuyun/autoload.php';
		header('Access-Control-Allow-Origin:*');
		$accessKey = C('accessKey');
		$secretKey = C('secretKey');
		$auth = new \Qiniu\auth($accessKey, $secretKey);
		$bucket = C('bucket');
		$upToken = $auth->uploadToken($bucket);
// 		$policy = array(
// 		    'returnUrl' => 'http://127.0.0.1/demo/simpleuploader/fileinfo.php',
// 		    'returnBody' => '{"fname": $(fname)}',
// 		);
// 		$upToken = $auth->uploadToken($bucket, null, 3600, $policy);
		echo $upToken;
	}

	/**
	 * 生成唯一标识
	 * @return string
	 */
	public function generateRandomString($length = 32)
	{
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';    //+-*#&@!?
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}

	/**
	 * 获取城市信息
	 */
	public function getCity()
	{
		$model = M("region");
		$data = $model->select();
		$this->responseJSON($data);
	}

	/**
	 * 相应APP手机端请求
	 * @param $data
	 */
	private function responseJSON($data)
	{
		header('Content-Type: application/json');
		echo json_encode($data);
		exit;
	}

	/**
	 * 检索所在区域网吧
	 */
	public function searchNetbar()
	{
		$province = empty($_GET['province']) ? '' : M('region')->where("region_id = " . $_GET['province'] . " ")->getField('region_name');
		$city = empty($_GET['city']) ? '' : M('region')->where("region_id = " . $_GET['city'] . " ")->getField('region_name');
		$distract = empty($_GET['distract']) ? '' : M('region')->where("region_id = " . $_GET['distract'] . " ")->getField('region_name');

		$model = M('user t1');
		if (empty($province) && empty($city) && empty($distract)) {
			$province = $model->field(" t1.id,t2.title ")->join("left join `yw_user_netbar` t2 on t1.id = t2.user_id ")->where(" user_type = 'netbar' ")->select();
		} else {
			$province = $model->field(" t1.id,t2.title ")->join("left join `yw_user_netbar` t2 on t1.id = t2.user_id ")->where(" user_type = 'netbar' and (address like '%$province%' and address like '%$city%' and address like '%$distract%' )")->select();
		}

		$this->responseJSON($province);
	}

	/**
	 * 获取菜单
	 */
	public function getMenu()
	{

		//获取用户ID
		$user_id = session('uid');
		$arr = M('admin')->where("id=$user_id")->find();
		//获取角色ID
		$per_id = $arr['role_id'];
		$arr1 = M('admin_role_priv')->where("role_id=$per_id")->find();
		$module = trim($arr1['module'], '/');
		$controller = trim($arr1['controller'], '/');
		$action = trim($arr1['action'], '/');
		$arr_m = explode('/', $module);
		$arr_c = explode('/', $controller);
		$arr_a = explode('/', $action);
		$arr2 = array();
		$num = count($arr_m);
		for ($i = 0; $i < $num; $i++) {
			$arr2[] = $arr_m[$i] . '/' . $arr_c[$i] . '/' . $arr_a[$i];
		}
		
		$arr2_num = count($arr2);
		$menu_items = C("MENU");
		$menu_html = '';
		foreach ($menu_items as $item) {
			$m = $item['m'];
			$c = $item['c'];
			$a = $item['a'];
			$route = $m . '/' . $c . '/' . $a;
			$url = U($route);
			//检测当前用户是否有权限
			for ($i = 0; $i < $arr2_num; $i++) {
				if ($arr2[$i] == $route) {
					$child = $item['child'];
					if ($child) {
						if ($item['suffix']) {
							//是否有后缀
							$menu_html .= '<li class="treeview"><a href="' . $url . '"><i class="' . $item['icon'] . '"></i><span>' . $item['title'] . '</span>' . $item['suffix'] . '</a>';
						} else {
							$menu_html .= '<li class="treeview"><a href="' . $url . '"><i class="' . $item['icon'] . '"></i><span>' . $item['title'] . '</span></a>';
						}
						$menu_html .= '<ul class="treeview-menu menu-open">';

						foreach ($child as $val) {
							$child_m = $val['m'];
							$child_c = $val['c'];
							$child_a = $val['a'];
							$chile_route = $child_m . '/' . $child_c . '/' . $child_a;
							$chile_url = U($chile_route);
							$menu_html .= '<li><a href="' . $chile_url . '"><i class="' . $val['icon'] . '"></i>' . $val['title'] . '</a></li>';
						}
						$menu_html .= '</ul></li>';
					} else {
						//是否有后缀
						if ($item['suffix']) {
							$menu_html .= '<li><a href="' . $url . '"><i class="' . $item['icon'] . '"></i><span>' . $item['title'] . '</span>' . $item['suffix'] . '</a></li>';
						} else {
							$menu_html .= '<li><a href="' . $url . '"><i class="' . $item['icon'] . '"></i><span>' . $item['title'] . '</span></a></li>';
						}
					}
					//分行显示
					$row = $item['key'];
					if ($row == 'slider') {
						$menu_html .= '<li class="header"></li>';
					}
				} else {
					continue;
				}
			}


		}

		return $menu_html;
	}

}