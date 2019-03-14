<?php
namespace app\admin\validate\cms;

use think\Validate;

class PageValid extends Validate
{
    protected $rule=[
        'title|标题'=>'require|max:255',
        'author|作者'=>'require|max:30',
        'content|单页内容'=>'require'
    ];
}