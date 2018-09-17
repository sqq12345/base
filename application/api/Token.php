<?php

namespace app\api;
use \Firebase\JWT\JWT;
use think\Request;
use app\api\exception\TokenException;


class Token
{
    /**
     * 签名方法
     */
    public static function jwtTokenSign($data)
    {

        $key =  self::generateTokenKey();

        $token = [
            "iss"   => "centos",            // 签发者
            "iat"   => time(),              // 签发时间
            "exp"   => time() + 30*24*60*60,// 过期时间
            "aud"   => 'web',               // 接收方
            "sub"   => 'all',               // 面向的用户
            "data"  => $data
        ];
        $jwt = JWT::encode($token, $key);
        $data['user_token'] = $jwt;
        return $data;
    }

    // 解密user_token
    public  static function decoded_user_token()
    {
        $key =  self::generateTokenKey();
        $token = Request::instance()->header('token');
        try{
            $decoded = JWT::decode($token,$key, array('HS256'));
            return (array) $decoded;
        }catch(\Exception $e){

        }
        throw new TokenException();
    }

    //获取uid
    public  static function uid()
    {
        $result =self::decoded_user_token();
        if ((bool)($result["exp"] - time())) {
            $user = json_decode(json_encode($result['data']), true);
            return $user['uid'];
        }
        throw new TokenException();
    }

    //安全的获取uid
    public  static function safe_uid()
    {
        $uid = 0;
        $key =  self::generateTokenKey();
        $token = Request::instance()->header('token');
        try{
            $result = (array)JWT::decode($token,$key, array('HS256'));
            if ((bool)($result["exp"] - time())) {
                $user = json_decode(json_encode($result['data']), true);
                return $user['uid'];
            }
        }catch(\Exception $e){

        }
        return $uid;
    }

    //获取userInfo
    public static function userInfo()
    {
        $result =self::decoded_user_token();
        if (count($result)) {
            if ((bool)($result["exp"] - time())) {
                return json_decode(json_encode($result['data']), true);
            }
        }
        throw new TokenException();
    }

    // 生成key
    public static  function generateTokenKey()
    {
        return config('API_KEY') .'_'. config('JWT_KEY');
        return md5($tokenSalt);
    }


}