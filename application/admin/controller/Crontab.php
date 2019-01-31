<?php
namespace app\admin\controller;

use app\common\model\Crontab as CrontabModel;
use Cron\CronExpression;
use think\Db;
class Crontab extends Base
{
    
    public function index(){
        $keywords=$this->request->param('keywords');
        $crontab=new CrontabModel();
        
        if($keywords){
            $crontab->wherelike('title',"%{$keywords}%");
        }
        
        $list=$crontab->paginate($this->webData['list_rows']);
        foreach ($list as $k => &$v)
        {
            $cron = CronExpression::factory($v['schedule']);
            $v['nexttime'] = $cron->getNextRunDate()->getTimestamp();
        }
       
        $this->assign([
            'lists'     => $list,
            'total'     => $list->total(),
            'page'      => $list->render()
        ]);
        return $this->fetch();
    }
    
    
    function add(){
        if($this->requestType==2){            
           $ret=$this->validate($this->param['row'], 'CrontabValid');
           if($ret===true){
               if($this->check_schedule($this->param['row']['schedule'])){
                   CrontabModel::create($this->param['row']);                   
                   return $this->layerSuccess();
               }else{
                   return $this->error('周期格式不对');
               }
              
           }else{
               return $this->error($ret);
           }
        }
        return $this->fetch();
    }
    
    
    function edit($id){
        
        if($this->requestType==2){
            $crontab=CrontabModel::get($id);
           // $crontab->data($this->param['row']);
           $this->param['row']['id']=$id;
            $valid=validate('CrontabValid'); 
            if($valid->check( $this->param['row'])){
                if($this->check_schedule($this->param['row']['schedule'])){
                    $crontab->data($this->param['row'])->save();
                    return $this->layerSuccess();
                }else{
                    return $this->error('周期格式不对');
                }
                
            }else{
                return $this->error($valid->getError());
            }
        }
        $row=CrontabModel::get($id);
        $this->assign('row',$row);
        return $this->fetch();
        
    }
    
    function del($id)
    {
        $id     = $this->id;
        $result = CrontabModel::destroy(function ($query) use ($id) {
            $query->whereIn('id', $id);
        });
            if ($result) {
                return $this->deleteSuccess();
            }
            
            return $this->error('删除失败');
    }
    
    function get_schedule_future()
    {
        $time = [];
        $schedule = $this->request->post('schedule');
        $days = (int) $this->request->post('days');
        if($this->check_schedule($schedule)){
            try
            {
                $cron = CronExpression::factory($schedule);
                for ($i = 0; $i < $days; $i++)
                {
                    $time[] = $cron->getNextRunDate(null, $i)->format('Y-m-d H:i:s');
                }
            }
            catch (\Exception $e)
            {
                
            }
            
            return json(['futuretime' => $time,'code'=>1]);
        }else{
            return json(['code'=>0]);
        }
        
    }
    
    protected function check_schedule($schedule)
    {
        
        return CronExpression::isValidExpression($schedule);
        
    }
    
    function getlog($id=0){
        if($id){
            $rows=Db::name('crontab_log')->where('crontab_id',$id)->order('create_time desc')->paginate(10,true,['query'=>["id"=>$id]]);
            
            $this->assign('lists',$rows);
            $this->assign('page',$rows->render());            
            return $this->fetch();
        }else{
            echo '暂时还没有日志记录';
        }
    }
    
}