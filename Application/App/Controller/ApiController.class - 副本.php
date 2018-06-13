<?php
namespace App\Controller;
use Think\Controller;
use Think\Log\Driver\Sae;

/**
 * APP Api
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/21
 * Time: 11:49
 */
class ApiController extends Controller
{
    /**
     * 1：手机号码是否存在
     * @param string phone
     * @desc 返回值false表示不存在，true表示已存在
     */
    public function isPhoneExists()
    {
        $phone = $this->getVar('phone');
		$data = D('user')->isPhoneExists($phone);
        $this->responseJson($data);
    }

    /**
     * 2：注册用户
     * @param string phone 手机号码
     * @param string pwd 密码
     * @desc 返回值false表示注册失败，true表示注册成功
     */
    public function register()
    {
        $phone = $this->getVar('phone');
        $pwd = $this->getVar('pwd');
        $introducerPhone = $this->getVar('introducerPhone');
        $userType = $this->getVar('userType');
        $auth = $this->getVar('auth');
        if (is_null($phone) || is_null($pwd)) {
            $this->responseFailMessage("电话号码或密码不合法");
        }
        //检测
        $db = D('user');
        $rst = $db->isPhoneExists($phone);
        if ($rst) {
            $this->responseFailMessage("注册失败：该电话号码已存在");
        }
        $pwd = md5($pwd);
        if ($userType=='netbar'){
        	$defaultAvatar = C('default_Avatar');
        	$data = array(
        			'tel' => $phone,
        			'pwd' => $pwd,
        			'user_type' => 'netbar',
        			'username' => $phone,
        			'add_time' => date('Y-m-d H:i:s', time()),
        			'status' => 1,
        			'avatar' => $defaultAvatar,
        			'auth'   => $auth,
        	);
        	if ($return = $db->add($data)){
        		if ($model = M('user_netbar')->add(array('user_id'=>$return,'status'=>1,'balance'=>0))){
        			$this->responseJson(array('userId'=>$return,'headImg'=>$defaultAvatar));
        		}else{
        			$db->delete($return);
        			$this->responseFailMessage('注册失败');
        		}
        	}else{
        		$this->responseFailMessage("注册失败");
        	}
        }else{
        	$data = array(
        			'tel' => $phone,
        			'pwd' => $pwd,
        			'parent_id' => $introducerPhone,
        			'auth' => $auth,
        	);
        	$rst = $db->register($data);
        }
        $this->responseJson($rst);
    }

    /**
     * 3：忘记密码
     * @param string phone 手机号码
     * @param string pwd 新密码
     * @desc 返回bool值，false表示新密码保存不成功，true表示新密码保存成功
     */
    public function forgotPwd()
    {
        $phone = $this->getVar('phone');
        $pwd = $this->getVar('pwd');
        if (is_null($phone) || is_null($pwd)) {
            $this->responseFailMessage("电话号码或新密码不合法");
        }
		$return = D('user')->where(" tel='$phone' ")->save(array('pwd'=>md5($pwd)));
		if ($return){
			$this->responseJson();
		}else{
			$this->responseFailMessage('密码修改失败');
		}
        
    }

    /**
     * 4：获取用户资料
     * 接受三个参数 用户电话号、用户密码、用户类型（默认为普通用户player）
     */
    public function getUserInfo()
    {
        $phone = $this->getVar('phone');
        $pwd = $this->getVar('pwd');
        //$userType = is_null($this->getVar('userType'))?'player':$this->getVar('userType');
        if (is_null($phone) || is_null($pwd)) {
            $this->responseFailMessage("电话号码或新密码不合法");
        }
        $pwd = md5($pwd);

        //操作数据库
        $model = D('user t1');
        $userType = M('user')->where(" tel = $phone and pwd = '$pwd' ")->getField('user_type');
        if ($userType == 'player'){
        	$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.age,t2.game_age,t2.likes")->join(" yw_user_player t2 on t1.id = t2.user_id ")->where(" t1.tel = '$phone' and t1.pwd = '$pwd'")->find();
        	if ($data){
        		$info['userId'] = $data['id'];
        		$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
        		$info['nickName'] = $data['nickname'];
        		$info['sex'] = $data['sex']==1?'男':'女';
        		$info['age'] = $data['age'];
        		$info['playAge'] = $data['game_age'];
        		$info['address'] = $data['address'];
        		$info['slogan'] = $data['profile'];
        		$info['realName'] = $data['real_name'];
        		$info['cardNo'] = $data['identity'];
        		$info['gameId'] = explode(',',$data['likes']);
        		$info['userType'] = $userType;
	        	$this->responseJson($info);
        	}else{
        		$this->responseFailMessage('无此用户');
        	}
        }else{
        	$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.title")->join(" yw_user_netbar t2 on t1.id = t2.user_id ")->where(" t1.tel = '$phone' and t1.pwd = '$pwd'")->find();
        	if ($data){
        			$info['userId'] = $data['id'];
        			$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
        			$info['nickName'] = $data['nickname'];
        			$info['sex'] = $data['sex']==1?'男':'女';
        			$info['address'] = $data['address'];
        			$info['slogan'] = $data['profile'];
        			$info['realName'] = $data['real_name'];
        			$info['cardNo'] = $data['identity'];
        			$info['title'] = $data['title'];
        			$info['userType'] = $userType;
        		$this->responseJson($info);
        	}else{
        		$this->responseFailMessage('无此用户');
        	}
        }
       
    }

	/**
	 * ++查询用户资料和战绩
	 */
	public function getUserInfoWithId(){
		$userId = $this->getVar('userId');
		if (empty($userId)){
			$this->responseFailMessage('用户ID不能为空');
		}
		$model = D('user t1');
		$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.longitude,t1.latitude,t1.tel,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.age,t2.game_age,t2.times,t2.win_times,t2.lose_times,t2.fail_times,t2.pk_score,t2.likes")->join(" yw_user_player t2 on t1.id = t2.user_id ")->where(" t1.id = '$userId'")->find();
		if ($data){
			$info['userId'] = $data['id'];
			$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
			$info['nickName'] = $data['nickname'];
			$info['sex'] = $data['sex']==1?'男':'女';
			$info['age'] = $data['age'];
			$info['phone'] = $data['tel'];
			$info['lng'] = $data['longitude'];
			$info['lat'] = $data['latitude'];
			$info['playAge'] = $data['game_age'];
			$info['address'] = $data['address'];
			$info['slogan'] = $data['profile'];
			$info['realName'] = $data['real_name'];
			$info['cardNo'] = $data['identity'];
			$info['score'] = $data['pk_score'];
			$info['sumPlayCount'] = $data['times'];
			$info['winCount'] = $data['win_times'];
			$info['loseCount'] = $data['lose_times'];
			$info['BreakCount'] = $data['fail_times'];
			$info['gameId'] = $data['likes'];
			$this->responseJson($info);
		}else{
			$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.longitude,t1.latitude,t1.tel,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.title net_title")->join(" yw_user_netbar t2 on t1.id = t2.user_id ")->where(" t1.id = '$userId'")->find();
			if ($data){
				$info['userId'] = $data['id'];
				$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
				$info['nickName'] = $data['nickname'];
				$info['sex'] = $data['sex']==1?'男':'女';
				$info['age'] = $data['age'];
				$info['phone'] = $data['tel'];
				$info['lng'] = $data['longitude'];
				$info['lat'] = $data['latitude'];
				$info['playAge'] = 0;
				$info['address'] = $data['address'];
				$info['slogan'] = $data['profile'];
				$info['realName'] = $data['real_name'];
				$info['cardNo'] = $data['identity'];
				$info['score'] = 0;
				$info['sumPlayCount'] = 0;
				$info['winCount'] = 0;
				$info['loseCount'] = 0;
				$info['BreakCount'] = 0;
				$info['gameId'] = 0;
				$info['netbarTitle'] = $data['net_title'];
				$this->responseJson($info);
			}else{
				$this->responseFailMessage('无此用户');
			}
		}
	}
    /**
     * 5：保存用户资料
     * @param string guid 用户唯一表示
     */
    public function updateUserInfo(){
    	//接受提交的数据
		$userId= $this->getVar('userId');
		if (empty($userId)){
			$this->responseFailMessage('id不能为空');
		}
		$model = M('user');
		if ($model->where(" id = $userId ")->getField('user_type')=='player'){
			$data['avatar'] = $this->getVar('headImg');
			$data['nickname'] = $this->getVar('nickName');
			$data['real_name'] = $this->getVar('realName');
			$data['sex'] = $this->getVar('sex');
			$dataPlayer['game_age'] = $this->getVar('playAge');
			$dataPlayer['age'] = $this->getVar('age');
			$dataPlayer['likes'] = $this->getVar('gameId');
			$data['address'] = $this->getVar('address');
			$data['profile'] = $this->getVar('slogan');
			$data['identity'] = $this->getVar('cardNo');
			$data['address'] = $this->getVar('address');
			if (!preg_match("/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/", $data['identity'])){
				$this->responseFailMessage('身份证不合法');
			}
			if ($model -> where(" id =".$userId)-> save($data)!==false){
				if (M('user_player')->where(" user_id = $userId ")->save($dataPlayer)!==false){
					$this->responseJson(true);
				}else{
					$this->responseFailMessage('修改失败');
				}
			}else{
				$this->responseFailMessage('修改失败');
			}
		}else{
			$data['nickname'] = $this->getVar('nickName');
			//$data['address'] = $this->getVar('address');
			$data['license'] = $this->getVar('license');
			if (empty($data['nickname']) /*|| empty($data['address'])*/ || empty($data['license'])){
				$this->responseFailMessage('修改网吧，nickName，address，license不能为空');
			}
			if ($model->where("id = $userId")->save($data)===false){
				$this->responseFailMessage('修改失败');
			}else{
				$this->responseJson(true);
			}
		}
    }

    /**
     * 6：查询附近网吧列表
     * @param string longitude
     * @param string latitude
     */
    public function getNetBarWithGPS()
    {
        $longitude = $this->getVar('lng');
        $latitude = $this->getVar('lat');

        $squares = returnSquarePoint($longitude, $latitude);
        $model = M('user t1');
        $list = $model->field('t1.id,t2.title,t1.address,t1.longitude,t1.latitude')->join(" left join yw_user_netbar t2 on t1.id = t2.user_id ")->where(" t1.user_type = 'netbar' and t1.latitude<>0 and t1.latitude>{$squares['right-bottom']['lat']} and t1.latitude<{$squares['left-top']['lat']} and t1.longitude<{$squares['left-top']['lng']} and t1.longitude>{$squares['right-bottom']['lng']} ")->select();
        if ($list){
        	foreach ($list as $key => $val){
        		$data[$key] =array(
        				'id' => $val['id'],
        				'name' => $val['title'],
        				'distance' => getDistance($longitude,$latitude,$val['longitude'],$val['latitude']),
        				'address' => $val['address']
        		);
        	}
        	$this->responseJson($data);
        }else{
        	$this->responseFailMessage('该地区附近暂无网吧');
        }
        
    }

    /**
     * 7：按区查询所有网吧
     * @param string city 城市名
     * @param string area 区名
     * @desc 返回网吧的信息，数组类型array('id'=>'','name'=>'','distance'=>'','address'=>'')
     */
    public function getNetBarWithCityAndArea()
    {
        $city = $this->getVar('city');
        $area = $this->getVar('area');
        $model = M('user t1');
        $list = $model->join("yw_user_netbar t2 on t1.id = t2.user_id")->where(" (t1.address like '%$city%' and t1.address like '%$area%') and t1.user_type= 'netbar' ")->select();
        if ($list){
        	foreach ($list as $key => $val){
        		$data[$key]['id'] = $val['user_id'];
        		$data[$key]['name'] = $val['title'];
        		//$data[$key]['distance'] = $val[''];
        		$data[$key]['address'] = $val['address'];
        	}
        	$this->responseJson($data);
        }else{
        	$this->responseFailMessage('无数据');
        }
    }

    /**
     * 8：添加游戏桌
     *
     */
    public function addGameDesk(){
    
    	
    	$data = array(
    		'game_id'   =>  $this->getVar('gameId'),
    		'user_id'   =>  $this->getVar('ownerId'),
    		'netbar_id' =>  $this->getVar('netbarId'),
    		'begin_time'=>  $this->getVar('startTime'),
    		'team' 		=>  $this->getVar('playerNum'),
    		'times'		=>  $this->getVar('gameCount'),
    		'prize'     =>  $this->getVar('gamePay'),
    		'rule'      =>  $this->getVar('gameRule'),
    		'room_id'    =>  $this->getVar('roomId'),
    		'add_time'  =>  date('Y-m-d H:i:s'),
    		'status'    =>  'pedding',
    	);

    	if (isInt($data['game_id']) && isInt($data['user_id']) && isInt($data['netbar_id']) && isInt($data['team']) && isInt($data['times'])){
    		
    	}else{
    		$this->responseFailMessage('游戏Id、房主Id、网吧Id、人数、场次必须为整数');
    	}
    	$model = D('war');
    	$warId = $model->add($data);
    	if ($warId){
    		$userId = trim($this->getVar('userId'),',');
    		if (!empty($userId)){
	    		$userId = explode(',',$userId);
	    		$model = M('war_team');
	    		foreach ($userId as $key => $val){
	    			$model ->add(array(
	    					'war_id'=>$warId,
	    					'player_id'=>$val,
	    					'role'=>'A',
	    					'status'=>'pedding',
	    					'add_time'=>date('Y-m-d H:i:s')
	    					
	    			));
	    		}
    		}
    		$this->responseJson(array('gameDeskId'=>$warId));
    	}else{
    		$this->responseFailMessage('游戏桌添加失败');
    	}
    }

    /**
     * 9：按状态和关键字取游戏桌列表
     */
    public function getGameDeskListWithStatus(){
    	$gameStatus = $this->getVar('gameStatus');
    	$pageNo = $this->getVar('pageNo');
    	$pageSize = $this->getVar('pageSize');
    	$userId = $this->getVar('userId');
    	if (empty($userId)){
    		//用户id为空时执行
    		if ($gameStatus==0){
    			$gameStatus = 'pedding';
    		}elseif ($gameStatus==1){
    			$gameStatus = 'doing';
    		}else{
    			$gameStatus = 'done';
    		}
    		$keywords = $this->getVar('keywords');
    		if (empty($keywords)){
    			$model = M('war t1');
    			$list = $model->field(" t1.*,t2.nickname real_name,t3.thumb,t3.title gamename,t4.title ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->join(" left join yw_games t3 on t3.id = t1.game_id ")->join("left join yw_user_netbar t4 on t4.user_id = t1.netbar_id")->where(" t1.status = '$gameStatus' ")->order(' t1.begin_time  ') ->page($pageNo,$pageSize)->select();
    		}else{
    			$model = M('war t1');
    			$list = $model->field(" t1.*,t2.nickname real_name,t3.thumb,t3.title gamename,t4.title ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->join(" left join yw_games t3 on t3.id = t1.game_id ")->join("left join yw_user_netbar t4 on t4.user_id = t1.netbar_id")->where(" t1.status = '$gameStatus' and (t2.real_name like '%$keywords%' or t3.title like '%$keywords%') ")->order(' t1.begin_time ') ->page($pageNo,$pageSize)->select();
    		}
    		$list = array_msort($list,'type','SORT_DESC','begin_time','SORT_ASC');
    		$data = array();
    		foreach ($list as $key => $val){
    			if ($val['type']==1){
    				$data[$key]['ownerName'] = '官方';
    				$data[$key]['cup'] = $val['money'];
    			}else{
    				$data[$key]['ownerName'] = $val['real_name'];
    				$data[$key]['gamePay'] = $val['prize'];
    			}
    			$data[$key]['gameDeskId'] = $val['id'];
    			$data[$key]['gameName'] = $val['gamename'];
    			$data[$key]['netBarId'] = $val['netbar_id'];
    			$data[$key]['gameImage'] = $val['thumb'];
    			$data[$key]['startTime'] = $val['begin_time'];
    			$data[$key]['netBarName'] = $val['title'];
    		}
    		$this->responseJson($data);
    	}else{
    		//用户id不为空，代表查询用户自己参与的游戏桌（如果为网吧用户，则查询该网吧下所有官方战场）;
    		if (M('user')->where(" id = $userId ")->getField('user_type')=='player'){
    			$model = M('war_team');
    			$userWar = $model->field('war_id')->where(" player_id = $userId ")->select();
    			$userWar = multi_unique($userWar);
    			$warIds = '';
    			foreach ($userWar as $key => $val){
    				$warIds = $warIds .",". $val['war_id'];
    			}
    			$warIds = trim($warIds,',');
    			$modelWar = M('war t1');
    			$map['t1.id'] = array('in',$warIds);
    			//$warData = $modelWar -> where($map)->select();
    			$list = $modelWar->field(" t1.*,t2.real_name,t3.thumb,t3.title gamename,t4.title ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->join(" left join yw_games t3 on t3.id = t1.game_id ")->join("left join yw_user_netbar t4 on t4.user_id = t1.netbar_id")->where($map)->order(' t1.begin_time  ') ->page($pageNo,$pageSize)->select();
    			$list = array_msort($list,'type','SORT_DESC','begin_time','SORT_ASC');
    			$data = array();
    			foreach ($list as $key => $val){
    				if ($val['type']==1){
    					$data[$key]['ownerName'] = '官方';
    					$data[$key]['gamePay'] = $val['money'];
    				}else{
    					$data[$key]['ownerName'] = $val['real_name'];
    					$data[$key]['gamePay'] = $val['prize'];
    				}
    				$data[$key]['gameDeskId'] = $val['id'];
    				$data[$key]['gameName'] = $val['gamename'];
    				$data[$key]['netBarId'] = $val['netbar_id'];
    				$data[$key]['gameImage'] = $val['thumb'];
    				$data[$key]['startTime'] = $val['begin_time'];
    				$data[$key]['netBarName'] = $val['title'];
    			}
    			$this->responseJson($data);
    		}else{
    			//该情况为用户为网吧用户
    			$model = M('war t1');
    			$list = $model->field(" t1.*,t2.nickname real_name,t3.thumb,t3.title gamename,t4.title ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->join(" left join yw_games t3 on t3.id = t1.game_id ")->join("left join yw_user_netbar t4 on t4.user_id = t1.netbar_id")->where(" t1.netbar_id = $userId and t1.type = 1 ")->order(' t1.begin_time  ') ->page($pageNo,$pageSize)->select();
    			foreach ($list as $key => $val){
    				if ($val['type']==1){
    					$data[$key]['ownerName'] = '官方';
    					$data[$key]['cup'] = $val['money'];
    					$data[$key]['gameDeskId'] = $val['id'];
    					$data[$key]['gameName'] = $val['gamename'];
    					$data[$key]['netBarId'] = $val['netbar_id'];
    					$data[$key]['gameImage'] = $val['thumb'];
    					$data[$key]['startTime'] = $val['begin_time'];
    					$data[$key]['netBarName'] = $val['title'];
    				}
    			}
    			$this->responseJson($data);
    		}
    		
    	}
    	
    }

    /**
     * 10：按照游戏id查询游戏资料
     */
    public function getGameInfoWithGameId()
    {
        
        $gameid = $this->getVar('gameId');
        if (empty($gameid)){
        	$this->responseFailMessage('缺少游戏ID');
        }else{
        	$model = D('games');
        	$data = $model ->idGetGames($gameid);
        	if ($data===false){
        		$this->responseFailMessage('未找到活动');
        	}else{
        		foreach ($data as $key => $val){
        			$info[$key]['gameId'] = $val['id'];
        			$info[$key]['maxPeopleNumber'] = $val['player_max'];
        			$info[$key]['times'] = $val['times'];
        			$info[$key]['wagerMin'] = $val['prize_min'];
        			$info[$key]['wagerMax'] = $val['prize_max'];
        			$info[$key]['gameName'] = $val['title'];
        			$info[$key]['thumb'] = $val['thumb'];
        			$info[$key]['bgImage'] = $val['bgimage'];
        		}
        		$this->responseJson($info);
        	}
        }
      
    }

    /**
     * 11：按照游戏桌id取得游戏桌详情
     * @return data 游戏桌和参与玩家信息
     */
    public function getGameDeskWithId(){
    	$id = $this->getVar('gameDeskId');
    	if (empty($id)){
    		$this->responseFailMessage('缺少参数');
    	}
    	$model = M('war t1');
    	$list = $model->field("t1.status,t1.room_id,t1.win,t1.begin_time,t1.prize,t1.team,t1.rule,t2.title,t2.bgimage,t3.title netbarname,t4.address")->join(" left join yw_games t2 on t1.game_id = t2.id ")->join(" left join yw_user_netbar t3 on t1.netbar_id = t3.user_id")->join(" left join yw_user t4 on t4.id = t3.user_id ")->where(" t1.id = $id ")->find();
    	
    	if (!$list){
    		$this->responseFailMessage('没有该游戏桌');
    	}
    	$info = M('war_team t1')->field(" t1.player_id,t1.net_id,t2.nickname,t1.role,t1.status,t2.avatar,t3.title,t4.address ")->join(" left join yw_user t2 on t1.player_id = t2.id ")->join(" left join yw_user_netbar t3 on t1.net_id = t3.user_id ")->join(" left join yw_user t4 on t3.user_id = t4.id ")->where(" t1.war_id = $id ")->select();
    	if ($list['win'] == 'A'){
    		$winer = 'left';
    	}elseif ($list['win'] == 'B'){
    		$winer = 'right';
    	}else{
    		$winer = '';
    	}
    	$data = array(
    		'gameName'    => $list['title'],
    		'bgImage'     => $list['bgimage'],
    		'status'      => $list['status'],
    		'startTime'   => $list['begin_time'],
    		'gamePay'     => $list['prize'],
    		'peopleNumber'=> $list['team'],
    		'details'     => $list['rule'],
    		'netBarAddress' => $list['address'],
    		'netBarName'  => $list['netbarname'],
    		'winer'       => $winer,
    		'roomId'      => $list['room_id'],
    	);
    	$userInfoLeft = array();
    	//进行组装数据
    	$i=0;
    	$k=0;
    	foreach ($info as $key => $val){
    		if ($val['role'] == 'A'){
    			$userInfoLeft[$i]['userId'] = $val['player_id'];
    			$userInfoLeft[$i]['headImg']= empty($val['avatar'])?C('default_Avatar'):$val['avatar'];
    			$userInfoLeft[$i]['nickName']= $val['nickname'];
    			$userInfoLeft[$i]['status']= $val['status'];
    			$userInfoLeft[$i]['netBarAddress'] = $val['address'];
    			$userInfoLeft[$i]['netBarName'] = $val['title'];
    			$userInfoLeft[$i]['netBarId'] = $val['net_id'];
    			$i++;
    		}else {
    			$userInfoRight[$k]['userId'] = $val['player_id'];
    			$userInfoRight[$k]['headImg']= empty($val['avatar'])?C('default_Avatar'):$val['avatar'];
    			$userInfoRight[$k]['nickName']= $val['nickname'];
    			$userInfoRight[$k]['status']= $val['status'];
    			$userInfoRight[$k]['netBarAddress'] = $val['address'];
    			$userInfoRight[$k]['netBarName'] = $val['title'];
    			$userInfoRight[$k]['netBarId'] = $val['net_id'];
    			$k++;
    		}
    		
    	}
    	$data['players']['left'] = $userInfoLeft;
    	$data['players']['right'] = $userInfoRight;
        $this->responseJson($data);
    }

    /**
     * 12：加入游戏桌，用户加入挑战方或约战方
     * @return 错误信息|| 游戏桌对象+约战方 应战方
     * 
     */
    public function takePartInGameDesk(){
    	$userId = $this->getVar('userId');
    	$gameDeskId = $this->getVar('gameDeskId');
    	$role = $this->getVar('role');
    	if (empty($userId) || empty($role) || empty($gameDeskId)){
    		$this->responseFailMessage('用户id、游戏桌id、角色都不能为空');
    	}
    	if (!M('war')->where("id=$gameDeskId")->find()){
    		$this->responseFailMessage('没有该游戏桌');
    	}
    	
    	if($role==1){
    		$role = 'A';
    	}else{
    		$role = 'B';
    	}
    	#把用户加入游戏桌
    	$model = M('war_team');
    	$warUser = $model ->where(" war_id = $gameDeskId ")->select();
    	if ($warUser){
    		foreach ($warUser as $key => $val){
    			if ($val['player_id']==$userId){
    				$this->responseFailMessage('该用户已在该游戏桌');
    			}
    		}
    	}
    	#组装用户加入游戏桌数据------------
    	$warData = M('war')->where(" id = $gameDeskId ")->find();
    	if ($warData['type']==1){
    		$netBarId = $this->getVar('netBarId');
    		if (empty($netBarId)){
    			$this->responseFailMessage('加入的游戏桌是官方战场，必须提交所在网吧id');
    		}
    		$userDate = array(
    				'war_id' => $gameDeskId,
    				'player_id' => $userId,
    				'role' => $role,
    				'add_time' => date('Y-m-d H:i:s'),
    				'netbar_id' => $netBarId,
    				'status' => 'done'
    		);
    	}else{
    		$userDate = array(
    				'war_id' => $gameDeskId,
    				'player_id' => $userId,
    				'role' => $role,
    				'add_time' => date('Y-m-d H:i:s'),
    				'status' => 'done'
    		);
    	}
    	
    	if ($model ->add($userDate)){
    		$id = $gameDeskId;
    		$model = M('war t1');
    		$list = $model->field("t1.status,t1.begin_time,t1.prize,t1.team,t1.rule,t2.title,t3.title netbarname,t4.address")->join(" left join yw_games t2 on t1.game_id = t2.id ")->join(" left join yw_user_netbar t3 on t1.netbar_id = t3.user_id")->join(" left join yw_user t4 on t4.id = t3.user_id ")->where(" t1.id = $id ")->find();
    		if (!$list){
    			$this->responseFailMessage('没有该游戏桌');
    		}
    		$info = M('war_team t1')->field(" t2.nickname,t1.role,t1.status,t2.avatar ")->join(" yw_user t2 on t1.player_id = t2.id ")->where(" t1.war_id = $id ")->select();
    		$data = array(
    				'gameName'    => $list['title'],
    				'status'      => $list['status'],
    				'startTime'   => $list['begin_time'],
    				'gamePay'     => $list['prize'],
    				'peopleNumber'=> $list['team'],
    				'details'     => $list['rule'],
    		);
    		$userInfoLeft = array();
    		//进行组装数据
    		foreach ($info as $key => $val){
    			if ($val['role'] == 'A'){
    				$userInfoLeft[$key]['headImg']= empty($val['avatar'])?C('default_Avatar'):$val['avatar'];
    				$userInfoLeft[$key]['nickName']= $val['nickname'];
    				$userInfoLeft[$key]['status']= $val['status'];
    				$userInfoLeft[$key]['netBarAddress'] = $list['address'];
    				$userInfoLeft[$key]['netBarName'] = $list['netbarname'];
    			}else {
    				$userInfoRight[$key]['headImg']= empty($val['avatar'])?C('default_Avatar'):$val['avatar'];
    				$userInfoRight[$key]['nickName']= $val['nickname'];
    				$userInfoRight[$key]['status']= $val['status'];
    				$userInfoRight[$key]['netBarAddress'] = $list['address'];
    				$userInfoRight[$key]['netBarName'] = $list['netbarname'];
    			}
    		
    		}
    		$data['players']['left'] = $userInfoLeft;
    		$data['players']['right'] = $userInfoRight;
    		$this->responseJson($data);
    	}else{
    		$this->responseFailMessage('加入游戏桌失败');
    	}
    }

    /**
     * 13：用户退出游戏桌
     */
    public function exitGameDesk(){
		$userId = $this->getVar('userId');
		$gameDeskId = $this->getVar('gameDeskId');
		if (empty($userId) || empty($gameDeskId)){
			$this->responseFailMessage('用户ID和游戏桌ID不能为空');
		}
		if (!M('war')->where("id=$gameDeskId")->find()){
			$this->responseFailMessage('没有该游戏桌');
		}
		$model = M('war_team');
		$userDate = $model->where(" war_id = $gameDeskId and player_id = $userId ")->find();
		if ($userDate){
			if ($model->where(" war_id = $gameDeskId and player_id = $userId ")->delete()){
				$this->responseJson(true);
			}else{
				$this->responseFailMessage('退出失败');
			}
		}else{
			$this->responseFailMessage('该用户不在此游戏桌');
		}
    }

    /**
     * 14：玩家判赢。玩家赢后，点赢，推送给玩家所在网吧，由网吧用户判定输赢
     */
//     public function judgeWiner(){
//     	$userId = $this->getVar('userId');
//     	$gameDeskId = $this->getVar('gameDeskId');
//     	$netbarName = $this->getVar('netbarName');
//     	$netbarId = $this->getVar('netbarId');
//     	if (empty($userId) || empty($gameDeskId) || empty($netbarId)){
//     		$this->responseFailMessage('用户ID、游戏桌ID和网吧id不能为空');
//     	}
//     	if (!M('war')->where("id=$gameDeskId")->find()){
//     		$this->responseFailMessage('没有该游戏桌');
//     	}
//     	if(!M('user_netbar')->where(" user_id = $netbarId  ")){
//     		$this->responseFailMessage("未找到该网吧");
//     	}
//     	#暂先不做，等待客户更改
//     }

    /**
     * 15：关闭游戏桌，在开战时间到达后，游戏人数未满，APP提交关闭游戏桌申请。同时服务端需定时查询并关闭游戏桌
     * $request 代表是app请求还是服务器定时查询
     */
    public function closeGameDesk($request='app'){
    	$model = M('war');
    	if ($request == 'app'){
    		$gameDeskId = $this->getVar('gameDeskId');
    		if (empty($gameDeskId)){
    			$this->responseFailMessage('游戏桌ID不能为空');
    		}
    		if ($model->where(" id = $gameDeskId ")->save(array('status'=>'close'))===false){
    			$this->responseFailMessage('关闭游戏操作失败');
    		}else{
    			$this->responseSuccessMessage("关闭游戏操作成功");
    		}
    	}else{
    		$dateTime = date('Y-m-d H:i:s');
    		$warDate = $model->where(" begin_time <= '$dateTime' and status <> 'done' and status <> 'close'")->select();
    		$modelWarTeam = M('war_team');
			$closeId = '';
    		if ($warDate){
    			foreach ($warDate as $key => $val){
    				$WarTeam = $modelWarTeam-> where(" war_id =". $val['id'] ." and status = 'done'")->count();
    				if ($WarTeam<$val['team']){
    					$closeId .= $val['id'].',';
    				}
    			}
    			$closeId = trim($closeId,',');
    			if (!empty($closeId)){
    				if ($model->where(" id in ($closeId) ")->save(array('status'=>'close'))!==false){
    					#插入日志
    					$log = "[自动关闭游戏桌]".date('Y-m-d H:i:s').",系统定时器关闭已到规定时间，人数不足的游戏桌".$closeId."(数字代表任务id)";
    					M('log')->add(array('log'=>$log,'add_time'=>date('Y-m-d H:i:s')));
    				}
    			}
    		}
    	}
        
    }

    /**
     * 16：游戏延期，如果开战时间已到但人未满，房主可选择延期
     */
    public function delayGameDesk(){
    	$gameDeskId = $this->getVar('gameDeskId');
    	$delay = $this->getVar('delay');
    	if (empty($gameDeskId) || empty($delay)){
    		$this->responseFailMessage('游戏桌ID和延期时间不能为空');
    	}
    	$model = M('war');
    	if (is_numeric($delay)){
    		$delay = $delay*60;
    		$dateTime = $model->where(" id = $gameDeskId ")->getField('begin_time');
    		$dateTime = date("Y-m-d H:i:s",strtotime($dateTime)+$delay);
    		$return = $model->where(" id = $gameDeskId ")->save(array('begin_time'=>$dateTime));
    		if ($return===false){
    			$this->responseFailMessage('延期失败');
    		}else{
    			$this->responseJson(true);
    		}
    	}else{
    		$this->responseFailMessage('延期时间必须为数值');
    	}
    	
    	
    }

    /**
     * 17：资金接口，用于充值后回调， 保存账单
     */
    public function savePayInfo()
    {
        $this->responseSuccessMessage("生成账单成功");
    }

    /**
     * 18：支付余额，玩游戏时支付，支付后回调此接口，服务端需保存账单
     */
    public function payForGame()
    {
        $this->responseSuccessMessage("支付失败：这里是失败原因");
    }

    /**
     * 19：取得附近圈子
     */
    public function getGroupWithGPS(){
    	$longitude = $this->getVar('lng');
    	$latitude = $this->getVar('lat');
    	$pageNo = $this->getVar('pageNo');
    	$pageSize = $this->getVar('pageSize');
    	
    	$squares = returnSquarePoint($longitude, $latitude);
    	$model = M('community');
    	$list = $model->where(" latitude<>0 and latitude>{$squares['right-bottom']['lat']} and latitude<{$squares['left-top']['lat']} and longitude>{$squares['left-top']['lng']} and longitude<{$squares['right-bottom']['lng']} ")->page($pageNo,$pageSize)->select();
    	if ($list){
    		foreach ($list as $key => $val){
    			$sqlWhere['id'] = array('in',$val[games]);
    			$data[] = array(
    					'groupId' => $val['id'],
    					'groupName' => $val['title'],
    					'address' => $val['address'],
    					'bgImage'    => empty($val[games])?'':M('games')->where($sqlWhere)->getField('bgimage'),
    					'distance' => getDistance($longitude,$latitude,$val['longitude'],$val['latitude']),    //千米
    					'headImg' => $val['thumb'],  //缩略图
    					'details' => $val['description'],
    					'lng' => $val['longitude'],
    					'lat' => $val['latitude'],
    					'views' => $val['views'],
    					'createTime' => $val['add_time']
    			);
    		}
    		$data = array_msort($data,'distance');
    		$this->responseJson($data);
    	}else{
    		$this->responseFailMessage('附近无圈子');
    	}
    	
    }
    /**
     * 20：创建圈子
     */
    public function addGroup(){
    	$data['user_id'] = $this->getVar('userId');
    	$data['longitude'] = $this->getVar('lng');
    	$data['latitude'] = $this->getVar('lat');
    	$data['thumb'] = $this->getVar('head');
    	$data['games'] = $this->getVar('gameIds');
    	$data['title'] = $this->getVar('groupName');
    	$data['add_time'] = $this->getVar('createTime');
    	$data['description'] = $this->getVar('slogan');
    	$data['address'] = $this->getVar('address');
    	if (empty($data['user_id'])||empty($data['title'])){
    		$this->responseFailMessage('用户ID和圈子标题不能为空');
    	}
    	$model = M('community');
    	if ($model->where(" title ='". $data['title']."'")->find()){
    		$this->responseFailMessage('圈子名称重复');
    	}
    	if ($group_id = $model->add($data)){
    		M('community_users')->add(array(
    			'user_id' => $data['user_id'],
    			'comm_id' => $group_id,
    			'status'  => 'open',
    			'add_time'=> date('Y-m-d H:i:s'),
    			'remark'  => '圈子创建者', 
    		));
    		$this->responseJson(true);
    	}else{
    		$this->responseFailMessage('圈子创建失败');
    	}
        
    }

    /**
     * 21：判断圈子是否存在，创建时防止圈子名称重复
     * @return bool true 圈子存在 || false 圈子不存在
     */
    public function isExistGroup(){
    	$groupName = $this->getVar('groupName');
    	$model = M('community');
    	if ($model->where(" title ='$groupName'")->find()){
    		$this->responseJson(true);
    	}else{
    		$this->responseFailMessage('圈子不存在');
    	}
    }

    /**
     * 22：增加点击量，每次调用增加1次点击
     */
    public function addHits(){
    	$groupId = $this->getVar('groupId');
    	if (empty($groupId)){
    		$this->responseFailMessage('ID不能为空');	
    	}
    	$map['views'] = array('exp','views+1');
    	if(M('community ')->where(" id = $groupId ")->save($map)===false){
    		$this->responseFailMessage('增加失败');
    	}else{
    		$this->responseJson(true);
    	}
       
    }

    /**
     * 23：取得圈子对象列表
     */
    public function getGroupListWithType(){
    	$userId = $this->getVar('userId');
    	$groupType = $this->getVar('groupType');
    	$pageNo = $this->getVar('pageNo');
    	$pageSize = $this->getVar('pageSize');
    	
    	if (empty($userId)){
    		$this->responseFailMessage('用户ID不能为空');
    	}
    	$model = M('community');
    	$userInfo = M('user')->where(" id = $userId ")->find();
		$where = '';
    	if (!$userInfo){
    		$this->responseFailMessage('没有该用户');
    	}
    	if ($groupType == 'mygroup'){
    		$list = M('community_users t1')->field("t2.*")->join(" left join yw_community t2 on t1.comm_id = t2.id ")->where(" t1.user_id = '$userId'")->select();
    	}elseif($groupType == 'myCreateGroup'){
    		$list = $model->where("user_id = $userId")->page($pageNo,$pageSize)->select();
    	}else{
    		$likes= M('user_player')->where(" user_id = $userId ")->getField('likes');
    		if ($likes){
	    		$likes = explode(",",$likes);
	    		foreach ($likes as $val){
	    			$where .= " find_in_set($val,games) or";
	    		}
	    		$where = trim($where,'or');
	    		$list = $model->where($where)->select();
    		}else{
    			$this->responseFailMessage('该玩家暂无常玩游戏');
    		}
    	}
    	if ($list){
    		foreach ($list as $key=>$val){
    			$sqlWhere['id'] = array('in',$val[games]);
    			$data[$key] = array(
    				'groupId'    => $val['id'],
    				'groupName'  => $val['title'],
    				'bgImage'    => empty($val[games])?'':M('games')->where($sqlWhere)->getField('bgimage'),
    				'address'    => $val['address'],
    				'lng'        => $val['longitude'],
    				'lat'        => $val['latitude'],
    				'distance'   => getDistance($userInfo['longitude'],$userInfo['latitude'],$val['longitude'],$val['latitude']),
    				'headImg'    => $val['thumb'],
    				'details'    => $val['description'],
    				'views'      => $val['views'],
    				'games'      => $val['games'],
    				'createTime' => $val['add_time'],
					'userId'	 => $val['user_id']
    			);
    		}
    		$this->responseJson($data);
    	}else{
    		$this->responseFailMessage('无数据');
    	}
        //按照距离升序排列
//         $data = array(
//             array(
//                 'id' => 1,
//                 'name' => '圈子名称01',
//                 'address' => '圈子位置描述',
//                 'longitude' => '34.678394',
//                 'latitude' => '112.388763',
//                 'distance' => 0.5,    //千米
//                 'thumb' => 'http://121.42.172.61/Public/images/games/game01.jpg',  //缩略图
//                 'bgImage' => '',
//                 'gamesId' => array(1,2,3,4,5),
//                 'description' => '圈子描述',
//                 'visits' => 1000,
//                 'createTime' => '2016-07-22 12:00:00'
//             ),
//             array(
//                 'id' => 2,
//                 'name' => '圈子名称02',
//                 'address' => '圈子位置描述',
//                 'longitude' => '34.678394',
//                 'latitude' => '112.388763',
//                 'distance' => 0.5,    //千米
//                 'thumb' => 'http://121.42.172.61/Public/images/games/game01.jpg',  //缩略图
//                 'bgImage' => '',
//                 'gamesId' => array(1,2,3,4,5),
//                 'description' => '圈子描述02',
//                 'visits' => 1000,
//                 'createTime' => '2016-07-22 12:00:00'
//             ),
//         );
        $this->responseJson($data);
    }

    /**
     * 24：取得圈子动态列表
     */
    public function getActiveListWithGroup(){
    	$groupId = $this->getVar('groupId');
    	$userId = $this->getVar('userId');
    	$pageNo = $this->getVar('pageNo');
    	$pageSize = $this->getVar('pageSize');
    	if (empty($groupId)){
    		$this->responseFailMessage('圈子ID不能为空');
    	}
    	if (empty($userId) || is_null($userId)){
//     		$userModel = M('community_users')->where(" user_id = $userId and comm_id = $groupId ")->getField('status');
//     		if ($userModel=='open'){
//     			$userModel = TRUE;
//     		}else{
//     			$userModel = FALSE;
//     		}
    		$likeModel = M('community_comments');
    		$model = M('community_post t1');
    		$list = $model->field(" t1.id actid,t1.content,t1.images,t1.add_time,t1.source,t1.comments,t1.likes,t2.nickname,t2.avatar,t2.id,t1.address ")->join(" left join yw_user t2 on t1.user_id =t2.id  ") ->where(" t1.comm_id = $groupId ") ->page($pageNo,$pageSize)->order("t1.add_time desc")->select();
    		if ($list){
    			foreach ($list as $key=>$val){
    				$actId = $val['actid'];
    				$data[$key]['activeId'] = $val['actid'];
    				$data[$key]['headImg'] = $val['avatar'];
    				$data[$key]['nickName'] = $val['nickname'];
    				$data[$key]['userId'] = $val['id'];
    				$data[$key]['addTime'] = $val['add_time'];
    				$data[$key]['content'] = $val['content'];
    				$data[$key]['images'] = $val['images'];
    				$data[$key]['source'] = $val['source'];
    				$data[$key]['comments'] = $val['comments'];
    				$data[$key]['likes'] = $val['likes'];
    				$data[$key]['address'] = $val['address'];
    				$data[$key]['lastComment'] = null;
    				$replyData = $likeModel->field(" yw_community_comments.*,yw_user.nickname,yw_user.avatar ")->join("left join yw_user on yw_community_comments.user_id = yw_user.id")->where(" yw_community_comments.post_id = $actId and yw_community_comments.type='reply' and yw_community_comments.class!=1 ")->order("yw_community_comments.add_time desc")->limit(0,2)->select();
    				foreach ($replyData as $vlaue){
    					$data[$key]['lastComment'][] = [
    							'commentId' => $vlaue['id'],
    							'nickName'  => $vlaue['nickname'],
    							'headImg'   => $vlaue['avatar'],
    							'content'   => $vlaue['content'],
    							'addTime'   => $vlaue['add_time'],
    					];
    				}
//     				if ($likeModel->where(" post_id = $actId and user_id = $userId and type='like' and class!=1 ")->getField('id')){
//     					$data[$key]['isLoginUserLike'] = true;
//     				}else{
//     					$data[$key]['isLoginUserLike'] = false;
//     				}
    			}
    			$this->responseJson(['list'=>$data]);
    		}else{
    			$this->responseJson();
    		}
    	}else{
    		$userModel = M('community_users')->where(" user_id = $userId and comm_id = $groupId ")->getField('status');
    		if ($userModel=='open'){
    			$userModel = TRUE;
    		}else{
    			$userModel = FALSE;
    		}
    		$likeModel = M('community_comments');
    		$model = M('community_post t1');
    		$list = $model->field(" t1.id actid,t1.content,t1.images,t1.add_time,t1.source,t1.comments,t1.likes,t2.nickname,t2.avatar,t2.id,t1.address ")->join(" left join yw_user t2 on t1.user_id =t2.id  ") ->where(" t1.comm_id = $groupId ") ->page($pageNo,$pageSize)->order("t1.add_time desc")->select();
    		if ($list){
    			foreach ($list as $key=>$val){
    				$actId = $val['actid'];
    				$data[$key]['activeId'] = $val['actid'];
    				$data[$key]['headImg'] = $val['avatar'];
    				$data[$key]['nickName'] = $val['nickname'];
    				$data[$key]['userId'] = $val['id'];
    				$data[$key]['addTime'] = $val['add_time'];
    				$data[$key]['content'] = $val['content'];
    				$data[$key]['images'] = $val['images'];
    				$data[$key]['source'] = $val['source'];
    				$data[$key]['comments'] = $val['comments'];
    				$data[$key]['likes'] = $val['likes'];
    				$data[$key]['address'] = $val['address'];
    				$data[$key]['lastComment'] = null;
    				$replyData = $likeModel->field(" yw_community_comments.*,yw_user.nickname,yw_user.avatar ")->join("left join yw_user on yw_community_comments.user_id = yw_user.id")->where(" yw_community_comments.post_id = $actId and yw_community_comments.type='reply' and yw_community_comments.class!=1 ")->order("yw_community_comments.add_time desc")->limit(0,2)->select();
    				foreach ($replyData as $vlaue){
    					$data[$key]['lastComment'][] = [
    							'commentId' => $vlaue['id'],
    							'nickName'  => $vlaue['nickname'],
    							'headImg'   => $vlaue['avatar'],
    							'content'   => $vlaue['content'],
    							'addTime'   => $vlaue['add_time'],
    					];
    				}
    				if ($likeModel->where(" post_id = $actId and user_id = $userId and type='like' and class!=1 ")->getField('id')){
    					$data[$key]['isLoginUserLike'] = true;
    				}else{
    					$data[$key]['isLoginUserLike'] = false;
    				}
    			}
    			$this->responseJson(['isUserJoin'=>$userModel,'list'=>$data]);
    		}else{
    			$this->responseJson();
    		}
    	}
    	
    }

    /**
     * 25：取得点赞用户列表
     */
    public function getFavourList(){
    	$model = M('community_comments t1');
    	$activeId = $this->getVar('activeId');
    	$activeType = $this->getVar('activeType');
    	if (empty($activeId)){
    		$this->responseFailMessage('动态id不能为空');
    	}
    	if ($activeType=='group'){
    		$info = $model->field(" t2.nickname,t2.id ")->join("left join yw_user t2 on t1.user_id = t2.id ") ->where(" t1.post_id = $activeId and t1.type = 'like' and class != 1 ")->select();
    	}else{
    		$info = $model->field(" t2.nickname,t2.id ")->join("left join yw_user t2 on t1.user_id = t2.id ") ->where(" t1.post_id = $activeId and t1.type = 'like' and class = 1 ")->select();
    	}
    	if ($info){
			foreach ($info as $key => $val){
				$data[$key]['nickName'] = $val['nickname'];
				$data[$key]['userId'] = $val['id'];
			}
			$this->responseJson($data);
		}else{
			$this->responseJson();
		}
		
        
    }
	/**
	 * 取的圈子详情
	 */
    public function getGroupWIthId(){
    	$groupId = $this->getVar('groupId');
    	$userId = $this->getVar('userId');
    	if (empty($groupId)||empty($userId)){
    		$this->responseFailMessage('圈子ID和用户ID不能为空');
    	}
    	$model = M('community');
    	$userModel = M('community_users')->where(" user_id = $userId and comm_id = $groupId ")->getField('status');
    	if ($userModel=='open'){
    		$userModel = TRUE;
    	}else{
    		$userModel = FALSE;
    	}
    	$list = $model->where(" id = $groupId ")->find();
    	if (!$list){
    		$this->responseFailMessage('没有此圈子');
    	}
    	if (!empty($list['games'])){
	    	$map['id'] = array('in',$list['games']);
	    	$games = M('games')->where($map)->select();
	    	if ($games){
	    		foreach ($games as $key => $val){
	    			$gamesDate[$key]['gameId'] = $val['id'];
	    			$gamesDate[$key]['gameName'] = $val['title'];
	    			$gamesDate[$key]['thumb'] = $val['thumb'];
	    		}
	    	}else{
	    		$gamesDate='';
	    	}
    	}else{
    		$gamesDate = '';
    	}
    	$data = array(
    		'groupId' => $list['id'],
    		'ownerId' => $list['user_id'],
    		'groupName'  => $list['title'],
    		//'bgImage'    => empty($val[games])?'':M('games')->where($sqlWhere)->getField('bgimage'),
    		'address'    => $list['address'],
    		'lng'        => $list['longitude'],
    		'lat'        => $list['latitude'],
    		//'distance'   => getDistance($userInfo['longitude'],$userInfo['latitude'],$val['longitude'],$val['latitude']),
    		'headImg'    => $list['thumb'],
    		'details'    => $list['description'],
    		'views'      => $list['views'],
    		'games'      => $gamesDate,
    		'createTime' => $list['add_time'],
    		'isUserJoin '=> $userModel,
			'userId' => $list['user_id']
    	);
    	$this->responseJson($data);
    }
    /**
     * 26：取得评论列表
     * @return 返回文章id获取的评论json
     */
    public function getCommentList(){
    	$model = M('community_comments t1');
    	$activeId = $this->getVar('activeId');
    	$activeType = $this->getVar('activeType');
    	if (empty($activeId)){
    		$this->responseFailMessage('动态id不能为空');
    	}
    	if ($activeType=='group'){
    		$data = $model->field(" t1.id,t2.nickname,t2.avatar,t1.content,t1.add_time,t1.parent,t1.replay_id,t2.id userid ")->join('left join yw_user t2 on t1.user_id = t2.id')->where("t1.post_id = $activeId and t1.type = 'reply' and t1.class != 1")->order(" t1.add_time ")->select();
    	}else{
    		$data = $model->field(" t1.id,t2.nickname,t2.avatar,t1.content,t1.add_time,t1.parent,t1.replay_id,t2.id userid ")->join('left join yw_user t2 on t1.user_id = t2.id')->where("t1.post_id = $activeId and t1.type = 'reply' and t1.class = 1")->order(" t1.add_time ")->select();
    	}
    	if (!$data){
    		$this->responseFailMessage('无评论');
    	}
    	foreach ($data as $key => $val){
    		if (empty($val['parent'])){
    			$info[$val['id']] = array(
    					'commentId'  => $val['id'],
    					'nickName'   => $val['nickname'],
    					'headImg'    => $val['avatar'],
    					'content'    => $val['content'],
    					'addTime'    => $val['add_time'],
    					'replies'    =>[]
    			);
    		}
    	}
    	
		foreach ($data as $key => $val ){
			if (!empty($val['parent'])){
				foreach ($data as $value){
					if ($value['id'] == $val['parent']){
						
						if (!empty($val['replay_id'])){
							foreach ($data as $valRel){
								if ($val['replay_id']==$valRel['id']){
									$otherNickname  =  $valRel['nickname'];
								}
							}
						}
						
						$info[$val['parent']]['replies'][] = array(
							'commentId' => $val['id'],
							'replyId'   => $val['replay_id'],
							'userId'    => $val['userid'],
							'nickName'  => $val['nickname'],
							'content'   => $val['content'],
							'replyTime' => $val['add_time'],
							'otheUserName' => $otherNickname,
						);
						if (isset($otherNickname)){
							unset($otherNickname);
						}
					}
				}
			}
		}
	$info = array_values($info);
        $this->responseJson($info);
    }

    /**
     * 27：发表评论
     * @param $type string 默认community （圈子评论）
     * @return 返回bool true 发表成功 || false 发表失败
     */
    public function sendComment($activeType = ''){
    	$activeId = $this->getVar('activeId');
    	$userId = $this->getVar('userId');
    	$commentContent = $this->getVar('commentContent');
    	if ($activeType == 'group'){
    		if (empty($activeId) || empty($userId) || empty($commentContent)){
    			$this->responseFailMessage('所有参数都不能为空');
    		}
    		$model = M('community_comments');
    		$return = $model -> add(array(
    			'post_id'   => $activeId,
    			'content'   => $commentContent,
    			'type'      => 'reply',
    			'user_id'   => $userId,
    			'add_time'  => date('Y-m-d H:i:s'),
    			'class'     => 0
    		));
    		if($return){
    			$map['comments'] = array('exp','comments+1');
    			M('community_post')->where("id = $activeId")->save($map);
    			$commId =M('community_post')->where("id = $activeId")->getField('comm_id');
    			if (empty($commId)){
    				$this->responseFailMessage('该动态不存在');
    			}
    			M('community')->where(" id = $commId ")->save($map);
    			$this->responseJson(true);
    		}else{
    			$this->responseFailMessage('添加失败');
    		}
    	}else{
    		//全局动态评论
    		if (empty($activeId) || empty($userId) || empty($commentContent)){
    			$this->responseFailMessage('所有参数都不能为空');
    		}
    		if (!M('myspace')->where("id = $activeId")->find()){
    			$this->responseFailMessage('没有该全局动态');
    		}
    		$model = M('community_comments');
    		$return = $model -> add(array(
    				'post_id'   => $activeId,
    				'content'   => $commentContent,
    				'type'      => 'reply',
    				'user_id'   => $userId,
    				'add_time'  => date('Y-m-d H:i:s'),
    				'class'     => 1
    		));
    		
    		if($return){
    			$map['comments'] = array('exp','comments+1');
    			M('myspace')->where("id = $activeId")->save($map);
//     			$commId =M('myspace')->where("id = $activeId")->getField('comm_id');
//     			if (empty($commId)){
//     				$this->responseFailMessage('该动态不存在');
//     			}
//     			M('community')->where(" id = $commId ")->save($map);
    			$this->responseJson(true);
    		}else{
    			$this->responseFailMessage('添加失败');
    		}
    	}
    }

    /**
     * 28：回复评论
     * @param $type string 默认community （圈子评论）
     * @return 返回bool true 发表成功 || false 发表失败
     */
    public function replyComment($type = 'community'){
    	$commentId = $this->getVar('commentId');
    	$userId = $this->getVar('userId');
    	$replayId = $this->getVar('replayId');
    	$replyContent = $this->getVar('replyContent');
    	if ($type == 'community'){
    		if (empty($commentId) || empty($userId) || empty($replyContent)){
    			$this->responseFailMessage('所有参数都不能为空');
    		}
    		$model = M('community_comments');
    		$postId = $model->where(" id = $commentId ")->getField('post_id');
    		$class = $model->where(" id = $commentId ")->getField('class');
    		if(empty($postId)){
    			$this->responseFailMessage('没有该评论为commentId');
    		}
    		$return = $model -> add(array(
    				'post_id'   => $postId,
    				'content'   => $replyContent,
    				'type'      => 'reply',
    				'user_id'   => $userId,
    				'parent'    => $commentId,
    				'replay_id' => $replayId,
    				'class'     => $class,
    				'add_time'  => date('Y-m-d H:i:s'),
    		));
    		
    		if($return){
    			$map['comments'] = array('exp','comments+1');
    			if ($class!=1){
    				$postModel = M('community_post');
    				$postModel->where(" id = $postId ") ->save($map);
    				$comId = $postModel->where(" id = $postId ")->getField('comm_id');
    				M('community')->where(" id = $comId ")->save($map);
    			}else{
    				M('myspace')->where("id = $postId")->save($map);
    			}
    			$this->responseJson(true);
    		}else{
    			$this->responseFailMessage('添加失败');
    		}
    	}else{
    		//预留
    	}
    }

    /**
     * 29：点赞
     */
    public function addFavour(){
    	$id = $this->getVar('activeId');
    	$userId = $this->getVar('userId');
    	$activeType = $this->getVar('activeType');
    	if (empty($id) || empty($userId)){
    		$this->responseFailMessage('缺少参数');
    	}
    	if ($activeType == 'group'){
    		if (M('community_comments')->where(" post_id = $id and type='like' and user_id = $userId and class != 1 ")->find()){
    			$this->responseFailMessage('不能重复点赞');
    		}
    		
    		$model = M('community_post');
    		$map['likes'] = array('exp','likes+1');
    		if ($model->where(" id = $id ")->save($map)!==false){
    			$comModel = M('community');
    			$model = M('community_comments');
    			$model->add(array('post_id'=>$id,'type'=>'like','user_id'=>$userId,'add_time'=>date('Y-m-d H:i:s'),'class'=>0));
    			$this->responseSuccessMessage("点赞成功");
    		}else{
    			$this->responseFailMessage('点赞失败');
    		}
    	}else{
    		if (M('community_comments')->where(" post_id = $id and type='like' and user_id = $userId and class = 1 ")->find()){
    			$this->responseFailMessage('不能重复点赞');
    		}
    		 
    		$model = M('myspace');
    		$map['likes'] = array('exp','likes+1');
    		if ($model->where(" id = $id ")->save($map)!==false){
    			$model = M('community_comments');
    			$model->add(array('post_id'=>$id,'type'=>'like','user_id'=>$userId,'add_time'=>date('Y-m-d H:i:s'),'class'=>1));
    			$this->responseSuccessMessage("点赞成功");
    		}else{
    			$this->responseFailMessage('点赞失败');
    		}
    	}
    	
    }

    /**
     * 30：取消赞
     */
    public function delFavour(){
    	$id = $this->getVar('activeId');
    	$userId = $this->getVar('userId');
    	$activeType = $this->getVar('activeType');
    	if (empty($id) || empty($userId)){
    		$this->responseFailMessage('缺少参数');
    	}
    	
    	if ($activeType=='group'){
    		if (!M('community_comments')->where(" post_id = $id and user_id = $userId and class != 1 ")->find()){
    			$this->responseFailMessage('没有点赞无法取消');
    		}
    		$model = M('community_post');
    		$map['likes'] = array('exp','likes-1');
    		if ($model->where(" id = $id ")->save($map)){
    			M('community_comments')->where(" post_id = $id and type = 'like' and  user_id = $userId and class != 1 ")->delete();
    			$this->responseSuccessMessage("取消操作成功");
    		}else{
    			$this->responseFailMessage('取消操作失败');
    		}
    	}else{
    		if (!M('community_comments')->where(" post_id = $id and user_id = $userId and class = 1 ")->find()){
    			$this->responseFailMessage('没有点赞无法取消');
    		}
    		$model = M('myspace');
    		$map['likes'] = array('exp','likes-1');
    		if ($model->where(" id = $id ")->save($map)){
    			M('community_comments')->where(" post_id = $id and type = 'like' and user_id = $userId and class = 1 ")->delete();
    			$this->responseSuccessMessage("取消操作成功");
    		}else{
    			$this->responseFailMessage('取消操作失败');
    		}
    	}
    	
       
    }

    /**
     * 31：加入圈子，加入圈子后可以在这个圈子里发表动态
     */
    public function joinGroup(){
    	$groupId = $this->getVar('groupId');
    	$userId = $this->getVar('userId');
    	if (empty($groupId) || empty($userId)){
    		$this->responseFailMessage('所有参数不能为空');
    	}
    	$group = M('community')->where(" id = $groupId  ")->find();
    	if (!$group){
    		$this->responseFailMessage('无法加入，没有此圈子');
    	}
    	if ($group['status'] == 'close'){
    		$this->responseFailMessage('无法加入，圈子已被关闭');
    	}
    	$model = M('community_users');
    	if ($model ->where(" user_id = $userId and comm_id = $groupId ")->find()){
    		$this->responseFailMessage('用户已在圈子中，无法重复加入');
    	}
    	$return = M('community_users')->add(array(
    		'user_id'  => $userId,
    		'status'   => 'open',
    		'add_time' => date('Y-m-d H:i:s'),
    		'comm_id'  => $groupId
    	));
    	if ($return){
    		$this->responseSuccessMessage("加入圈子成功");
    	}else{
    		$this->responseFailMessage('加入圈子失败');
    	}
        
    }

    /**
     * 32：退出圈子，退出圈子后，不能在圈子里发动态
     */
    public function exitGroup(){
    	$groupId = $this->getVar('groupId');
    	$userId = $this->getVar('userId');
    	if (empty($groupId) || empty($userId)){
    		$this->responseFailMessage('所有参数为必填项');
    	}
    	$group = M('community')->where(" id = $groupId  ")->find();
    	if (!$group){
    		$this->responseFailMessage('圈子ID错误');
    	}
    	$model = M('community_users');
    	if (!$model ->where(" user_id = $userId and comm_id = $groupId ")->find()){
    		$this->responseFailMessage('该用户不在此圈子');
    	}
    	if ($model ->where(" user_id = $userId and comm_id = $groupId ")->delete()){
    		$this->responseJson('已成功退出圈子');
    	}else{
    		$this->responseFailMessage('退出失败');
    	}
    }

    /**
     * 33：解散圈子，圈子创建人可以解散圈子，解散后圈子删除
     */
    public function dissolveGroup(){
    	$userId = $this->getVar('userId');
    	$groupId = $this->getVar('groupId');
    	if (empty($userId) || empty($groupId)){
    		$this->responseFailMessage('所有参数不能为空');
    	}
    	$model = M('community');
    	$user = $model->where(" id = $groupId ")->getField('user_id');
    	if ($user == $userId){
    		$model = M('community');
    		if($model->where(" id = $groupId ")->delete()){
    			//删除所有圈子用户和所有文章
    			M('community_users')->where(" comm_id = $groupId ")->delete();
    			M('community_post')->where(" comm_id = $groupId ")->delete();
    			$this->responseJson('解散成功');
    		}else{
    			$this->responseFailMessage('解散失败');
    		}
    	}else{
    		$this->responseFailMessage('用户id与圈子创建者id不一致，解散失败');
    	}
    }

    /**
     * 34：更新圈子，只有圈主可以更新圈子
     */
    public function updateGroup(){
    	$groupId = $this->getVar('groupId');
    	$userId = $this->getVar('userId');
    	if (empty($groupId) || empty($userId)){
    		$this->responseFailMessage('圈子ID和用户ID不能为空');
    	}
    	$data = array(
    		'longitude' => $this->getVar('lng'),
    		'latitude' => $this->getVar('lat'),
    		'thumb' => $this->getVar('head'),
    		'games' => $this->getVar('gameIds'),
    		'title' => $this->getVar('groupName'),
    		'description' => $this->getVar('slogan'),
    	);
    	$model = M('community');
    	$user = $model->where(" id = $groupId ")->getField('user_id');
    	if ($user == $userId){
    		if ($model->where(" id = $groupId ")->save($data)!==false){
    			$this->responseJson('更新成功');
    		}else{
    			$this->responseFailMessage('更新失败');
    		}
    	}else{
    		$this->responseFailMessage('圈子id与用户id不一致');
    	}
        $this->responseFailMessage("更新圈子失败：这里是失败原因");
    }

    /**
     * 35：取得全局动态列表，（圈子只能看圈子里的动态， 全局动态是发布到全局动态界面的动态）
     * 动态id、 发布人头像、发布人名称、发布时间、内容、图片地址数组、评论数、赞数、是否置顶（服务端发布的动态始终置顶）
     */
    public function getActiveList()
    {
    	$model = M('myspace t1');
    	$likeModel = M('community_comments');
    	$pageNo = is_null($this->getVar('pageNo'))?1:$this->getVar('pageNo');
    	$pageSize = is_null($this->getVar('pageSize'))?10:$this->getVar('pageSize');
    	$userId = $this->getVar('userId');
    	if (empty($userId) || is_null($userId)){
    		
    		$data = $model->field(" t1.id,t1.add_time,t1.content,t1.images,t1.comments,t1.likes,t1.stick,t1.address,t2.id userid,t2.nickname,t2.avatar ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->where(" t1.type = 'normal' ")->page($pageNo,$pageSize)->order("t1.add_time desc")->select();
    		if ($data){
    			foreach ($data as $key => $val){
    				$actId = $val['id'];
    				$info[$key]['activeId'] = $val['id'];
    				$info[$key]['createTime'] = $val['add_time'];
    				$info[$key]['nickName'] = $val['nickname'];
    				$info[$key]['userId'] = $val['userid'];
    				$info[$key]['content'] = $val['content'];
    				$info[$key]['headImg'] = $val['avatar'];
    				$info[$key]['comments'] = $val['comments'];
    				$info[$key]['likes'] = $val['likes'];
    				$info[$key]['images'] = $val['images'];
    				$info[$key]['sticky'] = $val['stick'];
    				$info[$key]['address'] = $val['address'];
    				$replyData = $likeModel->field(" yw_community_comments.*,yw_user.nickname,yw_user.avatar ")->join("left join yw_user on yw_community_comments.user_id = yw_user.id")->where(" yw_community_comments.post_id = $actId and yw_community_comments.type='reply' and yw_community_comments.class = 1 ")->order("yw_community_comments.add_time desc")->limit(0,2)->select();
    				foreach ($replyData as $vlaue){
    					$info[$key]['lastComment'][] = [
    							'commentId' => $vlaue['id'],
    							'nickName'  => $vlaue['nickname'],
    							'headImg'   => $vlaue['avatar'],
    							'content'   => $vlaue['content'],
    							'addTime'   => $vlaue['add_time'],
    					];
    				}
//     				if ($likeModel->where(" post_id = $actId and user_id = $userId and type='like' and class=1 ")->getField('id')){
//     					$info[$key]['isLoginUserLike'] = true;
//     				}else{
//     					$info[$key]['isLoginUserLike'] = false;
//     				}
    					
    			}
    			$this->responseJson($info);
    		}else{
    			$this->responseFailMessage('无数据');
    		}
    		
    	}else{
    		$data = $model->field(" t1.address,t1.id,t1.add_time,t1.content,t1.images,t1.comments,t1.likes,t1.stick,t2.id userid,t2.nickname,t2.avatar ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->where(" t1.type = 'normal' ")->page($pageNo,$pageSize)->order("t1.add_time desc")->select();
    		if ($data){
    			foreach ($data as $key => $val){
    				$actId = $val['id'];
    				$info[$key]['activeId'] = $val['id'];
    				$info[$key]['createTime'] = $val['add_time'];
    				$info[$key]['nickName'] = $val['nickname'];
    				$info[$key]['userId'] = $val['userid'];
    				$info[$key]['content'] = $val['content'];
    				$info[$key]['headImg'] = $val['avatar'];
    				$info[$key]['comments'] = $val['comments'];
    				$info[$key]['likes'] = $val['likes'];
    				$info[$key]['images'] = $val['images'];
    				$info[$key]['sticky'] = $val['stick'];
    				$info[$key]['address'] = $val['address'];
    				$replyData = $likeModel->field(" yw_community_comments.*,yw_user.nickname,yw_user.avatar ")->join("left join yw_user on yw_community_comments.user_id = yw_user.id")->where(" yw_community_comments.post_id = $actId and yw_community_comments.type='reply' and yw_community_comments.class = 1 ")->order("yw_community_comments.add_time desc")->limit(0,2)->select();
    				foreach ($replyData as $vlaue){
    					$info[$key]['lastComment'][] = [
    							'commentId' => $vlaue['id'],
    							'nickName'  => $vlaue['nickname'],
    							'headImg'   => $vlaue['avatar'],
    							'content'   => $vlaue['content'],
    							'addTime'   => $vlaue['add_time'],
    					];
    				}
    				if ($likeModel->where(" post_id = $actId and user_id = $userId and type='like' and class=1 ")->getField('id')){
    					$info[$key]['isLoginUserLike'] = true;
    				}else{
    					$info[$key]['isLoginUserLike'] = false;
    				}
    					
    			}
    			$this->responseJson($info);
    		}else{
    			$this->responseFailMessage('无数据');
    		}
    	}

    }

    /**
     * 36：取得用户自己发布的动态
     * @param $type string 默认community （圈子评论）
     * @return 成功返回数据 || 失败返回失败原因
     */
    public function getActiveWithUser(){
    	$userId = $this->getVar('userId');
    	$pageNo = $this->getVar('pageNo');
    	$pageSize = $this->getVar('pageSize');
    	$type = $this->getVar('activeType');
    	if (empty($userId)){
    		$this->responseFailMessage('用户id不能为空');
    	}
    	//if ($type=='group'){
    		$userInfo = M('user')->where(" id = $userId ")->find();
    		if (!$userInfo){
    			$this->responseFailMessage('未找到该用户');
    		}
    		$model = M('community_post t1');
			$list = $model->field("t1.id,t1.images,t1.add_time,t1.content,t1.comments,t1.likes,t2.title")->join(" left join yw_community t2 on t1.comm_id = t2.id ")->where(" t1.user_id = $userId ")->page($pageNo,$pageSize)->select();
    		if ($list){
    			foreach ($list as $key => $val){
    				$data[$key] = array(
    					'activeId'   => $val['id'],
    					'headImg'    => $userInfo['avatar'],
    					'nickName'   => $userInfo['nickname'],
    					'createTime' => $val['add_time'],
    					'content'    => $val['content'],
    					'images'     => $val['images'],
    					'comments'   => $val['comments'],
    					'likes'      => $val['likes'],
    					'source'     => $val['title'],
    				);
    				
    			}
    			//$this->responseJson($data);
    		}else{
				//$this->responseFailMessage('没有数据');    			
    		}
    //	}else{
    		$model = M('myspace t1');
    		$myData = $model->field(" t1.id,t1.add_time,t1.content,t1.images,t1.comments,t1.likes,t1.stick,t2.id userid,t2.nickname,t2.avatar ")->join(" left join yw_user t2 on t1.user_id = t2.id ")->where(" t1.user_id = $userId and t1.type ='normal'  ")->page($pageNo,$pageSize)->order("t1.add_time desc")->select();
    		if ($myData){
    			foreach ($myData as $key => $val){
    				$info[$key]['activeId'] = $val['id'];
    				$info[$key]['createTime'] = $val['add_time'];
    				$info[$key]['nickName'] = $val['nickname'];
    				$info[$key]['content'] = $val['content'];
    				$info[$key]['headImg'] = $val['avatar'];
    				$info[$key]['comments'] = $val['comments'];
    				$info[$key]['likes'] = $val['likes'];
    				$info[$key]['images'] = $val['images'];
    				$info[$key]['source'] = '全局动态';
    				//$info[$key]['sticky'] = $val['stick'];
    			}
    			$info = array_merge($data,$info);
    			$info = array_msort($info,'createTime','SORT_DESC');
    			$this->responseJson($info);
    		}else{
    			$this->responseFailMessage('无数据');
    		}
    	//}
    }

    /**
     * 37：删除自己发的动态
     */
    public function delActive(){
    	$activeId = $this->getVar('activeId');
    	$userId = $this->getVar('userId');
    	$type = $this->getVar('activeType');
    	if (empty($userId) || empty($activeId)){
    		$this->responseFailMessage('所有参数不能为空');
    	}
    	if ($type=='group'){
    		$model = D('community_post');
    		$return = $model->where(" user_id = $userId and id = $activeId ")->delete();
    		if ($return){
    			$this->responseJson('删除成功');
    		}else{
    			$this->responseFailMessage('删除失败');
    		}
    	}else{
    		$model = D('myspace');
    		$return = $model->where(" user_id = $userId and id = $activeId ")->delete();
    		if ($return){
    			$this->responseJson('删除成功');
    		}else{
    			$this->responseFailMessage('删除失败');
    		}
    	}
    	
    	

    }

    /**
     * 38：发布动态
     */
    public function sendActive(){
   
		$userId = $this->getVar('userId');
		if (empty($userId) || (!is_numeric($userId)||strpos($userId,".")!==false)){
			$this->responseFailMessage('用户id不能为空切必须为整数');
		}
		$content = $this->getVar('content');
		if (empty($content)){
			$this->responseFailMessage('消息内容不能为空');
		}
		$imgs = trim($this->getVar('imgs'),',');
		$sendTime = $this->getVar('sendTime');
		if (strtotime($sendTime)===false || strtotime($sendTime)==-1){
			$this->responseFailMessage('时间格式不正确');
		}
		$groupid = $this->getVar('groupId');
		$data = array(
			'user_id'  => $userId,
			'content'  => $content,
			'images'   => $imgs,
			'add_time' => $sendTime, 
			'address'  => $this->getVar('address'),
		);
		if (empty($groupid)){
			$model = D('myspace');
			$data['type'] = 'normal';
			if ($model->add($data)){
				$this->responseJson();
			}else{
				$this->responseFailMessage('发布失败');
			}
		}else{
			if ((!is_numeric($groupid)||strpos($groupid,".")!==false)){
				$this->responseFailMessage('groupid必须为整数');
			}else{
				$data['source'] = $groupid;
				$data['comm_id'] = $groupid;
				$data['enabled'] = 'enabled';
				$model = D('community_post');
				if ($model->add($data)){
					$this->responseJson(true);
				}else{
					$this->responseFailMessage('发布失败');
				}
			}
		}
    }
	/**
	 * 更新用户位置， 用于附近好友查找时查询附近用户。
	 * APP每次启动，调用此接口更新用户位置。为附近好友查询时提供数据
	 */
    public function updateUserGPS(){
    	$lng = $this->getVar('lng');
    	$lat = $this->getVar('lat');
    	$userId = $this->getVar('userId');
    	//$address = $this->getVar('address');
    	$updateTime = $this->getVar('updateTime');
    	if (empty($userId) || empty($updateTime) || empty($address)){
    		$this->responseFailMessage('用户id,更新时间和地址不能为空');
    	}
    	$model = M('user');
    	$return = $model->where(" id =$userId ")->save(array(
    		'longitude' => $lng,
    		'latitude'  => $lat,
    		'last_time' => $updateTime,
    		//'address'   => $address 
    	));
    	if ($return){
    		$this->responseJson('更新成功');
    	}else{
    		$this->responseFailMessage('更新失败');
    	}
    }
    /**
     * 发送好友申请
     */
	public function sendUpAddFrind(){
		$userId = $this->getVar('userId');
		$friendId = $this->getVar('friendId');
		$sendUpMsg = $this->getVar('sendUpMsg');
		if (empty($userId) || empty($friendId)){
			$this->responseFailMessage('用户id和好友id不能为空');
		}
		$model = M('user');
		$returnUser = $model->where("id = $userId")->find();
		$returnUserFind = $model->where(" id = $friendId ")->find();
		if ($returnUser && $returnUserFind){
		}else{
			$this->responseFailMessage('用户不存在');			
		}
		$model = M('messages');
		if ($model ->where(" user_id = $friendId and from_user = $userId and status <> 'reject' ")->find()){
			$this->responseFailMessage('已发送过好友验证或已成为好友');
		}
		$return = $model->add(array(
			'user_id'   => $friendId,
			'message'   => $sendUpMsg,
			'type'      => 'join',
			'status'    => 'pedding',
			'do_action' => 0,
			'add_time'  => date('Y-m-d H:i:s'),
			'from_user' => $userId,
		));
		if ($return){
			$this->responseJson('发送成功');
		}else{
			$this->responseFailMessage('发送失败');
		}
	}
	/**
	 * 多个电话号码查找多个用户
	 * @return 用户信息
	 */
	public function getUsersWithPhoneArray(){
		$phones = trim($this->getVar('phones'),',');
		if (empty($phones)){
			$this->responseFailMessage('电话号码不能为空');
		}
		$model = M('user');
		$list = $model ->field("id,avatar,nickname,profile") ->where(" tel in ($phones) ")->select();
		if ($list){
			foreach ($list as $key => $val){
				$data[$key] = array(
					'userId'  => $val['id'],
					'headImg' => $val['avatar'],
					'nickName'=> $val['nickname'],
					'slogan'  => $val['profile'],
				);
			}
			$this->responseJson($data);
		}else{
			$this->responseFailMessage('没有匹配用户');
		}
	}
	
	/**
	 * 登录用户的经纬度，查询附近用户
	 */
	public function getUsersWithGps(){
		$userId = $this->getVar('userId');
		$lng = $this->getVar('lng');
		$lat = $this->getVar('lat');
		$model = M('user');
		if (empty($userId)){
			$this->responseFailMessage('id不能为空');
		}
		$squares = returnSquarePoint($lng, $lat);
		$userInfo = $model->field("id,avatar,nickname,profile")->where(" id <> $userId and user_type = 'player' and latitude<>0 and latitude>{$squares['right-bottom']['lat']} and latitude<{$squares['left-top']['lat']} and longitude<{$squares['left-top']['lng']} and longitude>{$squares['right-bottom']['lng']} ")->select();
		if ($userInfo){
			foreach ($userInfo as $key => $val){
				$data[$key] = array(
						'userId'  => $val['id'],
						'headImg' => $val['avatar'],
						'nickName'=> $val['nickname'],
						'sloan'   => $val['profile'],
				);
			}
			$this->responseJson($data);
		}else{
			$this->responseFailMessage('没有匹配用户');
		}
	}
    /**
     * 44：按用户id查询用户的所有好友
     */
    public function getFriendsWithUserId(){
    	$userId = $this->getVar('userId');
    	$model = M('messages');
    	$userInfo = $model->field('user_id,from_user')->where(" status = 'accept' and (user_id = $userId or from_user = $userId) ")->select();
    	if (!$userInfo){
    		$this->responseFailMessage('没有好友信息');
    	}
    	$info = '';
		foreach ($userInfo as $key => $val){
			if ($val['user_id'] == $userId){
				$info .= $val['from_user'].',';
			}else{
				$info .= $val['user_id'].',';
			}
		}
		$info = trim($info,',');
    	$userData = M('user t1')->join("left join yw_user_player t2 on t2.user_id = t1.id")->field("t1.id,t1.avatar,t1.nickname,t1.profile,t2.pk_score") -> where("t1.id in ($info) ")->select();
    	if (!$userData){
    		$this->responseFailMessage('没有好友信息');
    	}
    	foreach ($userData as $key => $val){
    		$data[$key] = array(
    			'id'      => $val['id'],
    			'headImg' => $val['avatar'],
    			'nickName'=> $val['nickname'],
    			'slogan'  => $val['profile'],
    			'score'   => $val['pk_score'],
    		);
    	}
        $this->responseJson($data);
    }
	/**
	 * getGameList
	 * 分页取得所有游戏列表
	 */
	public function getGameList(){
		$pageNo = is_null($this->getVar('pageNo'))?1:$this->getVar('pageNo');
		$keywords = $this->getVar('keywords');
		$pageSize = is_null($this->getVar('pageSize'))?20:$this->getVar('pageSize');
		$model = D('games');
		$data = $model ->getGameList($keywords,$pageNo,$pageSize);
		if ($data){
			foreach ($data as $key => $val){
				$info[$key]['gameId'] = $val['id'];
				$info[$key]['name'] = $val['title'];
				$info[$key]['thumb'] = $val['thumb'];
				$info[$key]['maxPeopleNumber'] = $val['player_max'];
				$info[$key]['times'] = $val['times'];
				$info[$key]['wagerMax'] = $val['prize_max'];
				$info[$key]['wagerMin'] = $val['prize_min'];
			}
			$this->responseJson($info);
		}else{
			$this->responseFailMessage('无数据');
		}
	}
	/**
	 * 获取七牛云接口
	 */
	
	public function getUploadToken(){
		require './ThinkPHP/Library/Org/Qiniuyun/autoload.php';
		$accessKey = C('accessKey');
		$secretKey = C('secretKey');
 		$auth = new \Qiniu\auth($accessKey,$secretKey);
		$bucket = C('bucket');
		// 生成上传Token
		$token = $auth->uploadToken($bucket);
		if ($token){
			$this->responseJson(array('token'=>$token));
		}else{
			$this->responseFailMessage('获取token失败');
		}
	}
	
	/**
	 * getPayInfoList 
	 * 获取所有订单
	 * 返回money,add_time,pay_type,type四个字段数据
	 * 或者返回错误信息
	 */
	
	public function getPayInfoList(){
		$userId = $this->getVar('userId');
		if (empty($userId)){
			$this->responseFailMessage('缺少用户id');
		}
		$model = M('money');
		$data = $model->field('money,add_time,pay_type,type')->where(" user_id = $userId  ")->select();
		if($data){
			foreach ($data as $key=>$val){
				$info[$key]['money'] = $val['money'];
				$info[$key]['createTime'] = $val['add_time'];
				$info[$key]['payType'] = $val['pay_type'];
				$info[$key]['moneyType'] = $val['type'];
			}
			$this->responseJson($info);
		}else{
			$this->responseFailMessage('用户无账单');
		}
	}
	
	/**
	 *  获取用户余额
	 *  接受参数
	 *  userId 用户ID userType 用户类型（默认）
	 *  @return Y用户余额
	 */
	public function getUserBalance(){
		$userId = $this->getVar('userId');
		$userType = is_null($this->getVar('userType'))?'player':$this->getVar('userType');
		if ($userType=='player'){
			$model = M('user_player');
			$data = $model->field('balance,pk_score')->where("user_id = $userId")->find();
		}else{
			$model = M('user_netbar');
			$data = $model->field('balance,pk_score')->where("user_id = $userId")->find();
		}
		if ($data){
			$info = array(
				'payMoney' => $data['balance'],
				'score'    => $data['pk_score'],
			);
			$this->responseJson($info);
		}else{
			$this->responseFailMessage('查询失败');
		}
	}
	/**
	 * ++
	 * 取得附近广告，按网吧距离降序排列
	 * 如果附近2公里内没有比赛广告，则逐级扩大查询， 2公里-->5公里-->10公里， 最大10公里
	 */
	public function getADListWithGPS(){
		$lng = $this->getVar('lng');
		$lat = $this->getVar('lat');
		$model = M('slider t1');
		$squares = returnSquarePoint($lng, $lat, 2);
		$list = $model
		->field(" t1.title,t1.content,t1.images,t1.add_time,t2.game_id,t2.id war_id,t3.title game_title,t4.address,t5.title netbar_name,t5.user_id not_id  ")
		->join(" left join yw_war t2 on t1.fk = t2.id ")
		->join(" left join yw_games t3 on t2.game_id = t3.id ")
		->join(" left join yw_user t4 on t2.netbar_id = t4.id ")
		->join(" left join yw_user_netbar t5 on t4.id = t5.user_id ")
		->where(" t1.type = 'home' and t4.latitude<>0 and t4.latitude>{$squares['right-bottom']['lat']} and t4.latitude<{$squares['left-top']['lat']} and t4.longitude>{$squares['left-top']['lng']} and t4.longitude<{$squares['right-bottom']['lng']} ")
		->select();

		//echo $model->getLastSql();
		//exit;

		if (!$list){
			$squares = returnSquarePoint($lng, $lat,5);
			$list = $model
			->field(" t1.title,t1.content,t1.images,t1.add_time,t2.game_id,t2.id war_id,t3.title game_title,t4.address,t5.title netbar_name,t5.user_id not_id  ")
			->join(" left join yw_war t2 on t1.fk = t2.id ")
			->join(" left join yw_games t3 on t2.game_id = t3.id ")
			->join(" left join yw_user t4 on t2.netbar_id = t4.id ")
			->join(" left join yw_user_netbar t5 on t4.id = t5.user_id ")
			->where(" t1.type = 'home' and t4.latitude<>0 and t4.latitude>{$squares['right-bottom']['lat']} and t4.latitude<{$squares['left-top']['lat']} and t4.longitude<{$squares['left-top']['lng']} and t4.longitude>{$squares['right-bottom']['lng']} ")
			->select();
			if (!$list){
				$squares = returnSquarePoint($lng, $lat,10);
				$list = $model
				->field(" t1.title,t1.content,t1.images,t1.add_time,t2.game_id,t2.id war_id,t3.title game_title,t4.address,t5.title netbar_name,t5.user_id not_id ")
				->join(" left join yw_war t2 on t1.fk = t2.id ")
				->join(" left join yw_games t3 on t2.game_id = t3.id ")
				->join(" left join yw_user t4 on t2.netbar_id = t4.id ")
				->join(" left join yw_user_netbar t5 on t4.id = t5.user_id ")
				->where(" t1.type = 'home' and t4.latitude<>0 and t4.latitude>{$squares['right-bottom']['lat']} and t4.latitude<{$squares['left-top']['lat']} and t4.longitude<{$squares['left-top']['lng']} and t4.longitude>{$squares['right-bottom']['lng']} ")
				->select();
			}
		}
		if ($list){
			foreach ($list as $key => $val){
				$list[$key] = [
					'title'       => $val['title'],
					'content'     => $val['content'],
					'add_time'    => $val['add_time'],
					'war_id'      => $val['war_id'],
					'game_title'  => $val['game_title'],
					'address'     => $val['address'],
					'netbar_name' => $val['netbar_name'],
					'netbar_id'   => $val['not_id'],
				];
				$imgs = unserialize(base64_decode($val['images']));
				foreach ($imgs as $value){
				$list[$key]['images'][]  = $value;
				}
			}
			$this->responseJson($list);
		}else{
			$this->responseFailMessage('无数据');
		}
		
	}
	/**
	 * ++取得要判输赢的游戏桌id，和赢家id
	 */
	public function getJudgeWinerInfo(){
		$netbarId = $this->getVar('netbarId');
	}

	/**
	 * ++取得全市的比赛广告 (暂不使用)
	 */
	public function __getADList(){
		$model = M('slider t1');
		$city = $this->getVar('city');
		$squares = returnSquarePoint($lng, $lat);
		$list = $model
		->field(" t1.title,t1.content,t1.images,t1.add_time,t2.id war_id,t3.title game_title,t4.address,t5.title netbar_name,t5.user_id not_id")
		->join(" left join yw_war t2 on t1.fk = t2.id ")
		->join(" left join yw_games t3 on t2.game_id = t3.id ")
		->join(" left join yw_user t4 on t2.netbar_id = t4.id ")
		->join(" left join yw_user_netbar t5 on t4.id = t5.user_id ")
		->where(" t1.type = 'act' and t4.address like '%$city%' ")
		->select();
		if ($list){
			foreach ($list as $key => $val){
				$list[$key] = [
						'title'       => $val['title'],
						'content'     => $val['content'],
						'add_time'    => $val['add_time'],
						'war_id'      => $val['war_id'],
						'game_title'  => $val['game_title'],
						'address'     => $val['address'],
						'netbar_name' => $val['netbar_name'],
						'netbar_id'   => $val['not_id'],
				];
				$imgs = unserialize(base64_decode($val['images']));
				foreach ($imgs as $value){
					$list[$key]['images'][]  = $value;
				}
			}
			$this->responseJson($list);
		}else{
			$this->responseFailMessage('无数据');
		}
	}

	/**++
	 * 查询添加好友申请
	 */
	public function getFriendRequest(){
		$userId = $this->getVar('userId');
		$pageNo = $this->getVar('pageNo');
		$pageCount = $this->getVar('pageCount');
		if (empty($userId)){
			$this->responseFailMessage('用户id不能为空');
		}
		$model = M('messages');
		$list = $model ->where(" user_id = $userId or from_user = $userId ")->page($pageNo,$pageCount) ->order(" add_time desc ") ->select();
		if ($list){
			foreach ($list as $key => $val){
				$toUser = $val['user_id'];
				$fromUser = $val['from_user'];//来源用户
				//$id = ($val['user_id']==$userId)?$val['from_user']:$val['user_id'];
				$fromDate = M('user')->field("nickname,avatar")->where(" id = $fromUser ")->find();
				$toData = M('user')->field("nickname,avatar")->where(" id = $toUser ")->find();
				$data[$key]['msgId'] = $val['id'];
				$data[$key]['fromUserId'] = $fromUser;
				$data[$key]['toUserId'] = $toUser;
				$data[$key]['fromNickName'] =$fromDate['nickname'];
				$data[$key]['fromHeadImg'] = $fromDate['avatar'];
				$data[$key]['toNickName'] = $toData['nickname'];
				$data[$key]['toHeadImg'] = $toData['avatar'];
				$data[$key]['sendUpMsg'] = $val['message'];
				$data[$key]['disagreeMsg'] = $val['remark'];
				if ($val['status']=='accept'){
					$data[$key]['agree'] = 1;
				}elseif ($val['status']=='reject'){
					$data[$key]['agree'] = 0;
				}else{
					$data[$key]['agree'] = -1;
				}
				$data[$key]['addTime'] = $val['add_time'];
			}
			$this->responseJson($data);
		}else{
			$this->responseFailMessage('没有好友申请列表');
		}
	}
	/**++
	 * 查询用户签到记录
	 */
	public function getSignInHistory(){
		$userId = $this->getVar('userId');
		if (empty($userId)){
			$this->responseFailMessage('用户id不能为空');
		}
		$model = M('user t1');
		$list = $model->field('check_time')->join(" left join yw_sign t2 on t1.id = t2.user_id ")->where("date_format(t2.check_time,'%Y-%m')=date_format(now(),'%Y-%m') and user_id = $userId")->order(" check_time  ")->select();
		if ($list){
			foreach ($list as $key => $val){
				$data[] = $val['check_time'];
			}
			$this->responseJson($data);
		}else{
			$this->responseFailMessage('暂无签到记录');
		}
	}
	/**
	 * 点击签到
	 */
	public function signIn(){
		$userId = $this->getVar('userId');
		$signInDate = $this->getVar('signInDate');
		if (empty($userId) || empty($signInDate)){
			$this->responseFailMessage('用户id和签到时间不能为空');
		}
		
		$model = M('user');
		$userData = $model->where(" id = $userId ")->find();
		
		$signInDate = date('Y-m-d',strtotime($signInDate));
		$signInDateM = date('m',strtotime($signInDate));
		$signInDateD = date('d',strtotime($signInDate));
		$lastDate = date('Y-m-d',strtotime($userData['check_last_time']));
		$lastDateM = date('m',strtotime($lastDate));
		$lastDateD = date('d',strtotime($lastDate));
		
		if ( $lastDate == $signInDate){
			$this->responseFailMessage('今天已签到');
		}
		if ($lastDate > $signInDate){
			$this->responseFailMessage('无法对最后一次签到之前的时间签到');
		}
		if ($lastDateM==$signInDateM && $signInDateD-$lastDateD==1 ){
			//连续签到
			$map['check_log'] = array('exp','check_log+1');
			$map['check_last_time'] = $signInDate;
			$score = SignInToReward($userData['check_log'] + 1);
			if ($model -> where(" id = $userId ")->save($map)!==false){
				$wap['balance'] = array('exp','balance+'.$score);
				if (M('user_player') -> where( " user_id = $userId " )->save($wap)!==false){
					M('money')->add(array(
							'user_id' => $userId,
							'money' => $score,
							'balance' => M('user_player')->where("user_id = $userId")->getField("balance"),
							'type' => 'sign',
							'pay_status' => 'success',
							'status' => 'done',
							'add_time' => date('Y-m-d H:i:s'),
							'remark' => '签到奖励',
					));
					M('sign')->add(array(
							'check_time' => $signInDate,
							'user_id' => $userId,
					));
					$this->responseJson('签到成功');
				}else{
					$this->responseFailMessage('签到失败');
				}
			}else{
				$this->responseFailMessage('签到失败');
			}
		}else{
			if($model->where(" id = $userId ")->save(array('check_log'=>1,'check_last_time'=>$signInDate,))!==false){
				$score = SignInToReward(1);
				$wap['balance'] = array('exp','balance+'.$score);
				if (M('user_player') -> where( " user_id = $userId " )->save($wap)!==false){
					M('money')->add(array(
						'user_id' => $userId,
						'money' => $score,
						'balance' => M('user_player')->where("user_id = $userId")->getField("balance"),
						'type' => 'sign',
						'pay_status' => 'success',
						'status' => 'done',
						'add_time' => date('Y-m-d H:i:s'),
						'remark' => '签到奖励',
					));
					M('sign')->add(array(
						'check_time' => $signInDate,
						'user_id' => $userId,
					));
					$this->responseJson('签到成功');
				}
			}
		}
	}
	/**
	 * 查询签到奖励
	 */
	public function getSignMoney(){
		$mysql = M('settings');
		$award = $mysql -> where(" `key` = 'signin' ")->getField('value');
		if ($award){
			$award = string2array($award);
			foreach ($award as $key => $val){
				$data[] = [
					'days' => $val['day'],
					'payMoney' => $val['aw'],
				];
			}
			$this->responseJson($data);
		}else{
			$this->responseFailMessage('无奖励数据');
		}
		
		
	}
	/**
	 * 二维码生成
	 */
	public function getQRCodeWithData(){
		$qrString = $this->getVar('qrString');
		//require './ThinkPHP/Library/Org/Qiniuyun/nowapi.php';
//		echo '<img src="http://api.k780.com:88/?app=qr.get&data='.$qrString.'&level=L&size=6">' ;
 		$data = $this->apiCurl($qrString);
 		echo $data;
	}
	public  function apiCurl($qrString){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "http://api.k780.com:88/?app=qr.get&data=$qrString&level=L&size=6");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		//curl_setopt($ch, CURLOPT_BINARYTRANSFER, true) ; // 在启用 CURLOPT_RETURNTRANSFER 时候将获取数据返回
		$output = curl_exec($ch);
		return $output;
	}
	
	/**
	 * 57、处理添加好友申请，同意后，双方互为好友，并把好友申请状态更改成对方同意添加好友。
	 *	不同意，则将好友申请状态更改成对方不同意添加好友
	 */
	public function agreeFriend(){
		$userId = $this->getVar('userId');
		$friendId = $this->getVar('friendId');
		$agree = $this->getVar('agree');
		$disagreeMsg = $this->getVar('disagreeMsg');
		if ($agree==1){
			$agree = 'accept';
		}else{
			$agree = 'reject';
		}
		
		if (empty($userId) || empty($friendId) || empty($agree)){
			$this->responseFailMessage('用户ID，好友ID，状态不能为空');
		}
		$model = M('messages');
		$list = $model->where(" (user_id = $userId and from_user = $friendId and type = 'join' and status = 'pedding') or (user_id = $friendId and from_user = $userId and type = 'join' and status = 'pedding') ")
		->save(array('status'=>$agree,'remark'=>$disagreeMsg));
		if ($list){
			$this->responseJson(true);
		}else{
			$this->responseFailMessage('未找到该好友申请');
		}
		
	}
	
	/**
	 * 取得虚拟币兑换商品列表
	 *
	 */
	public function getExchangeGoods(){
		$model = M('goods');
		$data = $model->field(" id,image,title,summary,payMoney,price,sales,add_time ") ->order(" add_time desc ")->select();
		foreach ($data as $key=>$val){
			$data[$key]['goodsId'] = $val['id'];
			unset($data[$key]['id']);
		}
		
		$this->responseJson($data);
	}
	
	/**
	 * 获取商品
	 * goodsId:””  //商品id  
       images:[“http://xxxx.jpg”,”http://xxxx.jpg”,”http://xxxx.jpg”  ]    //多张商品图片url，第一张是封面图
       title:””   //商品标题
       summary:””   //商品简介
       payMoney:””   //虚拟币
       price:””      //原价
       sales:””   //销量 
       details:””   //商品图文详情，后台使用富文本框编辑的html存储在数据库，details 中是html标记组成的图文详情介绍
       cdkey:””   //商品兑换码
       url:””    //商品兑换网址

	 */
	public function getGoodsDetail(){
		$model = M('goods');
		$data = $model->field(" id,image,title,summary,payMoney,price,sales,details,url,images,add_time ") ->order(" add_time desc ")->select();
		foreach ($data as $key=>$val){
			$data[$key]['goodsId'] = $val['id'];
			$data[$key]['images'] = explode(',',$data[$key]['images']);
			array_unshift($data[$key]['images'],$data[$key]['image']);
			unset($data[$key]['id']);
			unset($data[$key]['image']);
		}
		
		$this->responseJson($data);
	}
	/**
	 * 虚拟币购买 商品
	 */
	public function exchangeGoods(){
		$userId = $this->getVar('userId');
		$goodsId = $this->getVar('goodsId');
		if (empty($userId) || empty($goodsId)){
			$this->responseFailMessage('用户id商品id不能为空');
		}
		$userBan = M('user_player')->where(" user_id = $userId ")->getField('balance');
		$goodPrice = M('goods')->where(" id = $goodsId ")->getField('payMoney');
		$goodNum = M('goods')->where(" id = $goodsId ")->getField('num');
		if ($goodNum<1){
			$this->responseFailMessage('库存不足');
		}
		if (!$goodPrice){
			$this->responseFailMessage('商品信息获取失败');
		}
		if ($userBan<$goodPrice){
			$this->responseFailMessage('虚拟币不足');
		}
		$userBan = $userBan - $goodPrice;
		if (M('user_player')->where("user_id = $userId")->save(array('balance'=>$userBan))===false){
			$this->responseFailMessage('扣款失败');
		}
		$goodData = M('goods')->where(" id = $goodsId ")->find();
		$cdkey = explode(',',$goodData['cdkey']);
		
		if(count($cdkey)<1){
			$this->responseFailMessage('库存不足');
		}
		
		$userCdkey = $cdkey[0];
		unset($cdkey[0]);
		$map['num'] = array('exp','num-1');
		$map['sales'] = array('exp','sales+1');
		$map['cdkey'] = implode(',',$cdkey);
		M('goods')->where(" id = $goodsId ")->save($map);
		M('money')->add(
			array(
				'user_id'=> $userId,
				'money'  => $goodPrice,
				'balance'=> $userBan,
				'type'   => 'good',
				'pay_type'=> 'paymoney',
				'pay_status' => 'success',
				'status'  => 'done',
				'add_time'=> date('Y-m-d H:i:s'),
				'remark'  =>$userCdkey,
			)
		);
		//兑换历史
		M('goods_history')->add(
			array(
				'goods_id' => $goodsId,
				'user_id'  => $userId,
				'add_time' => date('Y-m-d H:i:s'),
			)
		);
		$this->responseJson($userCdkey);
	}
	/**
	 * 查询积分排序score
	 * 1：本圈子里的玩家放一起做积分排行
	 * 2: 本市每个圈子的前三名加入排行
	 */
	public function getScoreList(){
		$groupId = $this->getVar('groupId');
		$city = $this->getVar('city');
		$userId = $this->getVar('userId');
		$pageNo = $this->getVar('pageNo');
		$pageSize = $this->getVar('pageSize');
		$playModel = M('user_player');
		if (empty($groupId)){
			//全市排名
			$model = M('community');
			$comIds = $model->field('id,title')->where(" address like '%$city%' ")->order("add_time")->page($pageNo,$pageSize)->select();
			$userModel = M('community_users t1');
			//去掉重复 20160919
			$in = array();
			foreach ($comIds as $key => $val){
				$groupId = $val['id'];
				$data = $userModel->field("t1.user_id,t2.avatar,t2.nickname,t2.profile,t3.pk_score")->join(" left join yw_user t2 on t1.user_id = t2.id  ")->join(" left join yw_user_player t3 on t2.id = t3.user_id ")->where(" t1.comm_id = $groupId and t1.status = 'open' ")->order(" t3.pk_score desc ")->page(0,3)->select();
				
				if (empty($userId)){
					
				}else{
					if ($return = $userModel->where("comm_id = $groupId and status = 'open' and user_id = $userId")->find()){
						$comUser = $userModel->field("t1.user_id,t2.avatar,t2.nickname,t2.profile,t3.pk_score")->join(" left join yw_user t2 on t1.user_id = t2.id  ")->join(" left join yw_user_player t3 on t2.id = t3.user_id ")->where(" t1.comm_id = $groupId and t1.status = 'open' ")->order(" t3.pk_score desc ")->page($pageNo,$pageSize)->select();

						$comUserIds = '';
						foreach ($comUser as $key => $value ){
							$comUserIds .= ',' . $value['user_id'];
						}
						$comUserIds = trim($comUserIds,',');
						
						if ($comUserIds){
							$sql = "select count(*) from yw_user_player where user_id in ($comUserIds) and  pk_score>(select pk_score from yw_user_player where user_id=$userId)";
							$num = $playModel->query($sql);
							$num = $num[0]['count(*)'] + 1;
						}else{
							$num = 0;
						}
					}else{
							
					}
				}
				
				if ($data){
					foreach ($data as $ke=> $value){
						//===== BEGIN 去掉重复 =====
						$uid = $value['user_id'];
						if (in_array($uid, $in)) {
							continue;
						}
						$in[] = $value['user_id'];
						//===== END 去掉重复 =====

						if ($return){
							$loginUserRanking = $num;
						}else{
							$loginUserRanking = 0;
						}
						$list[] = array(
								'userId'  =>  $value['user_id'],
								'headImg' =>  $value['avatar'],
								'nickName'=>  $value['nickname'],
								'score'   =>  $value['pk_score'],
								'slogan'  =>  $value['profile'],
								'groupName'=> $val['title'],
								'loginUserRanking' => $loginUserRanking
						);
					}
				}else{
					//没有数据不加入
				}
			}
			$list = array_msort($list,'score','SORT_DESC');
			$this->responseJson($list);
			
		}else{
			//圈子排名
			$model = M('community_users t1');
			$list = $model->field("t1.user_id,t2.avatar,t2.nickname,t2.profile,t3.pk_score")->join(" left join yw_user t2 on t1.user_id = t2.id  ")->join(" left join yw_user_player t3 on t2.id = t3.user_id ")->where(" t1.comm_id = $groupId and t1.status = 'open' ")->order(" t3.pk_score desc ")->page($pageNo,$pageSize)->select();
			$comUserIds = '';
			foreach ($list as $key => $value ){
				$comUserIds .= ',' . $value['user_id'];
			}
			$comUserIds = trim($comUserIds,',');
			$data = array();
			if (empty($userId)){
				
			}else{
				$loginUser = $model->where("t1.comm_id = $groupId and t1.status = 'open' and user_id = $userId")->find();
			}
			$playModel = M('user_player');
			$groupName = M('community')->where(" id = $groupId ")->getField('title');
			if($loginUser){
				$sql = "select count(*) from yw_user_player where user_id in ($comUserIds) and  pk_score>(select pk_score from yw_user_player where user_id=$userId)";
				$num = $playModel->query($sql);
				$num = $num[0]['count(*)'] + 1;
			}
			foreach ($list as $key => $val){
				$data[$key]['userId'] = $val['user_id'];
				$data[$key]['headImg'] = $val['avatar'];
				$data[$key]['nickName'] = $val['nickname'];
				$data[$key]['score'] = $val['pk_score'];
				$data[$key]['slogan'] = $val['profile'];
				$data[$key]['groupName'] = $groupName ;
				if($loginUser){
					$data[$key]['loginUserRanking'] = $num;
				}else{
					$data[$key]['loginUserRanking'] = 0;
				}
				
			}
			$this->responseJson($data);
		}
		
	}
	/**
	 * 判定输赢(玩家判输赢)
	 */
	public function judgeWiner(){
		$userId = $this->getVar('userId');
		$gameDeskId = $this->getVar('gameDeskId');
		$netbarName = $this->getVar('netbarName');
		$netbarId = $this->getVar('netbarId');
		
		$model = M('war');
		$teamModel = M('war_team');
		if (!$teamUser = $teamModel->where(" war_id = $gameDeskId and player_id = $userId ")->find()){
			$this->responseFailMessage('该用户不在游戏桌中');
		}
// 		if ($model->where(" id = $gameDeskId ")->getField('type')==1){
// 			$this->responseFailMessage('用户无法对官方战场判定输赢');
// 		}
		if ($model->where(" id = $gameDeskId ")->save(['win'=>$teamUser['role'],'status'=>'judge'])===false){
			$this->responseFailMessage('修改失败');
		}else{
			$this->responseJson('修改成功');
		}
		
	}
	/**
	 * 玩家判输赢
	 */
	public function JudgeWinerForUser(){
		$userId = $this->getVar('userId');
		$gameDeskId = $this->getVar('gameDeskId');
		$model = M('war');
		$teamModel = M('war_team');
		if (!$teamUser = $teamModel->where(" war_id = $gameDeskId and player_id = $userId ")->find()){
			$this->responseFailMessage('该用户不在游戏桌中');
		}
		
		if ($model->where(" id = $gameDeskId ")->save(['win'=>$teamUser['role'],'status'=>'judge'])===false){
			$this->responseFailMessage('修改失败');
		}else{
			$this->responseJson('修改成功');
		}
		
	}
	/**
	 * 网吧发布广告
	 */
	public function sendAD(){
		if ($this->getVar('type')==1){
			$type = 'game';
		}else{
			$type = 'text';
		}
		$userId = $this->getVar('userId');	//网吧ID
		$netbarId = $userId;
		$title = $this->getVar('title');
		$gameId = $this->getVar('gameId');	//游戏ID
		$detail = $this->getVar('detail');
		$startTime = $this->getVar('startTime');
		$maxPeopleNumber = $this->getVar('maxPeopleNumber');
		$gameCount = $this->getVar('gameCount');
		$price = $this->getVar("price");	//奖金 1:500|2:300

		$desc = $this->getVar("desc");		//描述规则
		$imgs = array_filter(explode(',',$this->getVar('imgs')));
		$img_num = count($imgs);
		$model = M('slider');

		if($type=='text'){
			//客户端添加广告
			$slide = [
				'netbar_id' => $netbarId,
				'game_id' => $gameId,
				'war_id' => 0,	//预留
				'title'	  => $title,
				'img_num' => $img_num,
				'images'  => base64_encode(serialize($imgs)),
				'type'    => 'act',
				'fk'      => '',
				'add_time'=> date("Y-m-d H:i:s"),
				'content' => $detail,
				'unknown' => 'text',
				'remark' => $userId.','.$gameId.','.$startTime.','.$maxPeopleNumber.','.gameCount,
			];
			if ($model->add($slide)){
				$this->responseJson('添加成功');
			}else{
				$this->responseFailMessage('添加失败');
			}
		}else{
			// 发布对战广告（对战+广告）
			$data = array(
				'title' 	=> $title,
				'game_id'   =>  $gameId,
				'user_id'   =>  $userId,
				'netbar_id' =>  $userId,
				'begin_time'=>  $startTime,
				'team' 		=>  $maxPeopleNumber,
				'times'		=>  $gameCount,
				'prize'     =>  $price,
				'rule'      =>  $desc,
				'room_id'   =>  '',
				'add_time'  =>  date('Y-m-d H:i:s'),
				'status'    =>  'pedding'
			);
			$modelWar = D('war');
			$warId = $modelWar->add($data);
			if ($warId){
				$slide = [
					'netbar_id' => $netbarId,
					'game_id' => $gameId,
					'war_id' => $warId,
					'title'	  => $title,
					'img_num' => $img_num,
					'images'  => base64_encode(serialize($imgs)),
					'type'    => 'act',
					'fk'      => $warId,
					'add_time'=> date("Y-m-d H:i:s"),
					'content' => $detail,
					'unknown' => 'text',
					'remark' => $userId.','.$gameId.','.$startTime.','.$maxPeopleNumber.','.gameCount,
				];
				if ($model->add($slide)){
					$this->responseJson('添加成功');
				}else{
					$this->responseFailMessage('添加失败');
				}
					
			}else{
				$this->responseFailMessage('添加失败');
			}
			
		
		}
		
		
	}
	
	/**
	 * 检测当前签权是否存在
	 */
	public function isAuthExists(){
		$auth = $this->getVar('auth');
		if (empty($auth)){
			$this->responseFailMessage('签权不能为空');
		}else{
			$model = M('user');
			$data = $model->where(" auth = '$auth' ")->find();
			if ($data){
				$this->responseJson(['phone'=>$data['tel']]);
			}else{
				$this->responseFailMessage('无该签权');
			}
		}
	}
	
	/**
	 * 使用签权拿到用户资料
	 */
	/**
	 * 4：获取用户资料
	 * 接受三个参数 用户电话号、用户密码、用户类型（默认为普通用户player）
	 */
	public function getUserInfoWithAuth()
	{
		$phone = $this->getVar('phone');
		$auth = $this->getVar('auth');
		//$userType = is_null($this->getVar('userType'))?'player':$this->getVar('userType');
		if (is_null($phone) || is_null($auth)) {
			$this->responseFailMessage("电话号码或签权不合法");
		}
	
		//操作数据库
		$model = D('user t1');
		$userType = M('user')->where(" tel = $phone and auth = '$auth' ")->getField('user_type');
		if ($userType == 'player'){
			//$model->field("t1.id,t1.avatar,t1.nickname,t1.longitude,t1.latitude,t1.tel,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.age,t2.game_age,t2.times,t2.win_times,t2.lose_times,t2.fail_times,t2.pk_score,t2.likes")->join(" yw_user_player t2 on t1.id = t2.user_id ")->where(" t1.id = '$userId'")->find();
			$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.longitude,t1.latitude,t1.tel,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.age,t2.game_age,t2.times,t2.win_times,t2.lose_times,t2.fail_times,t2.pk_score,t2.likes")->join(" yw_user_player t2 on t1.id = t2.user_id ")->where(" t1.tel = '$phone' and t1.auth = '$auth'")->find();
			if ($data){
// 				$info['userId'] = $data['id'];
// 				$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
// 				$info['nickName'] = $data['nickname'];
// 				$info['sex'] = $data['sex']==1?'男':'女';
// 				$info['age'] = $data['age'];
// 				$info['playAge'] = $data['game_age'];
// 				$info['address'] = $data['address'];
// 				$info['slogan'] = $data['profile'];
// 				$info['realName'] = $data['real_name'];
// 				$info['cardNo'] = $data['identity'];
// 				$info['gameId'] = explode(',',$data['likes']);
// 				$info['userType'] = $userType;
				
				$info['userId'] = $data['id'];
				$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
				$info['nickName'] = $data['nickname'];
				$info['sex'] = $data['sex']==1?'男':'女';
				$info['age'] = $data['age'];
				$info['phone'] = $data['tel'];
				$info['lng'] = $data['longitude'];
				$info['lat'] = $data['latitude'];
				$info['playAge'] = $data['game_age'];
				$info['address'] = $data['address'];
				$info['slogan'] = $data['profile'];
				$info['realName'] = $data['real_name'];
				$info['cardNo'] = $data['identity'];
				$info['score'] = $data['pk_score'];
				$info['sumPlayCount'] = $data['times'];
				$info['winCount'] = $data['win_times'];
				$info['loseCount'] = $data['lose_times'];
				$info['BreakCount'] = $data['fail_times'];
				$info['gameId'] = explode(',',$data['likes']);
				$info['userType'] = $userType;
				$this->responseJson($info);
			}else{
				$this->responseFailMessage('无此用户');
			}
		}else{
			$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.longitude,t1.latitude,t1.tel,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.title net_title")->join(" yw_user_netbar t2 on t1.id = t2.user_id ")->where(" t1.tel = '$phone' and t1.auth = '$auth'")->find();
				
			//$data = $model->field("t1.id,t1.avatar,t1.nickname,t1.sex,t1.address,t1.real_name,t1.identity,t1.profile,t2.title")->join(" yw_user_netbar t2 on t1.id = t2.user_id ")->where(" t1.tel = '$phone' and t1.auth = '$auth'")->find();
			if ($data){
// 				$info['userId'] = $data['id'];
// 				$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
// 				$info['nickName'] = $data['nickname'];
// 				$info['sex'] = $data['sex']==1?'男':'女';
// 				$info['age'] = 0;
// 				$info['playAge'] = 0;
// 				$info['address'] = $data['address'];
// 				$info['slogan'] = $data['profile'];
// 				$info['realName'] = $data['real_name'];
// 				$info['cardNo'] = $data['identity'];
// 				$info['title'] = $data['title'];
// 				$info['cardNo'] = $data['identity'];
// 				$info['gameId'] = 0;
// 				$info['userType'] = $userType;

				$info['userId'] = $data['id'];
				$info['headImg'] = empty($data['avatar'])?C('default_Avatar'):$data['avatar'];
				$info['nickName'] = $data['nickname'];
				$info['sex'] = $data['sex']==1?'男':'女';
				$info['age'] = $data['age'];
				$info['phone'] = $data['tel'];
				$info['lng'] = $data['longitude'];
				$info['lat'] = $data['latitude'];
				$info['playAge'] = 0;
				$info['address'] = $data['address'];
				$info['slogan'] = $data['profile'];
				$info['realName'] = $data['real_name'];
				$info['cardNo'] = $data['identity'];
				$info['score'] = 0;
				$info['sumPlayCount'] = 0;
				$info['winCount'] = 0;
				$info['loseCount'] = 0;
				$info['BreakCount'] = 0;
				$info['gameId'] = 0;
				$info['netbarTitle'] = $data['net_title'];
				$this->responseJson($info);
			}else{
				$this->responseFailMessage('无此用户');
			}
		}
		 
	}
	
	/**
	 * getExchangeLevels
	 * 获取当前服务器配置的充值梯度
	 */
	public function getExchangeLevels(){
		$this->responseJson(string2array(M('settings')->where(" `key` = 'recharge' ")->getField('value')));
	}

	/**
	 * 支付接口
	 * 使用PING++
	 */
	public function payment() {
		import("Vendor.pingpp.init", "", '.php');
		$test_key = 'sk_test_TGur944yHe5KHizLuP084800';
		$live_key = 'sk_live_WfPG4CTu1yD8K4yHSCOan1eL';
		\Pingpp\Pingpp::setApiKey($test_key);
		\Pingpp\Pingpp::setPrivateKeyPath( VENDOR_PATH . 'pingpp/rsa_private_key.pem');

		$orderNo 	= $this->getVar('orderNo');		//订单号
		$amount 	= $this->getVar('amount');		//商品总价
		$subject 	= $this->getVar('subject');		//商品标题
		$body 		= $this->getVar('body');		//商品描述

		$appId = 'app_9qb1i94izvzLjDWL';
		$extra = array();
		try {
			$ch = \Pingpp\Charge::create(
				array(
					'order_no'  => $orderNo,
					'app'       => array('id' => $appId),
					'channel'   => 'alipay',
					'amount'    => $amount,
					'client_ip' => $_SERVER['REMOTE_ADDR'],	// 119.10.67.136
					'currency'  => 'cny',
					'subject'   => $subject,
					'body'      => $body,
					'extra'     => $extra
				)
			);
			echo $ch;
		} catch (\Pingpp\Error\Base $e) {
			if ($e->getHttpStatus() != NULL) {
				header('Status: ' . $e->getHttpStatus());
				echo $e->getHttpBody();
			} else {
				echo $e->getMessage();
			}
		}
	}

	/**
	 * 54、取得全市的比赛广告
	 *
	 * @date 2016/10/20
	 * @param int $pageNo 页码
	 * @param int $pageSize 每页行数
	 * @param string $city 城市名称(市结尾)
	 */
	public function getADList() {
		$city = $this->getVar('city');
		$pageNo = $this->getVar('pageNo');
		$pageSize = $this->getVar('pageSize');
		$pageNo = empty($pageNo) ? 1 : intval($pageNo);
		$pageSize = empty($pageSize) ? C("PAGE_SIZE") : $pageSize;
		$model = M('slider a');
		$lng = $this->getVar("lng");
		$lat = $this->getVar("lat");
		$squares = returnSquarePoint($lng, $lat, 10);
        // lat<>0
        // and lat>{$squares['right-bottom']['lat']}
        // and lat<{$squares['left-top']['lat']}
        // and lng>{$squares['left-top']['lng']}
        // and lng<{$squares['right-bottom']['lng']} ";
        if (empty($lng) || empty($lat)) {
            $where_distance = '1=1';
        } else {
            $where_distance = "b.longitude>{$squares['left-top']['lng']} and b.longitude < {$squares['right-bottom']['lng']} and b.latitude > {$squares['right-bottom']['lat']} and b.latitude < {$squares['left-top']['lat']} and b.latitude <> 0" ;
        }

		$rs = $model
			->field("a.title, a.content as `description`,a.images, a.add_time as `addTime`, a.game_id, a.war_id as `gameDeskId`, c.id as `netbarId`, c.title as `netbarName` , b.address as `netbarAddress`, e.title as `gameName`")
			->join("LEFT JOIN yw_user b ON a.netbar_id = b.id")
			->join("LEFT JOIN yw_user_netbar c ON b.id = c.user_id")
			->join("LEFT JOIN yw_region d ON b.region_id = d.region_id")
			->join("LEFT JOIN yw_war e ON a.war_id = e.id")
			->where("b.user_type = 'netbar' AND ($where_distance) AND d.region_name LIKE '%$city%'")	//a.type = 'act' AND
			->page("$pageNo, $pageSize")
			->select();
		if ($rs){
			foreach ($rs as $key => $val){
				$rs[$key] = [
					'title'  		=> $val['title'],
					'description'  	=> $val['description'],
					'addTime' 		=> $val['add_time'],
					'gameDeskId' 	=> $val['gameDeskId'],
					'gameName' 		=> $val['gameName'],
					'netbarAddress' => $val['netbarAddress'],
					'netbarName' 	=> $val['netbarName'],
					'netbarId'   	=> $val['netbarId'],
				];
				$imgs = unserialize(base64_decode($val['images']));
				if (is_array($imgs)) {
					foreach ($imgs as $value){
						$rs[$key]['ADImg'][]  = $value['img'];
					}
				} else {
					$rs[$key]['ADImg'][]  = $imgs;
				}

			}
			$this->responseJson($rs);
		}else{
			$this->responseFailMessage('无数据');
		}

	}

    /**
     * 获取传递的参数值
     * @param null $key
     * @return null|string
     */
    private function getVar($key = null)
    {
        if (is_null($key)) {
            return null;
        }
        if(IS_GET) {
            $value = isset($_GET[$key]) ? trim($_GET[$key]) : null;
        } elseif (IS_POST) {
            $value = isset($_POST[$key]) ? trim($_POST[$key]) : null;
        }
        return $value;
    }

    /**
     * 统一返回JSON格式数据
     * @param array $data
     * @param int $status 1表示成功，0表示失败，默认值是1
     * @param string $msg
     */
    private function responseJson($data = array(), $status = true, $msg = '')
    {
        header('Content-Type: application/json');
        $result = array(
            'Success' => $status,
            'Result' => $data,
            'Msg' => $msg
        );
        echo json_encode($result);
        exit;
    }

    /**
     * 返回错误信息
     * @param string $msg
     */
    private function responseFailMessage($msg = '')
    {
        $this->responseJson(array(),false,$msg);
    }

    /**
     * 返回错误信息
     * @param string $msg
     */
    private function responseSuccessMessage($msg = '')
    {
        $this->responseJson(array(),true,$msg);
    }
}