<?php

namespace app\common\model\cms;

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

}
