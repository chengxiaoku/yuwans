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
class UserModel extends Model
{
    protected $tableName    = 'user';
    //pk属性定义当前数据表的主键名，默认值就是id，因此如果是id的话可以无需定义。
    protected $pk           = 'id';

    /**
     * 检测电话号码是否存在
     * @param $phone
     * @return bool
     */
    public function isPhoneExists($phone)
    {
        if (!isset($phone)) {
            return false;
        }
        $rst = $this->where(array('tel'=>$phone))->find();
        if ($rst) {
            return true;
        }
        return false;
    }

    public function register($data = array())
    {	
    	$defaultAvatar = C('default_Avatar');
        $default = array(
            'tel' => $data['tel'],
            'pwd' => $data['pwd'],
            'username' => $data['tel'],
            'add_time' => date('Y-m-d H:i:s', time()),
            'user_type' => 'player',
            'status' => 1,
        	'avatar' => $defaultAvatar,
        	'auth' => $data['auth'],
        );
        $insertId = $this->data($default)->add();
        if ($insertId) {
            $db_user_player = D("UserPlayer");
            $_id = $db_user_player->data(array(
                'user_id' => $insertId,
                'balance' => 0,
                'age' => 0,
                'game_age' => 0,
                'times' => 0,
                'win_times' => 0,
                'lose_times' => 0,
                'fail_times' => 0,
            	'parent_id' => $data['parent_id'],
            ))->add();
            if ($_id) {
            	$parent_id = $data['parent_id'];
            	if (!empty($parent_id)){
            		$map['balance'] = array('exp','balance+'.get_option('referral_bonuses'));
            		$db_user_player->where(" user_id = $parent_id  ")->save($map);
            	}
                return array('id'=>$insertId,'avatar'=>$defaultAvatar);
            } else {
                //回滚？
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * 检查 手机号码是否已经存在
     * @param $phone_num手机号码
     */
    public function new_is_phone($phone_num){
        $where = array(
            'tel' => $phone_num,
        );
        $bool = $this->where($where)->find();
        return is_null($bool) ? true : false;
    }

}