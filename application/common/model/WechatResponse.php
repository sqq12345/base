<?php

namespace app\common\model;

use think\Model;

class WechatResponse extends Model
{

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    function getStatusTextAttr(){
        if($this->getAttr('status')==1){
            return '启用';
        }else{
            return '禁止';
        }
    }
    
    
}
