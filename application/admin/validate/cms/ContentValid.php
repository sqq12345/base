<?php
namespace app\admin\validate\cms;

use think\Validate;

class ContentValid extends Validate
{
    protected $rule=[
        'title|名称'=>'require|max:50',
        'author|作者'=>'require|max:30',
        'file|图片'=>'max:204800|fileMime:image/png,image/jpeg,image/gif,image/x-png|token'
    ];
}