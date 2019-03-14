<?php

namespace app\admin\controller\cms;
use app\admin\controller\Base;
use app\common\model\cms\CmsPage;
use app\admin\validate\cms\PageValid;

class Page extends Base
{
    protected $model;

    function __construct(){
        parent::__construct();
        $this->model=new CmsPage();

    }

    function index(){
        $keyword=$this->request->param('keywords');
        if($keyword){
            $this->model->whereLike('title',"%{$keyword}%");
        }
        $list=$this->model->order('id desc')->paginate($this->webData['list_rows'],false,array("query"=>input()));


        $this->assign(['lists'=>$list,'page'=>$list->render()]);
        return $this->fetch();

    }

    function add(){

        if($this->request->isPost()){

            $param=$this->request->param('','','htmlspecialchars');
            $valid=new PageValid();
            if($valid->check($param)){
                $this->model->save($param);

                return $this->layerSuccess();
            }

            return $this->error($valid->getError());
        }
        return $this->fetch();
    }

    function edit($id=0){
        $row=$this->model->where('id',$id)->find();
        if(empty($row)){
            return $this->error('没有这条数据，可能已经删除了');
        }

        if($this->request->isPost()){
            $param=$this->request->param('','','htmlspecialchars');
            $valid=new PageValid();
            if($valid->check($param)){
                $row->save($param);
                return $this->layerSuccess();
            }
            return $this->error($valid->getError());
        }


        $this->assign(['row'=>$row]);
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
