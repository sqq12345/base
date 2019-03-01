<?php
namespace app\admin\validate\cms;

use think\Validate;

class TagValid extends Validate
{
    protected $rule=[
        'title|名称'=>'require|max:15|unique:cms_tags|token'
    ];
}