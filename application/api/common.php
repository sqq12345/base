<?php

use Flc\Dysms\Client;
use Flc\Dysms\Request\SendSms;

//检查手机号码
function checkMobile($mobile)
{
    if(preg_match("/^1[345789]{1}\d{9}$/",$mobile)){
        return true;
    }else{
        return false;
    }

}

//随机数
function random_code($length = 6) {
    $min = pow(10 , ($length - 1));
    $max = pow(10, $length) - 1;
    return mt_rand($min, $max);
}

//获取ip地址
function getIpAddr()
{
    $ip=false;
    if(!empty($_SERVER["HTTP_CLIENT_IP"])){
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    }
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
        if ($ip) { array_unshift($ips, $ip); $ip = FALSE; }
        for ($i = 0; $i < count($ips); $i++) {
            if (!eregi ("^(10│172.16│192.168).", $ips[$i])) {
                $ip = $ips[$i];
                break;
            }
        }
    }
    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}

//身份证验证
function isCreditNo($id_card){
    if(strlen($id_card)==18){
        return idcard_checksum18($id_card);
    }elseif((strlen($id_card)==15)){
        $id_card=idcard_15to18($id_card);
        return idcard_checksum18($id_card);
    }else{
        return false;
    }
}

// 计算身份证校验码，根据国家标准GB 11643-1999
function idcard_verify_number($idcard_base){
    if(strlen($idcard_base)!=17){
        return false;
    }
    //加权因子
    $factor=array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
    //校验码对应值
    $verify_number_list=array('1','0','X','9','8','7','6','5','4','3','2');
    $checksum=0;
    for($i=0;$i<strlen($idcard_base);$i++){
        $checksum += substr($idcard_base,$i,1) * $factor[$i];
    }
    $mod=$checksum % 11;
    $verify_number=$verify_number_list[$mod];
    return $verify_number;
}

// 将15位身份证升级到18位
function idcard_15to18($idcard){
    if(strlen($idcard)!=15){
        return false;
    }else{
        // 如果身份证顺序码是996 997 998 999，这些是为百岁以上老人的特殊编码
        if(array_search(substr($idcard,12,3),array('996','997','998','999')) !== false){
            $idcard=substr($idcard,0,6).'18'.substr($idcard,6,9);
        }else{
            $idcard=substr($idcard,0,6).'19'.substr($idcard,6,9);
        }
    }
    $idcard=$idcard.idcard_verify_number($idcard);
    return $idcard;
}

// 18位身份证校验码有效性检查
function idcard_checksum18($idcard){
    if(strlen($idcard)!=18){
        return false;
    }
    $idcard_base=substr($idcard,0,17);
    if(idcard_verify_number($idcard_base)!=strtoupper(substr($idcard,17,1))){
        return false;
    }else{
        return true;
    }
}

//上传图片方法
function saveImage($file)
{
    if($file){
        $info = $file->move(ROOT_PATH.'public'.DS.'uploads'.DS.'image');
        if($info){
            //上传照片成功
            return 'uploads'. DS .$info->getSaveName();
        }else{
            exit(json_encode(array('code'=>'200020','msg'=>$file->getError())));
        }
    }else{
        exit(json_encode(array('code'=>'200020','msg'=>'没有上传相应的图片')));
    }

}


function read_dir_queue($dir){
    $files=array();
    $queue=array($dir);
    while($data=each($queue)){
        $path=$data['value'];
        if(is_dir($path) && $handle=opendir($path)){
            while($file=readdir($handle)){
                if($file=='.'||$file=='..') continue;
                echo $file;
                $files[] = $real_path=$path.'/'.$file;
                if (is_dir($real_path)) $queue[] = $real_path;
            }
        }
        closedir($handle);
    }
    return $files;
}

function find_dir($dir,$item){
    $files=array();
    $queue=array($dir);
    while($data=each($queue)){
        $path=$data['value'];
        if(is_dir($path) && $handle=opendir($path)){
            while($file=readdir($handle)){
                if($file=='.'||$file=='..') continue;

                if(strpos($file,$item) !== false){
                    return $path.'/'.$file;
                }
                $files[] = $real_path=$path.'/'.$file;
                if (is_dir($real_path)) $queue[] = $real_path;
            }
        }
        closedir($handle);
    }
    return '';
}

function getParents($categorys,$catId){
    $tree=array();
    foreach($categorys as $item){
        if($item['id']==$catId){
            if($item['pid']>0)
                $tree=array_merge($tree,getParents($categorys,$item['pid']));
            $tree[]=$item;
            break;
        }
    }
    return $tree;
}


function find_path($dir,$path){
    if(!is_dir($dir)) return false;

    $handle = opendir($dir);

    if($handle){
        while(($fl = readdir($handle)) !== false){
            $temp = $dir.DIRECTORY_SEPARATOR.$fl;
            //如果不加  $fl!='.' && $fl != '..'  则会造成把$dir的父级目录也读取出来
            if(is_dir($temp) && $fl!='.' && $fl != '..'){
//                echo 'dir----'.$temp."\r\n";
                find_path($temp,$path);
            }else{
                if($fl!='.' && $fl != '..'){
                    if ($fl == $path){
                        return  $path;
                    }
//                    echo $fl."\r\n";
//                  echo "filepath---$temp \r\n";
                }
            }
        }
    }
}



//保存base64图片
function saveBase64Image($base64_image_content){


    if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)){

        //图片后缀
        $type = $result[2];
        //保存位置--图片名
        $image_name=date('His').str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT).".".$type;
        $path = 'uploads'.DS.'image'.DS.date('Ymd');
        $image_url = $path.DS.$image_name;
        //创建目录
        Directory($path);
        //解码
        $decode = base64_decode(str_replace($result[1], '', $base64_image_content));
        if (file_put_contents(ROOT_PATH . 'public' . DS . $image_url, $decode)){
//            return $image_url;
            return strtr($image_url, "\\", '/');
        }else{
            exit(json_encode(array('code'=>'200022','msg'=>'图片保存失败！')));
        }
    }else{
        exit(json_encode(array('code'=>'200021','msg'=>'base64图片格式有误！')));
    }

}

//创建目录
function Directory( $dir )
{
    return  is_dir ( $dir ) or Directory(dirname( $dir )) and  mkdir ($dir,0755);

}


/**
 * 获取单例对象
 */
function get_sington_object($object_name = '', $class = null)
{

    $request = \think\Request::instance();
    
    $request->__isset($object_name) ?: $request->bind($object_name, new $class());
    
    return $request->__get($object_name);
}


//版本号对比
function versionCompare($versionA,$versionB) {
    if ($versionA>2147483646 || $versionB>2147483646) {
        throw new Exception('版本号,位数太大暂不支持!','101');
    }
    $dm = '.';
    $verListA = explode($dm, (string)$versionA);
    $verListB = explode($dm, (string)$versionB);

    $len = max(count($verListA),count($verListB));
    $i = -1;
    while ($i++<$len) {
        $verListA[$i] = intval(@$verListA[$i]);
        if ($verListA[$i] <0 ) {
            $verListA[$i] = 0;
        }
        $verListB[$i] = intval(@$verListB[$i]);
        if ($verListB[$i] <0 ) {
            $verListB[$i] = 0;
        }

        if ($verListA[$i]>$verListB[$i]) {
            return 1;
        } else if ($verListA[$i]<$verListB[$i]) {
            return -1;
        } else if ($i==($len-1)) {
            return 0;
        }
    }

}

//获取ip地址
function getIP() {
    if (getenv('HTTP_CLIENT_IP')) {
        $ip = getenv('HTTP_CLIENT_IP');
    }
    elseif (getenv('HTTP_X_FORWARDED_FOR')) {
        $ip = getenv('HTTP_X_FORWARDED_FOR');
    }
    elseif (getenv('HTTP_X_FORWARDED')) {
        $ip = getenv('HTTP_X_FORWARDED');
    }
    elseif (getenv('HTTP_FORWARDED_FOR')) {
        $ip = getenv('HTTP_FORWARDED_FOR');

    }
    elseif (getenv('HTTP_FORWARDED')) {
        $ip = getenv('HTTP_FORWARDED');
    }
    else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

 function curl($url,$data=null){

    $curl=curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);

    //设定为不验证证书和host
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);

    if(!empty($data)){
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }

    // 将curl_exec()获取的信息以文件流的形式返回，而不是直接输出
    curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);

    $output=curl_exec($curl);
    if (false===$output) {
        echo "<br/>",curl_error($curl),"<br/>";
        return false;
    }
    curl_close($curl);

    return $output;
}

//发送短信
function send_msg($mobile,$msg)
{

    //第三方库中的短信发送
    $config = [
        'accessKeyId'    => 'LTAIvwJsKsHRjEWk',
        'accessKeySecret' => 'PFhyy7X7NiQjykPMBxO68wST5zkLI1',
    ];

    $client  = new Client($config);
    $sendSms = new SendSms;
    $sendSms->setPhoneNumbers($mobile);
    $sendSms->setSignName('落槌拍卖');
    $sendSms->setTemplateCode('SMS_139231344');
    $sendSms->setTemplateParam(['title' => $msg]);
    $sendSms->setOutId('notice');
    $result = $client->execute($sendSms);
    if ($result->Code == "OK")
    {
        return true;
    }
    else
    {
        return false;
    }
}

function myTrim($str)
{
    $search = array(" ","　","\n","\r","\t");
    $replace = array("","","","","");
    return str_replace($search, $replace, $str);
}

/**
 * 生成accesstoken
 * @param $app_key string  app_key
 * @param $app_id int app_id
 * @return string
 */
function generate_access_token()
{
    $time = time();
    $sign = md5(date("Ymd").'_'.config('API_KEY'));
    $token = base64_encode("{$time}_{$sign}");
    return $token;
}