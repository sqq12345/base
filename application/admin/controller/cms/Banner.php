<?php

namespace app\admin\controller\cms;


use app\common\model\cms\Banners;
use app\admin\controller\Base;
use app\common\model\cms\Tags;
use app\admin\validate\cms\BannerValid;
use fast\Tree;
use app\common\model\cms\Category;

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
    
    public function add(){
        if($this->request->isPost()){
            $param=$this->request->param();
            $file=$this->request->file('image');
            
            $param['file']=$file;
            $valid=new BannerValid();  
            
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
        $tags=Tags::order('id asc')->column('id,title');
        $selects=$this->menu(0);
        
        $this->assign(['tags'=>$tags,'selects'=>$selects]);
        return $this->fetch();
    }
    
    public function edit($id=0){
        $row=$this->model->where('id',$id)->find();
        
        if(empty($row)){
            return $this->error('记录没有找到,可能已经删除了');
        }
        
        if($this->request->isPost()){
            $param=$this->request->param();
            $file=$this->request->file('image');
            
            $param['file']=$file;
            $valid=new BannerValid();
            
            if($valid->check($param)){
                
                if($file){
                    $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                    if($info){
                        $tmp=ROOT_PATH . 'public' . DS . 'uploads/'.$row->image;
                        if(is_file($tmp)){
                            unlink($tmp);
                        }
                        $param['image']=$info->getSaveName();
                    }else{
                        // 上传失败获取错误信息
                        return $this->error($file->getError());
                    }
                }
                $row->save($param);
                return $this->layerSuccess();
            }else{
                return $this->error($valid->getError());
            }
            
            
            return $this->error();
        }
        
        
        $tags=Tags::order('id asc')->column('id,title');
        $selects=$this->menu($row['category_id']);
        
        $this->assign(['tags'=>$tags,'selects'=>$selects,'info'=>$row]);
        return $this->fetch('add');
    }
    
    public function del($id=0){
        $row=$this->model->where('id',$id)->find();
        
        if(empty($row)){
            return $this->error('记录没有找到,可能已经删除了');
        }
        
        $row->delete();
        return $this->success();
    }
    
   
    
    private function menu($selected = 1, $current_id = 0)
    {
        $array       = [];
        $tree        = new Tree();  
        $result      = Category::whereNotIn('id', $current_id)->order(["sort" => "asc", 'id' => 'asc'])->column('*', 'id');
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $selected ? 'selected' : '';
            $array[]       = $r;
        }
        
        $str = "<option value='@id' @selected >@spacer @title</option>";
        $tree->init($result);
        return $tree->getTree(0, $str, $selected);
    }
    
}
