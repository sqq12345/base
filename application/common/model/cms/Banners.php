<?php

namespace app\common\model\cms;

use think\Model;

class Banners extends BaseModel
{
    protected $name='cms_banners';
    
    function tag(){
        return $this->hasOne('Tags','id','tag_id');
    }
    
    function content(){
        return $this->hasOne('Content','id','tag_id');
    }
    
    function getTypeTextAttr(){
        if($this->getAttr('type')==0){
            return '列表';
        }else{
            return '文章';
        }
    }
}
