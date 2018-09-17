<?php

namespace app\api\logic;

use  app\api\exception\WeChatException;

/**
 * 基础逻辑
 */
class Wx
{
    //小程序相关服务 获取openID
    public static function openid($code)
    {
        $url = sprintf(config('login_url'), config('wx_appid'), config('wx_secret'),$code);
        $res=curl($url);
        if ($json_obj = json_decode($res,true)){
            if (array_key_exists("errcode", $json_obj)){
                throw new WeChatException(
                    [
                        'msg' => $json_obj['errcode'].'----'.$json_obj['errmsg']
                    ]
                );
            }else{
                return $json_obj;
            }
        }else{
            throw new WeChatException();
        }
    }

}
