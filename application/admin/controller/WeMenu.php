<?php

namespace app\admin\controller;


use app\common\model\WechatResponse;
use EasyWeChat\Foundation\Application;
use think\Exception;
use EasyWeChatComposer\EasyWeChat;
use EasyWeChat\Factory;
use think\Config;
use EasyWeChat\Kernel\Exceptions\HttpException;

/**
 * 菜单管理
 *
 * @icon fa fa-list-alt
 */
class WeMenu extends Base
{

    protected $wechatcfg = NULL;

    public function _initialize()
    {
        parent::_initialize();
        $this->wechatcfg = \app\common\model\WechatConfig::get(['name' => 'menu']);
    }

    /**
     * 查看
     */
    public function index()
    {        
        $all = WechatResponse::column('eventkey,title');
        $config='{"site":{"name":"FastAdmin","cdnurl":"","version":"1.1.1","timezone":"Asia\/Shanghai","languages":{"backend":"zh-cn","frontend":"zh-cn"}},"upload":{"cdnurl":"","uploadurl":"ajax\/upload","bucket":"local","maxsize":"10mb","mimetype":"jpg,png,bmp,jpeg,gif,zip,rar,xls,xlsx","multipart":[],"multiple":false},"modulename":"admin","controllername":"index","actionname":"index","jsname":"wechat_menu","moduleurl":"\/admin","language":"zh-cn","fastadmin":{"usercenter":true,"login_captcha":true,"login_failure_retry":true,"login_unique":false,"login_background":"\/assets\/img\/loginbg.jpg","multiplenav":false,"checkupdate":false,"version":"1.0.0.20181210_beta","api_url":"https:\/\/api.fastadmin.net"},"referer":null,"__PUBLIC__":"\/","__ROOT__":"\/","__CDN__":""}';
        $this->view->assign('responselist', $all);
        $this->assign('config',$config);
        $this->view->assign('menu', (array)json_decode($this->wechatcfg->value, TRUE));
        $reponses=WechatResponse::where('status',1)->column('eventkey,title');
        $this->assign('reponses',$reponses);
        return $this->fetch();
    }

    /**
     * 修改
     */
    public function edit($ids = NULL)
    {
        $menu = $this->request->post("menu");
        $menu=html_entity_decode($menu); 
        $menu=(array)json_decode($menu, TRUE);
        //dump($menu);die;
        foreach ($menu as $index => &$item) {
            //dump($item);die;
            if (isset($item['sub_button'])) {
                foreach ($item['sub_button'] as &$subitem) {
                    if ($subitem['type'] == 'view') {
                        $allowFields = ['type', 'name', 'url'];
                        $subitem = ['type' => $subitem['type'], 'name' => $subitem['name'], 'url' => $subitem['url']];
                    } else if ($subitem['type'] == 'miniprogram') {
                        $allowFields = ['type', 'name', 'url', 'appid', 'pagepath'];
                        $subitem = ['type' => $subitem['type'], 'name' => $subitem['name'], 'url' => $subitem['url'], 'appid' => $subitem['appid'], 'pagepath' => $subitem['pagepath']];
                    } else {
                        $allowFields = ['type', 'name', 'key'];
                        $subitem = ['type' => $subitem['type'], 'name' => $subitem['name'], 'key' => $subitem['key']];
                    }
                    $subitem = array_intersect_key($subitem, array_flip($allowFields));
                }
            } else {
                if ($item['type'] == 'view') {
                    $allowFields = ['type', 'name', 'url'];
                } else if ($item['type'] == 'miniprogram') {
                    $allowFields = ['type', 'name', 'url', 'appid', 'pagepath'];
                } else {
                      $allowFields = ['type', 'name', 'key'];
            }
                $item = array_intersect_key($item, array_flip($allowFields));
            }
        }
        $this->wechatcfg->value = json_encode($menu, JSON_UNESCAPED_UNICODE);
        $this->wechatcfg->save();
        $this->success();
    }

    /**
     * 同步
     */
    public function sync($ids = NULL)
    {
        $config=Config::get('wechat');
        
        $app = Factory::officialAccount($config);
        $menu = json_decode($this->wechatcfg->value, TRUE);
        try {
            $app->menu->create($menu);
            
            return $this->success();
            /* foreach ($menu as $k => $v) {
                if (isset($v['sub_button'])) {
                    foreach ($v['sub_button'] as $m => $n) {
                        if ($n['type'] == 'click' && isset($n['key']) && !$n['key']) {
                            $hasError = true;
                            break 2;
                        }
                    }
                } else if ($v['type'] == 'click' && isset($v['key']) && !$v['key']) {
                    $hasError = true;
                    break;
                }
            }
            if (!$hasError) {
                try {
                    $ret = $app->menu->add($menu);
                } catch (\EasyWeChat\Core\Exceptions\HttpException $e) {
                    $this->error($e->getMessage());
                }
                if ($ret->errcode == 0) {
                    $this->success();
                } else {
                    $this->error($ret->errmsg);
                }
            } else {
                $this->error('Invalid parameters');
            } */
        } catch (HttpException $e) {
            $this->error($e->getMessage());
        }
    }

}
