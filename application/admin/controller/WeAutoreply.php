<?php

namespace app\admin\controller;

//use app\common\controller\Backend;
use app\common\model\WechatResponse;
use app\common\validate\Validate;
use app\common\validate\WeAutoreplyValid;

/**
 * 微信自动回复管理
 *
 * @icon fa fa-circle-o
 */
class WeAutoreply extends Base
{

    protected $model = null;
   // protected $noNeedRight = ['check_text_unique'];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('WechatAutoreply');
    }

    public function index(){
        $page_param = ['query' => []];
        if (isset($this->param['keywords']) && !empty($this->param['keywords'])) {
            $page_param['query']['keywords'] = $this->param['keywords'];
            
            $this->model->whereLike('title|text', "%" . $this->param['keywords'] . "%");
            $this->assign('keywords', $this->param['keywords']);
        }
        
        $list = $this->model 
        ->order('id desc')
        ->paginate($this->webData['list_rows'], false, $page_param);
        
        $this->assign([
            'list' => $list,
            'page'  => $list->render(),
            'total' => $list->total()
        ]);
        return $this->fetch();
         
    }
    
    public function add(){        
        if($this->request->isPost()){            
            $param=$this->request->post();
            $validate=new WeAutoreplyValid();
            if($validate->check($param)){
                $this->model->save($param);
                return $this->layerSuccess();
            }else{
                return $this->error($validate->getError());
            }
        }        
        $reponses=WechatResponse::order('id desc')->column('eventkey,title');        
        $this->assign('reponses',$reponses);
        return $this->fetch();
    }
    
    /**
     * 编辑
     */
    public function edit($id)
    {
        if(!is_numeric($id)){
            $this->error('No Results were found');
        }
        $row = $this->model->get(['id' => $id]);
        if (!$row)
            $this->error('No Results were found');
        if ($this->request->isPost()) {
            $param=$this->request->post();
            $param['id']=$id;
            $validate=new WeAutoreplyValid();
            if($validate->check($param)){
                $row->save($param);
                return $this->layerSuccess();
            }else{
                return $this->error($validate->getError());
            }
        }
        $reponses=WechatResponse::order('id desc')->column('eventkey,title');
        $this->assign('reponses',$reponses);
        $this->assign("row", $row);
        return $this->fetch();
    }

    public function del($id){
        if(!is_numeric($id))  $this->error('No Results were found');
       
        $row = $this->model->get(['id' => $id]);
        if (!$row)   $this->error('No Results were found');
        
        $row->delete();
        return $this->success();
        
        
    }

}
