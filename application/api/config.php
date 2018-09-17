<?php
//配置文件
return [
	  	'API_KEY'      => 'yc_api_key',
    	'JWT_KEY'      => 'yc_jwt_key',
        'wx_appid' => 'wx63b0475b026c41d0', // 小程序app_id
        'wx_secret' => '964492f6bb4da8966eefc1bf15b9d5c5', // 小程序app_secret
        'base_url' => "https://base.dev.com",
        // 微信使用code换取用户openid及session_key的url地址
        'login_url' => "https://api.weixin.qq.com/sns/jscode2session?" .
        "appid=%s&secret=%s&js_code=%s&grant_type=authorization_code",
        // 微信获取access_token的url地址
        'access_token_url' => "https://api.weixin.qq.com/cgi-bin/token?" .
        "grant_type=client_credential&appid=%s&secret=%s",
        //tp 配置
        // 默认输出类型
        'default_return_type'    => 'json',
        // 默认AJAX 数据返回格式,可选json xml ...
        'default_ajax_return'    => 'json',
        // 默认JSONP格式返回的处理方法
        'default_jsonp_handler'  => 'jsonpReturn',
        // 错误显示信息,非调试模式有效
        'error_message'          => '页面错误！请稍后再试～',
        // 显示错误信息
        'show_error_msg'         => false,
        // 异常处理handle类
        'exception_handle'       => '\app\api\exception\ExceptionHandler',
];