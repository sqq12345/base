<?php


namespace app\api\exception;


class TokenException extends BaseException
{
    public $code = 520;
    public $msg = 'Token已过期或无效Token';
    public $errorCode = 10001;
}