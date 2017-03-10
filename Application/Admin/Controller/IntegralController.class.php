<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 21:11
 */

namespace Admin\Controller;


use Admin\Common\ExcelService;
use Admin\Common\SvnService;
use Common\Common\CommonController;

class IntegralController extends CommonController {

    public function index(){
        $userList = D("UserInfo")->select();
        $scoreTypeList = D("ScoreType")->select();
        $day = date("Y-m-d");
        $dateGet = I("date",$day);
        $firstDay = date("Y-m-01",strtotime($dateGet));
        $lastDay = date("Y-m-d",strtotime("$firstDay +1 month"));

        $svnService = new SvnService();
        $svnList = $svnService->getSvnAll(array($firstDay,$lastDay));

        $dateGet = explode("-",$dateGet);
        $dateGet = $dateGet[0]."-".$dateGet[1];
        $this->assign("svnList",$svnList);
        $this->assign("userList",$userList);
        $this->assign("scoreTypeList",$scoreTypeList);
        $this->assign("dateGet",$dateGet);
        $this->display();
    }

    public function month(){
        $day = date("Y-m-d");
        $dateGet = I("date",$day);
        $firstDay = date("Y-m-01",strtotime($dateGet));
        $lastDay = date("Y-m-d",strtotime("$firstDay +1 month"));
        $svnService = new SvnService();
        $svnList = $svnService->getSumScoreToDate(false,$firstDay,$lastDay);
        $arrModel = array(
            "numOne"=>0,
            "numTwo"=>0,
            "numThr"=>0
        );
        $count = array(
            "formal"=>$arrModel,
            "tryout"=>$arrModel,
            "count"=>$arrModel
        );
        foreach($svnList as $val){
            if($val["type"] == 1){
                $count["formal"]["numOne"]+=$val["sumScore"];
                $count["formal"]["numTwo"]+=$val["numScore"];
                $count["formal"]["numThr"]+=$val["numYesScore"];
            }else{
                $count["tryout"]["numOne"]+=$val["sumScore"];
                $count["tryout"]["numTwo"]+=$val["numScore"];
                $count["tryout"]["numThr"]+=$val["numYesScore"];
            }
            $count["count"]["numOne"]+=$val["sumScore"];
            $count["count"]["numTwo"]+=$val["numScore"];
            $count["count"]["numThr"]+=$val["numYesScore"];
        }

        if(!empty($svnList)){
            $svnList = $this->arr_sort($svnList,"sumScore");
            $svnList = $this->arr_sort($svnList,"numScore");
            $svnList = $this->arr_sort($svnList,"numYesScore");
        }

        $dateGet = explode("-",$dateGet);
        $dateGet = $dateGet[0]."-".$dateGet[1];
        $this->assign("svnList",$svnList);
        $this->assign("count",$count);
        $this->assign("dateGet",$dateGet);
        $this->display();
    }

    public function year(){
        $svnService = new SvnService();
        $day = intval(date("Y"));
        $svnList = $svnService->getSumScoreToYear();

        $arrModel = array(
            "numOne"=>0,
            "numTwo"=>0,
            "numThr"=>0
        );
        $count = array(
            "formal"=>$arrModel,
            "tryout"=>$arrModel,
            "count"=>$arrModel
        );
        foreach($svnList as $key => $val){
            $svnList[$key]["oldPer"] = intval($val["old"]) * 13; //去年绩效
            $svnList[$key]["nowPer"] = intval($val["now"]) * 13; //今年绩效
            if($val["type"] == 1){
                $count["formal"]["numOne"]+=$val["old"];
                $count["formal"]["numTwo"]+=$val["now"];
                $count["formal"]["numThr"]+=$svnList[$key]["oldPer"];
                $count["formal"]["numFou"]+=$svnList[$key]["nowPer"];
            }else{
                $count["tryout"]["numOne"]+=$val["old"];
                $count["tryout"]["numTwo"]+=$val["now"];
                $count["tryout"]["numThr"]+=$svnList[$key]["oldPer"];
                $count["tryout"]["numFou"]+=$svnList[$key]["nowPer"];
            }
            $count["count"]["numOne"]+=$val["old"];
            $count["count"]["numTwo"]+=$val["now"];
            $count["count"]["numThr"]+=$svnList[$key]["oldPer"];
            $count["count"]["numFou"]+=$svnList[$key]["nowPer"];
        }

        $this->assign("svnList",$svnList);
        $this->assign("count",$count);
        $this->assign("day",$day);
        $this->display();
    }


    public function exportExcel(){
        $ExcelService = new ExcelService();
        $svnService = new SvnService();

        $headerData =array("员工类别","工号","姓名","日期","积分类型","具体内容","分值");
        $svnList = $svnService->getSvnAllToExcel();
        $ExcelService->excel('积分明细',$headerData,$svnList);
    }

    public function addSvn(){
        $svnService = D("Svn");
        $svnList = array(
            "uid" => intval(I("uid")),
            "datatime" => I("datatime"),
            "scoretype" => intval(I("scoretype")),
            "score" => intval(I("score")),
            "text" => I("text")
        );
        if($svnService->create($svnList)){
            $rs = $svnService->add($svnList);
            if($rs){
                $dataTime = I("datatime");
                $dataTime = explode("-",$dataTime);
                $dataTime = $dataTime[0]."-".$dataTime[1];
                $this->success("添加成功！","/Admin/integral/index/date/".$dataTime,5);
            }else{
                $this->error("添加失败！");
            }
        }else{
            $this->error("添加失败！".$svnService->getError());
        }
    }

    public function saveSvn(){
        $svnService = D("Svn");
        $svnList = array(
            "id" => intval(I("id")),
            "uid" => intval(I("uid")),
            "datatime" => I("datatime"),
            "scoretype" => intval(I("scoretype")),
            "score" => intval(I("score")),
            "text" => I("text")
        );
        if($svnService->create($svnList)){
            $rs = $svnService->save($svnList);
            if($rs){
                $dataTime = I("datatime");
                $dataTime = explode("-",$dataTime);
                $dataTime = $dataTime[0]."-".$dataTime[1];
                $this->success("修改成功！","/Admin/integral/index/date/".$dataTime,5);
            }else{
                $this->error("修改失败！");
            }
        }else{
            $this->error("修改失败！".$svnService->getError());
        }
    }
}