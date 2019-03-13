<?php

namespace app\admin\controller\cms;
use tools\Tree;
use think\Request;
use app\common\model\cms\Tags as TagsModel;
use app\admin\controller\Base;
use app\admin\validate\cms\TagValid;
use app\common\model\cms\Content;

class Tags extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */

   public function index(){
       $model = new TagsModel();

        $keyword=$this->request->param('keywords');
        if($keyword){
            $model->whereLike('title',"%{$keyword}%");
        }
       $result      = $model
           ->order('id asc')
           ->column('*', 'id');

       $tree       = new Tree();
       $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
       $content_model = new Content();
       foreach ($result as $n => $r) {
           $result[$n]['create_time'] =date("Y-m-d H:i:s", $result[$n]['create_time']);
           $result[$n]['update_time'] =date("Y-m-d H:i:s", $result[$n]['update_time']);
           $result[$n]['num']  =$content_model->tag_num($r['id']);
           $result[$n]['level']          = $tree->get_level($r['id'], $result);
           $result[$n]['parent_id_node'] = ($r['parent_id']) ? ' class="child-of-node-' . $r['parent_id'] . '"' : '';

           // $result[$n]['str_manage'] =
           //     '<a href="' . url('admin_menu/edit', 'id=' . $r['id']) .
           //     '" class="btn btn-primary btn-xs"  data-confirm="2"
           //     data-type="2"  title="修改" data-toggle="tooltip"><i class="fa fa-pencil"></i></a>
           //     ';

           $result[$n]['str_manage'] =
               '<a data-id="' . $r['id'].
               '" class="AjaxButton btn btn-primary btn-xs" data-url="edit"   data-confirm="2"  
                data-type="2" data-title="修改" title="修改" data-toggle="tooltip"><i class="fa fa-pencil"></i></a>
                ';

           $result[$n]['str_manage'] .=
               '<a class="btn btn-danger btn-xs AjaxButton" data-id="'. $r['id'].'" data-url="del.html" data-toggle="tooltip" title="删除"><i class="fa fa-trash"></i></a>';

       }

       $str = "<tr id='node-\$id' data-level='\$level' \$parent_id_node>
                    <td><input type='checkbox' onclick='check_this(this)'
                     name='data-checkbox' data-id='\$id\' 
                    class='checkbox data-list-check' value='\$id' placeholder='选择/取消'>
                    </td>
                    <td>\$id</td>
                    <td>\$spacer  \$title</td>
                    <td>\$num</td>
                    <td>\$hits</td>
                    <td>\$create_time</td>
                     <td>\$update_time</td>
                    <td class='td-do'>\$str_manage</td>
                </tr>";

       $tree->init($result);
       $menu_list = $tree->get_tree(0, $str);
       $this->assign([
           'menu_list' => $menu_list
       ]);
       return $this->fetch();
   }
   
    public function add()
    {
        if($this->request->isPost()){
            $data=$this->request->param();
            $valid=new TagValid();
            if($valid->check($data)){
                $ret=TagsModel::create($data);
                return $this->layerSuccess();
            }
            
            return $this->error($valid->getError());
             
        }
        $parent_id = isset($this->param['parent_id']) ? $this->param['parent_id'] : 0;
        $selects   = (new TagsModel)->tags($parent_id);
        $this->assign([
            'selects'  => $selects
        ]);

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
        $selects  = (new TagsModel)->tags($row->parent_id);
        $this->assign([
            'selects'  => $selects,
            'row'     => $row
        ]);
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
