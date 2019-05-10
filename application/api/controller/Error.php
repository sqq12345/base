<?php

namespace app\api\controller;
class Error
{
    public function index(){
        header("Location:/404.html");die;
    }
}

