<?php

namespace app\admin\controller;

//use app\common\controller\Backend;
use wechat\Wechat;
use think\Validate;

/**
 * 资源管理
 *
 * @icon fa fa-list-alt
 */
class WeResponse extends Base
{

    protected $model = null;
    protected $searchFields = 'id,title';

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('WechatResponse');
    }
    
    public function index(){
        $page_param = ['query' => []];
        if (isset($this->param['keywords']) && !empty($this->param['keywords'])) {
            $page_param['query']['keywords'] = $this->param['keywords'];
            
            $this->model->whereLike('title', "%" . $this->param['keywords'] . "%");
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

    /**
     * 选择素材
     */
    public function select()
    {
        $list = $this->model
        ->order('id desc')->where('status',1)
        ->paginate($this->webData['list_rows']);
        
        $this->assign([
            'list' => $list,
            'page'  => $list->render(),
            'total' => $list->total()
        ]);
        return $this->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $validate=new Validate([
                'type'=>'require|token',
                'content'=>'require'
            ]);
            
            $params = $this->request->param();
            $ret=$validate->check($params);
            if(!$ret){
                return $this->error($validate->getError());
            }
            $content=[];             
            if($params['type']=='text'){
                $content=['content'=>$this->request->param('content','')];
            }else{
                $content=['app'=>$this->request->param('content',''),'id'=>$this->request->param('content_id','')];
            }          
            $params['eventkey'] = isset($params['eventkey']) && $params['eventkey'] ? $params['eventkey'] : uniqid();            
            
            $params['content']=json_encode($content);
            
            if ($params) {
                $this->model->save($params);
                return $this->layerSuccess();
                 
            }
            $this->error();
        }
        $appConfig = Wechat::appConfig();
         
        $this->view->applist = $appConfig;
        $this->view->showFormFooter=true;
        $this->view->showFormFooterSubmitButton=true;
        $this->view->showFormFooterResetButton=true;
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($id)
    {
        $row = $this->model->get($id);
        if (!$row)
            $this->error('No Results were found');
        if ($this->request->isPost()) {
            $validate=new Validate([
                'type'=>'require|token',
                'content'=>'require'
            ]);
            
            $params = $this->request->param();
            $ret=$validate->check($params);
            if(!$ret){
                return $this->error($validate->getError());
            }
            $content=[];
            if($params['type']=='text'){
                $content=['content'=>$this->request->param('content','')];
            }else{
                $content=['app'=>$this->request->param('content',''),'id'=>$this->request->param('content_id','')];
            }             
            $params['content']=json_encode($content);
            if ($params) {
                $row->save($params);
                $this->layerSuccess();
            }
            $this->error();
        }
        $this->view->assign("row", $row);
        $appConfig = Wechat::appConfig();
        $this->view->applist = $appConfig;
        return $this->view->fetch();
    }

    public function del($id){
        $row =$this->model->get($id);
        if($row){
            $row->delete();
        }
        return $this->success();
    }
}
