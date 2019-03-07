<?php

namespace app\admin\controller\cms;


use app\admin\controller\Base;
use app\common\model\cms\Config  as ConfigModel;

class Config extends Base
{
    
    protected $model;
    
    function __construct(){
        parent::__construct();
        $this->model=new ConfigModel();
    }
    //站点设置 
    public function index()
    {
        $data=$this->model->order('id asc')->select();
        
        if($this->request->isPost()){
             foreach($data as $item){
                 if($item->type=='image'){
                     $file=$this->request->file($item->code);
                     if($file){
                         $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                         if($info){
                             $tmp=ROOT_PATH . 'public' . DS . 'uploads/'.$item->content;
                             if(is_file($tmp)){
                                 unlink($tmp);//删除原图片
                             }
                             $item->content=$info->getSaveName();
                             $item->save();
                         } 
                     }
                 }else{
                     $item->content=$this->request->param($item->code);
                     $item->save();
                 }
             }
            
            return $this->layerSuccess();
        }
       
        $this->assign('data',$data);
        return $this->fetch('webset');
    }

   
}
