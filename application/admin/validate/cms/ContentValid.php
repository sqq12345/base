<?php
namespace app\admin\validate\cms;

use think\Validate;

class ContentValid extends Validate
{
    protected $rule=[
        'title|名称'=>'require|max:15',
        'author|作者'=>'require|max:10',
        'file|图片'=>'max:204800|fileMime:image/png,image/jpeg,image/gif,image/x-png|token'
    ];
}