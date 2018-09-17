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
        if ($value == $this->get_access_token())
        {
            return true;
        }
        return false;
    }

    // 获取访问token
    private function get_access_token()
    {
        $key = date("Ymd").'_'.config('API_KEY');
        return md5($key);
    }
}
