<?php
/**
 * 后台首页
 * @author yupoxiong <i@yufuping.com>
 */

namespace app\admin\controller;

use Parsedown;
use tools\Sysinfo;

class Index extends Base
{
  protected $extendUrl = [
    [
        'id'    => 1,
        'url'   => 'admin/extend/email',
        'icon'  => 'fa-info',
        'title' => '邮件发送',
    ],
    [
        'id'    => 2,
        'url'   => 'admin/extend/sms',
        'icon'  => 'fa-info',
        'title' => '短信发送',
    ],
    [
        'id'    => 3,
        'url'   => 'admin/extend/markdown',
        'icon'  => 'fa-info',
        'title' => 'MarkDown编辑器',
    ],
    [
        'id'    => 4,
        'url'   => 'admin/extend/qrcode',
        'icon'  => 'fa-info',
        'title' => '二维码生成',
    ],
    [
        'id'    => 5,
        'url'   => 'admin/extend/ueditor',
        'icon'  => 'fa-info',
        'title' => 'UEditor编辑器',
    ],
    [
        'id'    => 6,
        'url'   => 'admin/extend/aliyunoss',
        'icon'  => 'fa-info',
        'title' => '阿里云oss',
    ],

    [
        'id'    => 7,
        'url'   => 'admin/extend/qiniu',
        'icon'  => 'fa-info',
        'title' => '七牛云存储',
    ],

    [
        'id'    => 8,
        'url'   => 'admin/extend/excel',
        'icon'  => 'fa-info',
        'title' => 'excel',
    ],
];


    public function index()
    {

      $list   = $this->extendUrl;
      $colors = [
          'bg-aqua'   => 'bg-aqua',
          'bg-green'  => 'bg-green',
          'bg-yellow' => 'bg-yellow',
          'bg-red'    => 'bg-red',
          'bg-purple' => 'bg-purple',
          'bg-teal'   => 'bg-teal',
          'bg-navy'   => 'bg-navy',
      ];

        $sysinfo  = new Sysinfo();
        $sys_info = [
            'lang'    => $sysinfo->getLang(),
            'browser' => $sysinfo->getBrowser(),
            'ip'      => $sysinfo->getIp(),
            'city'    => $sysinfo->getCity(),
            'os'      => $sysinfo->getOS(),
            'date'    => date('Y-m-d')
        ];

        $Parsedown = new Parsedown();

        $this->assign([
            'list'   => $list,
            'colors' => $colors,
            'readme'=> $Parsedown->text(file_get_contents(ROOT_PATH.'README.md')),
            'sys'      => $sys_info,
        ]);
        return $this->fetch();
    }
}