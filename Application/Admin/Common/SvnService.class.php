<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/24
 * Time: 10:06
 */

namespace Admin\Common;


class SvnService {

    //获取本周所有积分
    public function getNowWeek(){
        $svnModel = D("Svn");
        $whereList["uid"] = session("user")["id"];
        $sdefaultDate = date("Y-m-d");
        //$first =1 表示每周星期一为开始日期 0表示每周日为开始日期
        $first=1;
        //获取当前周的第几天 周日是 0 周一到周六是 1 - 6
        $w=date('w',strtotime($sdefaultDate));
        //获取本周开始日期，如果$w是0，则表示周日，减去 6 天
        $week_start=date('Y-m-d',strtotime("$sdefaultDate -".($w ? $w - $first : 6).' days'));

        $dataList["date"] = [];
        $dataList["sumScore"] = [];
        $dataList["sum"] = 0;
        for($i = 0;$i < 7;$i++){
            $sumScore = 0;
            $week_end=date('Y-m-d',strtotime("$week_start +".$i." days"));
            $startDate = $week_end;
            $endDate = date('Y-m-d',strtotime("$week_start +".($i+1)." days"));
            $week_end = explode("-",$week_end);
            array_push($dataList["date"],intval($week_end[1])."月".intval($week_end[2])."日");
            $whereList['datatime']=array('between',array($startDate,$endDate));
            $rs = $svnModel->where($whereList)->select();
            foreach($rs as $svn){
                $sumScore +=intval($svn["score"]);
            }
            $dataList["sum"] += $sumScore;
            array_push($dataList["sumScore"],$sumScore);
        }

        return $dataList;
    }

    //获取所有用户某段时间内的所有积分
    public function getSumScoreToDate($bool = false,$startDate="2015-01-01",$endDate = 1){
        $svnModel = D("Svn");
        $userInfoModel = D("UserInfo");
        $userInfoList = $userInfoModel->select();
        if($endDate == 1){
            $endDate = date("Y-m-d");
        }
        $endDate = date('Y-m-d',strtotime("$endDate +1 days"));
        $whereList['datatime']=array('between',array($startDate,$endDate));
        if($bool){
            $dataList["sum"] = 0;
        }
        foreach($userInfoList as $userInfo){
            $whereList["uid"] = $userInfo["id"];
            $svnList = $svnModel->where($whereList)->select();
            $dataList[$userInfo["id"]] = array(
                "name" => $userInfo["username"],
                "type" => $userInfo["type"],      //员工类型
                "uid" => $userInfo["id"],
                "sumScore" => 0,                  //总积分
                "numScore" => count($svnList),    //总的提交次数
                "numYesScore" => 0,              //无效的提交次数
            );
            foreach($svnList as $svn){
                if($svn["score"] == 0){
                    $dataList[$userInfo["id"]]["numYesScore"]++;
                }
                $dataList[$userInfo["id"]]["sumScore"] += intval($svn["score"]);
                if($bool){
                    $dataList["sum"] += intval($svn["score"]);
                }
            }
        }

        return $dataList;
    }

    //获取当前用户当天的积分情况
    public function getNowUserScore(){
        $svnModel = D("Svn");
        $dataList = [];
        $week_end = date("Y-m-d");
        $startDate = $week_end;
        $endDate = date('Y-m-d',strtotime("$week_end +1 days"));
        $whereList['datatime']=array('between',array($startDate,$endDate));
        $whereList["uid"] = session("user")["id"];
        $svnList = $svnModel->where($whereList)->select();
        $dataList["count"] = count($svnList);
        $dataList["num"] = 0;
        $dataList["sum"] = 0;
        foreach($svnList as $svn){
            if($svn["score"] != 0){
                $dataList["num"]++;
            }
            $dataList["sum"] += $svn["score"];
        }
        return $dataList;
    }


    //获取所有积分
    public function getSvnAll($start_end){
        $whereList['datatime']=array('between',$start_end);

        $svnModel = D("Svn");
        $userInfoModel = D("UserInfo");
        $scoreTypeRs = D("ScoreType")->select();
        $scoreTypeList = [];
        foreach($scoreTypeRs as $scoreType){
            $scoreTypeList[$scoreType["id"]] = $scoreType["scorename"];
        }
        $svnList = $svnModel->where($whereList)->select();
        $arrList = [];
        foreach($svnList as $svn){
            $svn["scorename"] = $scoreTypeList[$svn["scoretype"]];
            $arr = $svn;
            $map["id"] = $svn["uid"];
            $rs = $userInfoModel->where($map)->select();
            $arr["username"] = $rs[0]["username"];
            if($rs[0]["type"] == 1){
                $arr["type"] = "正式员工";
            }else{
                $arr["type"] = "试用期员工";
            }
            array_push($arrList,$arr);
        }
        return $arrList;
    }

    //获取所有积分(导出）
    public function getSvnAllToExcel(){
        $svnModel = D("Svn");
        $userInfoModel = D("UserInfo");

        $scoreTypeRs = D("ScoreType")->select();
        $scoreTypeList = [];
        foreach($scoreTypeRs as $scoreType){
            $scoreTypeList[$scoreType["id"]] = $scoreType["scorename"];
        }
        $svnList = $svnModel->select();
        $arrList = [];
        foreach($svnList as $svn){
            $arr = [];
            $map["id"] = $svn["uid"];
            $rs = $userInfoModel->where($map)->select();
            if($rs[0]["type"] == 1){
                array_push($arr,"正式员工");
            }else{
                array_push($arr,"试用期员工");
            }
            array_push($arr,$svn["uid"]);
            array_push($arr,$rs[0]["username"]);
            array_push($arr,$svn["datatime"]);
            array_push($arr,$scoreTypeList[$svn["scoretype"]]);
            array_push($arr,$svn["text"]);
            array_push($arr,$svn["score"]);
            array_push($arrList,$arr);
        }
        return $arrList;
    }


    //获取今年及去年所有积分
    public function getSumScoreToYear(){
        $svnModel = D("Svn");
        $userInfoModel = D("UserInfo");
        $userInfoList = $userInfoModel->select();
        $day = intval(date("Y"));
        $oldDay = ($day-1)."-01-01";
        $lastDay = ($day+1)."-01-01";
        $whereList['datatime']=array('between',array($oldDay,$lastDay));
        foreach($userInfoList as $userInfo){
            $whereList["uid"] = $userInfo["id"];
            $svnList = $svnModel->where($whereList)->select();
            $dataList[$userInfo["id"]] = array(
                "name" => $userInfo["username"],
                "type" => $userInfo["type"],      //员工类型
                "uid" => $userInfo["id"]
            );
            $dataList[$userInfo["id"]]["old"] = 0;
            $dataList[$userInfo["id"]]["now"] = 0;
            foreach($svnList as $svn){
                $svnDatetime = $svn["datatime"];
                if(!empty($svnDatetime)){
                    $svnDatetime = explode("-",$svnDatetime);
                    $svnDatetime = intval($svnDatetime[0]);
                }
                if($svnDatetime == $day){
                    $dataList[$userInfo["id"]]["now"] += intval($svn["score"]);
                }else{
                    $dataList[$userInfo["id"]]["old"] += intval($svn["score"]);
                }
            }
        }

        return $dataList;
    }


    public function getSvnToUser($bool=false,$startDate='2015-1-1',$endDate='2017-1-1'){
        $svnModel = D("Svn");
        $userId = session("user")["id"];
        $map["uid"] = $userId;
        if($bool){
            $map['datatime']=array('between',array($startDate,$endDate));
        }
        $svnList = $svnModel->where($map)->select();
        $arrList =[];
        foreach($svnList as $svn){
            $arr = [];
            array_push($arr,$svn["uid"]);
            array_push($arr,session("user")["username"]);
            array_push($arr,$svn["datatime"]);
            array_push($arr,$svn["text"]);
            array_push($arrList,$arr);
        }
        return $arrList;
    }

    public function getSvnCountToUser($startDate){
        $firstday = date('Y-m-01', strtotime($startDate));
        $lastday = date('Y-m-d', strtotime("$firstday +1 month -1 day"));
        $lastMonth = date('Y-m-d', strtotime("$firstday +1 month"));
        $monthDay = explode("-",$lastday);
        $monthDay = intval($monthDay[2]);
        $arrList =[];

        $svnModel = D("Svn");
        $userInfoModel = D("UserInfo");
        $userList = $userInfoModel->select();
        foreach($userList as $user){
            $map = [];
            $arr = [];
            $dayList = [];
            $num = 0;
            array_push($arr,$user["id"]);
            array_push($arr,$user["username"]);
            $map["uid"] = $user["id"];
            $map['datatime']=array('between',array($firstday,$lastMonth));

            $svnList = $svnModel->where($map)->select();
            array_push($arr,count($svnList));

            foreach($svnList as $svn){
                if(!empty($svn['datatime'])){
                    $dataTime = $svn['datatime'];
                    $dataTime = explode(" ",$dataTime);
                    $dataTime = $dataTime[0];
                    if(!in_array($dataTime,$dayList)){
                        array_push($dayList,$dataTime);
                    }
                }
            }

            for($i =0;$i<$monthDay;$i++){
                $startDate = date('Y-m-d', strtotime("$firstday +$i day"));
                if(!in_array($startDate,$dayList)){
                    $num ++;
                }
            }
            array_push($arr,$num);
            array_push($arrList,$arr);

        }
        return $arrList;
    }
}