<?php
namespace App\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index()
    {
        
        echo '这是后台接口';
    }

    public function hello() {
        $title = '后台接口';
        $this->assign("title", $title);
        $this->display();
        
    }
}