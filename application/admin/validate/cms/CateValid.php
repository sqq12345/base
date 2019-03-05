<?php
namespace app\admin\validate\cms;

use think\Validate;

class CateValid extends Validate
{
    protected $rule=[
        'title|名称'=>'require|max:15',
        'file|图片'=>'max:204800|fileMime:image/png,image/jpeg,image/gif,image/x-png|token'
    ];
}