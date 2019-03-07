<?php

namespace app\common\model\cms;

use think\Model;

class Banners extends BaseModel
{
    protected $name='cms_banners';
    
    function category(){
        return $this->hasOne('Category','id','category_id');
    }
    
   
}
