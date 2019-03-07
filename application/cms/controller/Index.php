<?php

namespace app\cms\controller;

use think\Controller;
use think\Request;
use fast\Tree;
use app\common\model\cms\Category;
use app\common\model\cms\Banners;
use app\common\model\cms\Content;
use app\common\model\cms\Config;

class Index extends Controller
{
    
    protected $template='flat/';
    
    function __construct(){
        parent::__construct();
        
        $this->view->engine->layout($this->template.'layout');
        $menus=$this->getMenus();       
        $banner=$this->getBanner();
        $config=Config::order('id asc')->column('code,content');
        
        $this->assign([
            'menus'=>$menus,
            'banners'=>$banner,
            'current'=>0,
            'config'=>$config
        ]);
    }
    //首页
    function Index()
    {
        
        return $this->fetch($this->template.'index');
    }

    //标签列表
    function tag($id=0){        
        if($id==0){
            return $this->redirect('index');
        }
        $num=$this->request->param('num',10);
        $where['query']['id'] = $id;
        $data=Content::where('tag_id',$id)->order('id desc')->paginate($num,false,$where);
        $current=Category::get(['tag_id'=>$id]);
         
        if($current){
            $this->assign('current',$current->id);        
        }else{
            $this->assign('current',0); 
        }
       
        $this->assign(['data'=>$data,'page'=>$data->render()]);        
        return  $this->fetch($this->template.'tag');
        
          
    } 
    //内容页
    function content($id=0){
        if($id==0){
            return $this->redirect('index');
        }        
        $data=Content::get($id);
        $this->assign('info',$data);
        
        //上一篇 
        $pre=Content::order('id desc')->where('id','<',$id)->where('tag_id',$data->tag_id)->find();
        $pre_data=[];
        if($pre){
            $pre_data=[
                'title'=>$pre->title,
                'url'=>url('',['id'=>$pre->id])
            ];
        }
        
        //下一篇 
        $next=Content::order('id asc')->where('id','>',$id)->where('tag_id',$data->tag_id)->find();
        $next_data=[];
        if($next){
            $next_data=[
                'title'=>$next->title,
                'url'=>url('',['id'=>$next->id])
            ];
        }
        
        $this->assign(['pre_data'=>$pre_data,'next_data'=>$next_data]);
        return $this->fetch($this->template.'detail');
    }
    
    
    //获取导航数组
   protected  function getMenus(){
        $arr=Category::where('is_nav','1')->order('sort desc,id asc')->select();        
        $tree=new Tree();
        $tree->init($arr);
        $data=$tree->getTreeArray(0);
        $ret[0]=['title'=>'首页','id'=>0,'childlist'=>[]];
        foreach($data as $v){           
            $ret[]=$v->toArray();
        }
        
        $this->setMenuUrl($ret);
        return $ret;
        
    }
    
    protected function setMenuUrl(&$arr){
        foreach($arr as &$v){
            $url='';
            if($v['id']>0){
                if($v['type']==0){
                    //列表
                    $url=url('tag',['id'=>$v['tag_id']]);
                }else{
                    $url=url('content',['id'=>$v['content_id']]);
                }
                $v['url']=$url;
                
            }else{
                $v['url']=url('index');
            }
            if($v['childlist']){
                $this->setMenuUrl($v['childlist']);
            }
            
        }
    }
    
    protected function getBanner($id=0){
        $data=Banners::where(['category_id'=>$id,'status'=>1])->field('image,url,show_title,description')->select();
        $ret=[];
        foreach($data as $item){
            $tmp=$item->toArray();
            $tmp['image']='/uploads/'. $tmp['image'];
            
            if(strpos($tmp['url'],'http')<0){                 
                if( $tmp['url']){
                    $tmp['url']=url($tmp['url'],'',true,true);
                }                
            }            
            $ret[]=$tmp;
        }
        
        return $ret;
        
    }
    
}
