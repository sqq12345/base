<?php

namespace app\api\controller;
use think\Controller;
use \Firebase\JWT\JWT;

class Index extends Controller
{

    public function index(){
        $key = date("Ymd").'_'.config('API_KEY');
        echo md5($key);
    }

  


}

