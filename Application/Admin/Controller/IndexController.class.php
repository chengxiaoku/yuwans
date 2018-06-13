<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 控制面板控制器
 */
class IndexController extends BaseController {
    /**
     * 类初始化
     */
    public function _initialize() {
        parent::_initialize();

        $this->assign("page_title", "控制面板");
    }


    public function index(){
        
        $this->display();

    }

}