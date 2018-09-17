<?php

namespace app\api\model;

use think\Model;
use traits\model\SoftDelete;

class BaseModel extends Model
{
    // 软删除，设置后在查询时要特别注意whereOr
    use SoftDelete;
//    protected $autoWriteTimestamp = 'datetime';
    protected $autoWriteTimestamp = 'int';
    protected $hidden = ['delete_at'];
    // 定义时间戳字段名 每张表都需创建这三个字段
    protected $createTime = 'create_at';
    protected $updateTime = 'update_at';
    protected $deleteTime = 'delete_at';

    // 追加属性
    protected $append = [

    ];





}