<?php

namespace app\admin\controller\cms;

use app\admin\controller\Base;
use app\common\model\cms\Category as CategoryModel;
use fast\Tree;
use app\common\model\cms\Tags;
use app\admin\validate\cms\CateValid;

class Category extends Base
{
    
    protected $model;
    
    function __construct(){
        parent::__construct();
        $this->model=new CategoryModel();
    }
   
    public function index() 
    {
        $list=$this->getlist();
         
        $this->assign([
            'menu_list' => $list
        ]);
        return $this->fetch();
        
    }

    
    public function add()
    {
        if($this->request->isPost()){
            $param=$this->request->param();  
            $file=$this->request->file('image');
            
            $param['file']=$file;
            $valid=new CateValid();
            
            if($valid->check($param)){
                
                if($file){
                    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                    if($info){                        
                        $param['image']=$info->getSaveName();
                    }else{
                        // 上传失败获取错误信息
                        return $this->error($file->getError());
                    }
                }
                $this->model->data($param)->save();
                return $this->layerSuccess();
            }else{
                return $this->error($valid->getError());
            }
        }
        $selects=$this->menu(0);
        $tags=Tags::order('id asc')->column('id,title');
        $this->assign(['selects'=>$selects,'tags'=>$tags,'info'=>null]);
        return $this->fetch();
        
    }
    
    function edit($id=0){
        $row=$this->model->where('id',$id)->find();
        if(empty($row)){
            return $this->error('没有这条数据，可能已经删除了');
        }        
        if($this->request->isPost()){ 
            $param=$this->request->param();
            $file=$this->request->file('image');            
            $param['file']=$file;
            $valid=new CateValid();            
            if($valid->check($param)){                
                if($file){
                    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                    if($info){
                        $tmp=ROOT_PATH . 'public' . DS . 'uploads/'.$row->image;
                        if(is_file($tmp)){
                            unlink($tmp);//删除原图片
                        }
                        $param['image']=$info->getSaveName();
                    }else{
                        // 上传失败获取错误信息
                        return $this->error($file->getError());
                    }
                }
                if($param['type']==0){
                    $param['content_id']=0;  //是列表时，文章ID是0
                }else{
                    $param['tag_id']=0;  //是单个文章时，标签ID是0
                }
                
                $row->save($param);
                return $this->layerSuccess();
            }else{
                return $this->error($valid->getError());
            }
            
            return $this->error();
        }
        
        $selects=$this->menu($row->pid,$row->id);
        $tags=Tags::order('id asc')->column('id,title');
        $this->assign(['selects'=>$selects,'tags'=>$tags,'info'=>$row]);        
        return $this->fetch('add');        
    }

    function del($id){
        $row=$this->model->where('id',$id)->find();
        if(empty($row)){
            return $this->error('没有这条数据，可能已经删除了');
        }        
        $this->model->where('pid',$id)->whereOr('id',$id)->update(['delete_time'=>time()]);
        return $this->success();       
    }
    
    private function menu($selected = 1, $current_id = 0)
    {
        $array       = [];
        $tree        = new Tree();       
        $result      = $this->model->whereNotIn('id', $current_id)->order(["sort" => "asc", 'id' => 'asc'])->column('*', 'id');
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $selected ? 'selected' : '';
            $array[]       = $r;
        }
        
        $str = "<option value='@id' @selected >@spacer @title</option>";
        $tree->init($result);
        return $tree->getTree(0, $str, $selected);
    }
    
    
    private function getlist($pid=0,$ret=[],$level=0){
         $list=$this->model->where('pid',$pid)->order('sort asc ,id asc')->select();
         foreach($list as &$v){
             $str='';
             for( $i=0 ;$i<$level;++$i){
                 $str.='├&nbsp;&nbsp;&nbsp;';                 
             }
             $v['title']=' '.$str.$v['title'];
             $ret[]=$v;
             $ret=$this->getlist($v['id'],$ret,$level+1);
         }
        
         return $ret;
    }
    
}
