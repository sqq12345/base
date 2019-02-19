<?php

namespace app\admin\controller;

//use app\common\controller\Backend;
use app\common\model\WechatResponse;

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
            
            
            return $this->error();
        }
        
        return $this->fetch();
    }
    
    /**
     * 编辑
     */
    public function edit($id = NULL)
    {
        $row = $this->model->get(['id' => $ids]);
        if (!$row)
            $this->error('No Results were found');
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $row->save($params);
                $this->success();
            }
            $this->error();
        }
        $response = WechatResponse::get(['eventkey' => $row['eventkey']]);
        $this->view->assign("response", $response);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 判断文本是否唯一
     * @internal
     */
    public function check_text_unique()
    {
        $row = $this->request->post("row/a");
        $except = $this->request->post("except");
        $text = isset($row['text']) ? $row['text'] : '';
        if ($this->model->where('text', $text)->where(function ($query) use ($except) {
                if ($except) {
                    $query->where('text', '<>', $except);
                }
            })->count() == 0) {
            $this->success();
        } else {
            $this->error(__('Text already exists'));
        }
    }

}
