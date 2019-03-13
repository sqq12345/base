<?php

namespace app\admin\controller\cms;


use app\admin\controller\Base;
use app\common\model\cms\Content as ContentModel;
use app\common\model\cms\Tags;
use app\admin\validate\cms\ContentValid;



class Content extends Base
{
    protected $model;
    
    function __construct(){
        parent::__construct();
        $this->model=new ContentModel();
        
    }
    
    function index(){
        
        $keyword=$this->request->param('keywords');
        if($keyword){
            $this->model->whereLike('title',"%{$keyword}%");
        }
        $list=$this->model->order('id desc')->paginate($this->webData['list_rows']);
       
        foreach($list as &$item){
            $item['tag']=$item->tag;
             
        }
        $this->assign(['lists'=>$list,'page'=>$list->render(),'keywords'=>$keyword]);
        return $this->fetch();
        
    }
    
    function add(){
        
        if($this->request->isPost()){
           
            $param=$this->request->param('','','htmlspecialchars');            
            $param['file']=$this->request->file('image');
            $valid=new ContentValid();  
            if($valid->check($param)){
                
                if($param['file']){
                   $info= $param['file']->move($this->uploadDir);
                   if($info){
                       $param['image']=$info->getSaveName();
                   }else{
                       return $this->error($param['file']->getError());
                   }
                    
                }
                
                $this->model->save($param);
                return $this->layerSuccess();
            }

            return $this->error($valid->getError());
        }

        $parent_id = isset($this->param['parent_id']) ? $this->param['parent_id'] : 0;
        $tags   = (new Tags)->tags($parent_id);

        $this->assign('tags',$tags);
        return $this->fetch();
        
    }
    
    function edit($id=0){
        $row=$this->model->where('id',$id)->find();
        if(empty($row)){
            return $this->error('没有这条数据，可能已经删除了');
        }
        
        if($this->request->isPost()){
            
            $param=$this->request->param('','','htmlspecialchars');
            $param['file']=$this->request->file('image');
            $valid=new ContentValid();
            if($valid->check($param)){                
                if($param['file']){
                    $info= $param['file']->move($this->uploadDir);
                    if($info){
                        if(is_file($this->uploadDir.$row['image'])){
                            unlink($this->uploadDir.$row['image']);
                        }
                        $param['image']=$info->getSaveName();
                    }else{
                        return $this->error($param['file']->getError());
                    }
                    
                }                
                $row->save($param);
                return $this->layerSuccess();
            }
            return $this->error($valid->getError());
        }

        $tags  = (new Tags)->tags($row->tag_id);
        $this->assign(['tags'=>$tags,'row'=>$row]);
        return $this->fetch('add');
        
    }
    
    function del($id=0){
        $row=$this->model->where('id',$id)->find();
        if(empty($row)){
            return $this->error('没有这条数据，可能已经删除了');
        }
        $row->delete();
        return $this->success();
        
    }
    
}
