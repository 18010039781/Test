<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 21:51
 */

namespace Admin\Controller;


use Common\Common\CommonController;

class SystemController extends CommonController {
    public function index(){
        $type = I("type",1);
        $mid = I("mid",1);
        $this->MID = $mid;
        $this->TYPE = $type;
        if($type == 2){
            //岗位
            $typeName = "岗位";
            $arrList = D("Quarters")->where(array("mid"=>$mid))->select();
            foreach($arrList as $key =>$val){
                $rs = D("Level")->where(array("mid"=>$val["id"]))->select();
                $arrList[$key]["num"] = count($rs);
            }

            $rs = D("Department")->where(array("id"=>$mid))->select();
            $thisNameOne = $rs[0]["value"];
            $midOne = $rs[0]["id"];
        }elseif($type == 3){
            //级别
            $typeName = "级别";
            $arrList = D("Level")->where(array("mid"=>$mid))->select();

            $rs = D("Quarters")->where(array("id"=>$mid))->select();
            $thisNameTwo = $rs[0]["value"];
            $midTwo = $rs[0]["id"];
            $rs = D("Department")->where(array("id"=>$rs[0]["mid"]))->select();
            $thisNameOne = $rs[0]["value"];
            $midOne = $rs[0]["id"];
        }else{
            //部门
            $typeName = "部门";
            $arrList = D("Department")->select();
            foreach($arrList as $key =>$val){
                $rs = D("Quarters")->where(array("mid"=>$val["id"]))->select();
                $arrList[$key]["num"] = count($rs);
            }
        }

        $this->assign("thisNameOne",$thisNameOne);
        $this->assign("thisNameTwo",$thisNameTwo);
        $this->assign("type",$type);
        $this->assign("typeName",$typeName);
        $this->assign("midOne",$midOne);
        $this->assign("midTwo",$midTwo);
        $this->assign("mid",$mid);
        $this->assign("arrList",$arrList);
        $this->display();
    }

    public function integral(){
        $scoreTypeModel = D("ScoreType");
        $arrList = $scoreTypeModel->select();
        $this->assign("arrList",$arrList);
        $this->display();
    }

    public function indexAdd(){
        $type = I("type","");
        $mid = I("mid","");
        $svnList = array();
        if(!empty($type) && is_numeric($type)){
            if($type == 1){
                $svnService = D("Department");
                $svnList = array(
                    "value" => I("value","")
                );
            }else if($type == 2){
                $svnService = D("Quarters");
                $svnList = array(
                    "value" => I("value",""),
                    "mid" => $mid
                );
            }else{
                $svnService = D("Level");
                $svnList = array(
                    "value" => I("value",""),
                    "mid" => $mid
                );
            }
        }else{
            $this->error("添加失败！数据异常。");
        }
        if($svnService->create($svnList)){
            $rs = $svnService->add($svnList);
            if($rs){
                $this->success("添加成功！","/Admin/System/index/type/$type/mid/$mid",5);
            }else{
                $this->error("添加失败！");
            }
        }else{
            $this->error("添加失败！".$svnService->getError());
        }
    }

    public function integralAdd(){
        $scoreName = I("scorename","");
        $scoreTypeModel = D("ScoreType");
        $svnList = array("scorename" => $scoreName);
        if($scoreTypeModel->create($svnList)){
            $rs = $scoreTypeModel->add($svnList);
            if($rs){
                $this->success("添加成功！","/Admin/System/integral",5);
            }else{
                $this->error("添加失败！");
            }
        }else{
            $this->error("添加失败！".$scoreTypeModel->getError());
        }
    }

    public function indexSave(){
        $type = I("type","");
        $id = I("id","");
        $mid = I("mid","");
        $svnList = array();
        if(!empty($type) && is_numeric($type)){
            if($type == 1){
                $svnService = D("Department");
                $svnList = array(
                    "value" => I("value",""),
                    "id" => $id
                );
            }else if($type == 2){
                $svnService = D("Quarters");
                $svnList = array(
                    "value" => I("value",""),
                    "mid" => $mid,
                    "id" => $id
                );
            }else{
                $svnService = D("Level");
                $svnList = array(
                    "value" => I("value",""),
                    "mid" => $mid,
                    "id" => $id
                );
            }
        }else{
            $this->error("修改失败！数据异常。");
        }
        if($svnService->create($svnList)){
            $rs = $svnService->save($svnList);
            if($rs){
                $this->success("修改成功！","/Admin/System/index/type/$type/mid/$mid",5);
            }else{
                $this->error("修改失败！");
            }
        }else{
            $this->error("修改失败！".$svnService->getError());
        }
    }

    public function integralSave(){
        $scoreName = I("scorename","");
        $id = I("id","");
        $scoreTypeModel = D("ScoreType");
        $svnList = array("scorename" => $scoreName,"id"=>$id);
        if($scoreTypeModel->create($svnList)){
            $rs = $scoreTypeModel->save($svnList);
            if($rs){
                $this->success("修改成功！","/Admin/System/integral",5);
            }else{
                $this->error("修改失败！");
            }
        }else{
            $this->error("修改失败！".$scoreTypeModel->getError());
        }
    }

    public function indexDelete(){
        if(session("user").id != 4){
            $this->error("权限不符，请重新登录");
        }
        $type = I("type","");
        $id = I("id","");
        $mid = I("mid","");
        if(!empty($type) && is_numeric($type)){
            if($type == 1){
                $svnService = D("Department");
                $svnList = array(
                    "id" => $id
                );
            }else if($type == 2){
                $svnService = D("Quarters");
                $svnList = array(
                    "id" => $id,
                    "mid" => $mid
                );
            }else{
                $svnService = D("Level");
                $svnList = array(
                    "id" => $id,
                    "mid" => $mid
                );
            }
        }else{
            $this->error("删除失败！数据异常。");
        }

        if($svnService->create($svnList)){
            $rs = $svnService->where($svnList)->delete();
            if($rs){
                $this->success("删除成功！","/Admin/System/index/type/$type/mid/$mid",5);
            }else{
                $this->error("删除失败！");
            }
        }else{
            $this->error("删除失败！".$svnService->getError());
        }
    }

    public function integralDelete(){
        if(session("user").id != 4){
            $this->error("权限不符，请重新登录");
        }
        $id = I("id","");
        $scoreTypeModel = D("ScoreType");
        $svnList = array("id" => $id);

        if($scoreTypeModel->create($svnList)){
            $rs = $scoreTypeModel->where($svnList)->delete();
            if($rs){
                $this->success("删除成功！","/Admin/System/integral",5);
            }else{
                $this->error("删除失败！");
            }
        }else{
            $this->error("删除失败！".$scoreTypeModel->getError());
        }
    }

    public function test(){
        $Ip = new \Org\Net\IpLocation("UTFWry.dat"); // 实例化类 参数表示IP地址库文件
        $area = $Ip->getlocation('192.168.1.1'); // 获取某个IP地址所在的位置

        var_dump($area);
        die($area);
    }
}