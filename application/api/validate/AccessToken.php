<?php

namespace app\api\validate;


class AccessToken extends  BaseValidate
{
    protected $rule = [
        'accesstoken' => 'require|checkToken'
    ];
    
    protected $message=[
        'accesstoken.checkToken' => 'accessToken 错误'
    ];

    protected function checkToken($value)
    {
        return $this->analysis_access_token($value);
    }


    /**
     * 生成accesstoken
     * @param $app_key string  app_key
     * @param $app_id int app_id
     * @return string
     */
    private function generate_access_token()
    {
        $time = time();
        $sign = md5(date("Ymd").'_'.config('API_KEY'));
        $token = base64_encode("{$time}_{$sign}");
        return $token;
    }

    /**
     * 解析token
     * @param $access_token
     * @return array
     */
    private function analysis_access_token($access_token)
    {
        $accessToken = base64_decode($access_token);
        $token_array = explode('_', $accessToken);// 分隔符由Token生成算法决定
        if(count($token_array)!=2){
            return false;
        }
        $time = $token_array[0];
        $sign = $token_array[1];
        // 校验时间60s 以内
        if ($time < (time() - 60) || $time > (time() + 60)) {
            return false;
        }

        $nSign = md5(date("Ymd").'_'.config('API_KEY'));
        if($sign != $nSign){
            return false;
        }
        return true;
    }



}
