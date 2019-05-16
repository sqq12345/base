<?php

namespace app\api;
use \Firebase\JWT\JWT;
use think\Request;
use app\api\exception\TokenException;
use think\Cache;

class Token
{

   protected static $needOOS = 0; //是否需要单点登陆
    /**
     * 签名方法
     */
    public static function jwtTokenSign($data)
    {

        $key =  self::generateTokenKey();
        $nowTime = time();
        $token = [
            "iss"   => "centos",              // 签发者
            "iat"   => $nowTime,              // 签发时间
            "exp"   => $nowTime + 30*24*60*60,// 过期时间
            "aud"   => 'web',                 // 接收方
            "sub"   => 'all',                 // 面向的用户
            "jti"   => md5($nowTime),
            "data"  => $data
        ];
        $jwt = JWT::encode($token, $key);
        $data['token'] = $jwt;
        if(self::$needOOS){
          if(array_key_exists('uid',$data)){
            $uid = $data['uid'];
            Cache::set($uid,$token['jti']);
          }
        }
        
        return $data;
    }

    // 解密user_token
    public  static function decodedToken()
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

    //校验数据
    public  static function verification($result)
    {
      // 有效时间
      if (!(bool)($result["exp"] - time())) {
        throw new TokenException();
      }
      $user = json_decode(json_encode($result['data']), true);
        //单点登陆
      if(self::$needOOS){
          if(array_key_exists('uid',$user)){
            $uid = $user['uid'];
            $uJti = Cache::get($uid);
            //对比 jti 
            if($result["jti"] != $uJti){
              throw new TokenException();
            }
          }
       }
       return $user;
    }

     //安全的获取uid 不需要校验
     public static function safe_uid()
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


    //获取 - uid
    public  static function uid()
    {
        $result =self::decodedToken();
        $user = self::verification();
        return $user['uid'];
    }

   
    //获取 - userInfo
    public static function userInfo()
    {
      $result =self::decodedToken();
      return self::verification();
    }

    // 生成key
    public static  function generateTokenKey()
    {
        return config('API_KEY') .'_'. config('JWT_KEY');
        return md5($tokenSalt);
    }


}