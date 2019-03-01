<?php

namespace app\admin\controller\cms;


use think\Request;
use app\common\model\cms\Tags as TagsModel;
use app\admin\controller\Base;
use app\admin\validate\cms\TagValid;

class Tags extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $list=TagsModel::paginate(10);
        foreach ($list as $item){
            $item->num=$item->list()->count();
        }
        //dump($list);die;
        $this->assign(['lists'=>$list,'page'=>$list->render()]);
        
        
        return $this->fetch();
    }

   
    public function add()
    {
        if($this->request->isPost()){
            $data=$this->request->param();
            $valid=new TagValid();
            if($valid->check($data)){
                $ret=TagsModel::create($data);
                return $this->success();
            }
            
            return $this->error($valid->getError());
             
        }
        return $this->fetch();
        
    }

    function edit($id){
        $row=TagsModel::get($id);       
        if(empty($row)){
            return $this->error('没有找到这条数据，可能已经删除了');
        }
        if($this->request->isPost()){
            $data=$this->request->param();
            $valid=new TagValid();
            if($valid->check($data)){
                $ret=$row->save($data);
                if($ret){
                    return $this->layerSuccess();
                }else{
                    return $this->error();
                }                
            }
            
            return $this->error($valid->getError());
            
        }
        $this->assign('row',$row);
        return $this->fetch('add');
    }
    
    public function del($id)
    {
        $row=TagsModel::get($id);
        if(empty($row)){
            return $this->error('没有找到这条数据，可能已经删除了');
        }else{
            $ret=$row->delete();
            if($ret){
                return $this->success();
            }else{
                return $this->error();
            }
        }        
    }
    
    public function delall($id){
        $rows=TagsModel::whereIn('id',$id)->select();
         
        if($rows){
            foreach($rows as $item){
                $item->delete();
            }
        }
        
        return $this->success();
        
    }
}
