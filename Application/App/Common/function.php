<?php 
/**
 * 函数名
 * 返回经addslashes处理过的字符串或数组
 * @param $string 需要处理的字符串或数组
 * @return mixed
 */
function new_addslashes($string){
	if(!is_array($string)) return addslashes($string);
	foreach($string as $key => $val) $string[$key] = new_addslashes($val);
	return $string;
}

/**
 * 返回经stripslashes处理过的字符串或数组
 * @param $string 需要处理的字符串或数组
 * @return mixed
 */
function new_stripslashes($string) {
	if(!is_array($string)) return stripslashes($string);
	foreach($string as $key => $val) $string[$key] = new_stripslashes($val);
	return $string;
}

/**
 * 将字符串转换为数组
 *
 * @param	string	$data	字符串
 * @return	array	返回数组格式，如果，data为空，则返回空数组
 */
function string2array($data) {
	if($data == '') return array();
	eval("\$array = $data;");
	return $array;
}
/**
 * 将数组转换为字符串
 *
 * @param	array	$data		数组
 * @param	bool	$isformdata	如果为0，则不使用new_stripslashes处理，可选参数，默认为1
 * @return	string	返回字符串，如果，data为空，则返回空
 */
function array2string($data, $isformdata = 1) {
	if($data == '') return '';
	if($isformdata) $data = new_stripslashes($data);
	return var_export($data, TRUE);
}
/**
 * 检测是否为整数
 * @return bool true 是整数|false 不是整数 
 */
function isInt($num){
	if(!is_numeric($num)||strpos($num,".")!==false){
		return false;
	}else{
		return true;
	}
}

/**
 *计算某个经纬度的周围某段距离的正方形的四个点
 *
 *@param lng float 经度
 *@param lat float 纬度
 *@param distance float 该点所在圆的半径，该圆与此正方形内切，默认值为2千米
 *@return array 正方形的四个点的经纬度坐标
 */
function returnSquarePoint($lng, $lat,$distance = 5){
	$dlng =  2 * asin(sin($distance / (2 * EARTH_RADIUS)) / cos(deg2rad($lat)));
	$dlng = rad2deg($dlng);
	 
	$dlat = $distance/EARTH_RADIUS;
	$dlat = rad2deg($dlat);
	 
	return array(
			'left-top'=>array('lat'=>$lat + $dlat,'lng'=>$lng-$dlng),
			'right-top'=>array('lat'=>$lat + $dlat, 'lng'=>$lng + $dlng),
			'left-bottom'=>array('lat'=>$lat - $dlat, 'lng'=>$lng - $dlng),
			'right-bottom'=>array('lat'=>$lat - $dlat, 'lng'=>$lng + $dlng)
	);

}
/**
 * @desc 根据两点间的经纬度计算距离
 * @param float $lat 纬度值
 * @param float $lng 经度值
 */
function getDistance( $lng1,$lat1,$lng2,$lat2)
{
	$earthRadius = 6367000; 



	$lat1 = ($lat1 * pi() ) / 180;
	$lng1 = ($lng1 * pi() ) / 180;

	$lat2 = ($lat2 * pi() ) / 180;
	$lng2 = ($lng2 * pi() ) / 180;



	$calcLongitude = $lng2 - $lng1;
	$calcLatitude = $lat2 - $lat1;
	$stepOne = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);
	$stepTwo = 2 * asin(min(1, sqrt($stepOne)));
	$calculatedDistance = $earthRadius * $stepTwo;

	return round($calculatedDistance);
}
/**作用: 二维数组排序函数,支持多键名排序
 * 返回: 排序好的数组
 * 使用: array_msort(数组,需要排序的键名,排序方式);
 * 例子: array_msort($cflist,"chapter_orderid","SORT_ASC");
 *    array_msort($arr,"name","SORT_ASC","type","SORT_DESC","size","SORT_ASC","SORT_STRING");
 */
function array_msort($ArrayData,$KeyName1,$SortOrder1 = "SORT_ASC",$SortType1 = "SORT_REGULAR") {
  if(!is_array($ArrayData)) {
    return $ArrayData;
  }
  // 获取参数数量.
  $ArgCount = func_num_args();
  // 排序,并放置到SortRule数组
  for($i = 1;$i < $ArgCount;$i ++) {
    $Arg = func_get_arg($i);
    if(!eregi("SORT",$Arg)) {
      $KeyNameList[] = $Arg;
      $SortRule[] = '$'.$Arg;
    }
    else {
      $SortRule[] = $Arg;
    }
  }

  foreach($ArrayData AS $Key => $Info) {
    foreach($KeyNameList AS $KeyName) {
      ${$KeyName}[$Key] = $Info[$KeyName];
    }
  }
  
  $EvalString = 'array_multisort('.join(",",$SortRule).',$ArrayData);';
  eval($EvalString);
  return $ArrayData;
}
/**
 * 签到奖励
 * 通过参数检测该用户获得多少签到奖励
 * @param $day 连续签到时间
 */
function SignInToReward($day){
	$mysql = M('settings');
	$award = $mysql -> where(" `key` = 'signin' ")->getField('value');
	$award = string2array($award);
	foreach ($award as $key => $val ){
		if ($val['day'] == $day){
			return $val['aw'];
		}
	}
	$award[] = array('day' => $day,'aw'=> 'seach');
	$new_award = array_msort($award,'day');
	foreach ($new_award as $key => $val ){
		if ($num = array_keys($val,'seach')){
			$keyarray = $key;
		}else{
		}
	}
	return $new_award[$keyarray-1]['aw'];
}
/**
 * 获取网站配置参数
 * @param string $key
 * @return mixed
 */
function get_option($key) {
	$model = M("settings");
	$value = $model->where(array('key'=>$key))->getField('value');
	return $value;
}
/**
 * 过滤二维数组相同的值
 */
function multi_unique($array) {
	foreach ($array as $k=>$na)
		$new[$k] = serialize($na);
		$uniq = array_unique($new);
		foreach($uniq as $k=>$ser)
			$new1[$k] = unserialize($ser);
			return ($new1);
}

//二维数组去掉重复值
function assoc_id($arr, $key) { 
                        $tmp_arr = array(); 
                        foreach($arr as $k => $v) { 
                        if(in_array($v[$key], $tmp_arr)) { 
                                unset($arr[$k]); 
                        } else { 
                                $tmp_arr[] = $v[$key]; 
                        } 
                } 
                        return $arr; 
}//assoc_title end


?>