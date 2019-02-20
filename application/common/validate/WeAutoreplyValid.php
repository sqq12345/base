<?php
namespace app\common\validate;
class WeAutoreplyValid extends Validate
{
    protected $rule = [
        'title|标题'     => 'require',
        'text|文本' => 'require|unique:WechatAutoreply',
        'eventkey|事件标识' => 'require|token',         
    ];
    
    
}