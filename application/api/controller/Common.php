<?php

namespace app\api\controller;
use app\common\controller\Api;

use app\api\Token;
use app\api\logic\Common as logicCommon; //处理相关逻辑
use app\api\logic\Wx as logicWx; //处理相关逻辑

/**
 *  公共基础接口控制器
 */
class Common extends Api
{

//    public function _initialize()
//    {
//        $this->needAccessToken = false;
//    }
    /**
     * 获取用户openid 进行操作
     */
    public function test ()
    {
        $uid = ['uid'=>1];
//      print_r(Token::jwtTokenSign($uid));
        $this->success('获取成功',Token::uid());

//        $this->error('用户名已经被占用');
//       echo logicWx::openid("*****");
    }



}