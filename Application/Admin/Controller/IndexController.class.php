<?php
namespace Admin\Controller;
use Admin\Common\SvnService;
use Common\Common\CommonController;

class IndexController extends CommonController {

    public function _initialize(){
    }

    public function index(){
        $day = date("Y-m-d");
        $lastDay = date("Y-m-d",strtotime("$day -1 month"));
        $svnService = new SvnService();
        $userTodayScore = $svnService->getNowUserScore();
        $scoreList = $svnService->getSumScoreToDate(true,$lastDay,$day);
        $weekList = $svnService->getNowWeek();
        $sum = $scoreList["sum"];
        unset($scoreList["sum"]);
        $scoreList = $this->arr_sort($scoreList,"sumScore");

        $this->assign("userTodayScore",$userTodayScore);
        $this->assign("scoreList",$scoreList);
        $this->assign("weekListStr",json_encode($weekList));
        $this->assign("weekList",$weekList);
        $this->assign("sum",$sum);
        $this->display();
    }

}