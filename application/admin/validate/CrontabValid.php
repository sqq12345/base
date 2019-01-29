<?php 
namespace app\admin\validate;

use app\common\validate\Validate;

class CrontabValid extends Validate
{
    protected $rule = [
        'title|标题'      => 'require|unique:crontab',
        'type|类型' => 'require',
        'content|类容'  => 'require',       
    ];
    
}