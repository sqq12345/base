<?php
namespace app\admin\validate\cms;

use think\Validate;

class ContactValid extends Validate
{
    protected $rule=[
        'user_name|名称'=>'require|max:50',
        'email|邮箱'=>'require|email',
        'subject|标题'=>'require|max:50',
        'message|内容'=>'length:10,500'
    ];
}