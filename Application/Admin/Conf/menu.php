<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/11/8
 * Time: 15:53
 */
return array(

    'MENU' => array(
        'dashboard' => array(
            'title' => '控制面板',
            'key' => 'dashboard',
            'm' => 'admin',
            'c' => 'index',
            'a' => 'index',
            'icon' => 'fa fa-dashboard',
        ),
        'war' => array(
            'title' => '对战列表',
            'key' => 'war',
            'm' => 'admin',
            'c' => 'war',
            'a' => 'index',
            'icon' => 'fa  fa-trophy'
        ),
        'user' => array(
            'title'=> '用户管理',
            'key' => 'user',
            'm' =>'admin',
            'c' =>'User',
            'a' =>'player',
            'icon' => 'glyphicon glyphicon-user',
            'suffix' => '<i class="fa fa-angle-left pull-right"></i>',
            'child' => array(
                'people' =>array(
                    'title' => '玩家',
                    'key' => 'chirld',
                    'm' =>'admin',
                    'c' =>'User',
                    'a' =>'player',
                    'icon' => 'fa fa-circle-o',
                ),
                'netbar' =>array(
                    'title' => '网吧',
                    'key' => 'netbar',
                    'm' =>'admin',
                    'c' =>'User',
                    'a' =>'netbar',
                    'icon' => 'fa fa-circle-o',
                )
            )
        ),
        'comm' =>array(
            'title'=> '圈子管理',
            'key' => 'comm',
            'm' =>'admin',
            'c' =>'Community',
            'a' =>'index',
            'icon' => 'fa  fa-weixin',
        ),
        'myspace' =>array(
            'title'=> '说说管理',
            'key' => 'myspace',
            'm' =>'admin',
            'c' =>'Myspace',
            'a' =>'index',
            'icon' => 'glyphicon glyphicon-thumbs-up',
        ),
        'slider' =>array(
            'title'=> '幻灯片',
            'key' => 'slider',
            'm' =>'admin',
            'c' =>'Slider',
            'a' =>'index',
            'icon' => 'fa  fa-file-image-o',
        ),
        'money' =>array(
            'title' => '收支明细',
            'key' => 'money',
            'm' => 'admin',
            'c' => 'Money',
            'a' => 'index',
            'icon' => 'glyphicon glyphicon-credit-card',
        ),
        'goods' =>array(
            'title' => '积分商品管理',
            'key' => 'goods',
            'm' => 'admin',
            'c' => 'Goods',
            'a' => 'index',
            'icon' => 'glyphicon glyphicon-gift',
        ),
        'game' =>array(
            'title' => '游戏设置',
            'key' => 'game',
            'm' => 'admin',
            'c' => 'Game',
            'a' => 'index',
            'icon' => 'fa fa-gamepad',
        ),
        'setting' =>array(
            'title' =>'网站配置',
            'key' => 'setting',
            'm' => 'admin',
            'c' => 'Setting',
            'a' => 'index',
            'icon' => 'fa fa-gear',
        ),
        'permission' => array(
            'title'=> '管理员设置',
            'key' => 'permission',
            'm' =>'admin',
            'c' =>'Role',
            'a' =>'admin',
            'icon' => 'glyphicon glyphicon-user',
            'suffix' => '<i class="fa fa-angle-left pull-right"></i>',
            'child' => array(
                'admin_people' =>array(
                    'title' => '管理员管理',
                    'key' => 'admin_people',
                    'm' =>'admin',
                    'c' =>'Role',
                    'a' =>'admin',
                    'icon' => 'fa fa-circle-o',
                ),
                'role' =>array(
                    'title' => '角色管理',
                    'key' => 'role',
                    'm' =>'admin',
                    'c' =>'Role',
                    'a' =>'permission',
                    'icon' => 'fa fa-circle-o',
                )
            )
        ),

    )
    
);