<?php

namespace app\common\model\cms;

class Category extends BaseModel
{
    
    protected $name='cms_category';
    
    function tag(){
        return $this->hasOne('Tags','id','tag_id');
    }
    
    function content(){
        return $this->hasOne('Content','id','content_id');
    }
    
    function getTypeTextAttr(){
        if($this->getAttr('type')==0){
            return '列表';
        }else{
            return '文章';
        }
    }
    
}
