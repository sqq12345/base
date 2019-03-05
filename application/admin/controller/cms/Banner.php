<?php

namespace app\admin\controller\cms;


use app\common\model\cms\Banners;
use app\admin\controller\Base;

class Banner extends Base
{
    protected $model;
    
    function __construct(){
        parent::__construct();
        $this->model=new Banners();
    }
    
    public function index()
    {
        $list=$this->model->order('id','asc')->paginate(10);
        
        $this->assign([
            'lists' => $list,
            'page'=>$list->render()
        ]);
        return $this->fetch();
        
    }
}
