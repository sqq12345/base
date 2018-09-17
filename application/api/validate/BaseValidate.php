<?php

namespace app\api\validate;

use think\Request;
use think\Validate;
use app\api\exception\BaseException;

/**
 * Class BaseValidate
 * 验证类的基类
 */
class BaseValidate extends Validate
{

    public function goCheck()
    {
        $request = Request::instance();
        $params = $request->param();
        $params['accesstoken'] = $request->header('accesstoken');
        if (!$this->check($params)) {
            throw new BaseException(
                [
                    'msg' => is_array($this->error) ? implode(
                        ';', $this->error) : $this->error,
                ]);
        }
        return true;
    }

    public function getDataByRule($arrays)
    {
        if (array_key_exists('user_id', $arrays) | array_key_exists('uid', $arrays)) {
            // 不允许包含user_id或者uid，防止恶意覆盖user_id外键
            throw new BaseException([
                'msg' => '参数中包含有非法的参数名user_id或者uid'
            ]);
        }
        $newArray = [];
        foreach ($this->rule as $key => $value) {
            $newArray[$key] = $arrays[$key];
        }
        return $newArray;
    }

    protected function isPositiveInteger($value, $rule='', $data='', $field='')
    {
        if (is_numeric($value) && is_int($value + 0) && ($value + 0) > 0) {
            return true;
        }
        return $field . '必须是正整数';
    }

    protected function isNotEmpty($value, $rule='', $data='', $field='')
    {
        if (empty($value)) {
            return $field . '不允许为空';
        } else {
            return true;
        }
    }

    protected function isMobile($value)
    {
        $rule = '^1(3|4|5|7|8)[0-9]\d{8}$^';
        $result = preg_match($rule, $value);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

}