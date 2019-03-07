<?php
namespace app\cms\widget;

use think\Controller;
/**
 * 挂件
 * @author fzf
 *
 */
class Flat extends Controller
{
    
    function map(){
        
       // return 'abd';
        return $this->fetch('flat/widget/map');
    }
    
}