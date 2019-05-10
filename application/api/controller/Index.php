<?php

namespace app\api\controller;
use app\common\controller\Api;

class Index extends Api
{

    public function _initialize()
    {
        $this->needAccessToken = false;
    }

    public function index(){

//        $key = generate_access_token();
//        echo $key;
//        echo  analysis_access_token("MTU1MjcxOTUwNiwyMDE5MDMxNl95Y19hcGlfa2V5");
//        echo  $access_token;

    }



}

