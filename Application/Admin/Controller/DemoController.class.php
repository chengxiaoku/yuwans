<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * Demo Controller
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/20
 * Time: 17:44
 */
class DemoController extends BaseController
{
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 空页面
     */
    public function blank()
    {
        $this->assign("page_title", 'blank page');
        $this->display();
    }

    public function index()
    {
        $this->assign("page_title", "常用网页元素");
        $this->display();
    }


}