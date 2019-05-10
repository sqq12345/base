<?php
namespace app\api\exception;


class WeChatException extends BaseException
{
    public $code = 521;
    public $msg = 'wechat  error';
    public $errorCode = 10000;
}


