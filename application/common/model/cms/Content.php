<?php

namespace app\common\model\cms;

use think\Model;

class Content extends BaseModel
{
    protected $name='cms_content';
    
    function tag(){
        return $this->hasOne('Tags','id','tag_id');
    }

    public function tag_num($tag_id){
         return $this->where("tag_id",$tag_id)->count();
    }
}
