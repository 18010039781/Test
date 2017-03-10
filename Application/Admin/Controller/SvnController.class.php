<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 21:51
 */

namespace Admin\Controller;


use Admin\Common\ExcelService;
use Admin\Common\SvnService;
use Common\Common\CommonController;

class SvnController extends CommonController {

    public function index(){
        $day = date("Y-m-d");
        $dateGet = I("date",$day);
        $firstDay = date("Y-m-01",strtotime($dateGet));
        $lastDay = date("Y-m-d",strtotime("$firstDay +1 month"));

        $svnService = new SvnService();
        $svnList = $svnService->getSvnToUser(true,$firstDay,$lastDay);

        $dateGet = explode("-",$dateGet);
        $dateGet = $dateGet[0]."-".$dateGet[1];
        $this->assign("svnList",$svnList);
        $this->assign("dateGet",$dateGet);
        $this->display();
    }

    public function count(){
        $day = date("Y-m-d");
        $dateGet = I("date",$day);

        $svnService = new SvnService();
        $svnList = $svnService->getSvnCountToUser($dateGet);

        $dateGet = explode("-",$dateGet);
        $dateGet = $dateGet[0]."-".$dateGet[1];
        $this->assign("svnList",$svnList);
        $this->assign("dateGet",$dateGet);
        $this->display();
    }


    public function exportExcel(){
        $ExcelService = new ExcelService();
        $svnService = new SvnService();
        $userName = session("user")["username"];

        $headerData =array("工号","姓名","日期","具体内容");
        $svnList = $svnService->getSvnToUser();
        $ExcelService->excel($userName.'的SVN明细',$headerData,$svnList);
    }

    public function exportExcelCount(){
        $today = date("Y-m-d");
        $dateGet = I("date",$today);
        $day = date('Y年m月', strtotime($dateGet));
        $ExcelService = new ExcelService();
        $svnService = new SvnService();

        $headerData =array("工号","姓名","提交次数","未提交天数");
        $svnList = $svnService->getSvnCountToUser($dateGet);
        $ExcelService->excel($day.'SVN提交统计',$headerData,$svnList);
    }
}