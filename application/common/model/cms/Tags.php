<?php

namespace app\common\model\cms;
use tools\Tree;
class Tags extends BaseModel
{
    protected $name='cms_tags';
    protected $autoWriteTimestamp=true;
    protected $createTime="create_time";
    protected $updateTime="update_time";
    //此标签下的所有文章列表
    function list(){
        return $this->hasOne('Content','tag_id','id');
    }


    function tags($selected = 1, $current_id = 0)
    {
        $array       = [];
        $tree        = new Tree();
        $result      = $this->whereNotIn('id', $current_id)->order([ 'id' => 'asc'])->column('*', 'id');
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $selected ? 'selected' : '';
            $array[]       = $r;
        }

        $str = "<option value='\$id' \$selected >\$spacer \$title</option>";
        $tree->init($result);
        return $tree->get_tree(0, $str, $selected);
    }
}
