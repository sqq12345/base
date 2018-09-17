<?php
namespace app\api\exception;


class WeChatException extends BaseException
{
    public $code = 400;
    public $msg = 'wechat  error';
    public $errorCode = 999;
}


