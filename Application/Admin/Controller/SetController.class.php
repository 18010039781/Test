<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 21:51
 */

namespace Admin\Controller;


use Admin\Common\ExcelService;
use Common\Common\CommonController;
use Common\Common\ReSession;
use Think\Upload;

class SetController extends CommonController {

    public function __construct(){
        $this->setUser = false;
        parent::__construct();
    }

    public function _initialize(){
    }

    public function index(){
        $session = session("user");
        $userInfo = D("UserInfo");
        $mDepartment = M("Department");
        $mQuarters = M("Quarters");
        $mLevel = M("Level");
        if(!empty($session["id"])) {
            $userList = $userInfo->where(array("id"=>$session["id"]))->select();
            $userList = $userList[0];
        }else{
            $userList=array(
                "usertype"=>1,
                "posttype"=>1,
                "userpost"=>1
            );
        }
        $department=$mDepartment->select();
        $quarters = $mQuarters->where(array("id"=>$userList["userpost"]))->select();
        $quarters = $mQuarters->where(array("mid"=>$quarters[0]["mid"]))->select();
        $level = $mLevel->where(array("id"=>$userList["posttype"]))->select();
        $level = $mLevel->where(array("mid"=>$level[0]["mid"]))->select();
        $this->assign("userList",$userList);
        $this->assign("department",$department);
        $this->assign("quarters",$quarters);
        $this->assign("level",$level);

        $this->assign("departmentSize",json_encode($department));
        $this->assign("quartersSize",json_encode($quarters));
        $this->assign("levelSize",json_encode($level));
        $this->display();
    }

    //修改用户资料或完善用户资料
    public function saveUserAjax(){
        if(IS_AJAX){
            $data["status"] = 0;
            $session = session("user");
            $userInfo = D("UserInfo");
            $user = D("User");
            $postUserInfo = $_POST;
            if(!empty($postUserInfo["userinfo"])){
                $postUserInfo["username"] = I("userinfo");
                unset($postUserInfo["userinfo"]);
            }
            if(!empty($_FILES)){
                $postUserInfo["userimg"] = "";
            }
            if($userInfo->create($postUserInfo)){
                if(!empty($_POST["username"])){
                    $userList["username"] = I("username");
                    if(!$user->create($userList)){
                        $data["data"] = $user->getError();
                        $this->ajaxReturn($data);
                    }
                }

                if(!empty($_FILES) && $_FILES["userimg"]["error"] == 0){
                    $upload = new Upload();// 实例化上传类
                    $upload->maxSize   =     3145728 ;// 设置附件上传大小
                    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
                    $upload->rootPath  =      './Public/Uploads/'; // 设置附件上传根目录
                    $upload->savePath  =      './'; // 设置附件上传（子）目录
                    // 上传文件
                    $info   =   $upload->upload();
                    if(!$info) {// 上传错误提示错误信息
                        $data["data"] = $upload->getError();
                        $this->ajaxReturn($data);
                    }else{// 上传成功
                        $userInfoList["userimg"] = "./Uploads/".$info["userimg"]["savepath"]."".$info["userimg"]["savename"];
                    }
                }

                $data["status"] = 1;
                if(!empty($_POST["userinfo"])){
                    $userInfoList["username"] = I("userinfo");
                }
                if(!empty($_POST["phone"])){
                    $userInfoList["phone"] = I("phone");
                }
                if(!empty($_POST["usertype"])){
                    $userInfoList["usertype"] = intval(I("usertype"));
                }
                if(!empty($_POST["userpost"])){
                    $userInfoList["userpost"] = intval(I("userpost"));
                }
                if(!empty($_POST["posttype"])){
                    $userInfoList["posttype"] = intval(I("posttype"));
                }
                if(!empty($session["signUp"])){
                    //完善资料
                    if(!empty($userInfoList["username"])&&!empty($userInfoList["phone"])&&!empty($userInfoList["usertype"])&&!empty($userInfoList["userpost"])&&!empty($userInfoList["posttype"])&&!empty($userList["username"])){

                        $userInfoList["uid"] = $session["signUp"];
                        $rs = $userInfo->add($userInfoList);
                        if($rs){
                            $userInfoList["userAccName"] = I("username");
                            $userInfoList["id"] = $rs;

                            $reSession = new ReSession();
                            $reSession->reSession($session["signUp"]);
                        }
                    }else{
                        $data["status"] = 0;
                        $data["data"] = "未知错误";
                    }
                }else{
                    //修改资料
                    if(!empty($userInfoList)){
                        $userInfoList['id'] = $session["id"];
                        $userInfo->save($userInfoList);
                    }
                    if(!empty($userList)){
                        $userList["id"] = $session["uid"];
                        $user->save($userList);
                    }

                    $reSession = new ReSession();
                    $reSession->reSession($session["uid"]);
                }
            }else{
                $data["data"] = $userInfo->getError();
            }
            $this->ajaxReturn($data);
        }else{
            $this->redirect('Login/index');
        }
    }

    //修改密码
    public function savePassWordAjax(){
        if(IS_AJAX){
            $data["status"] = 0;
            $user = D("User");
            $session = session("user");
            if($user->create($_POST)){
                if(!empty($session["signUp"])){
                    $userList["id"] =$session["signUp"];
                }else{
                    $userList["id"] =$session["uid"];
                }
                $userList["password"] = md5(C("DB_PREFIX").I("password"));
                $rs = $user->where($userList)->select();
                if($rs){
                    $data["status"] = 1;
                    $userList["password"] = md5(C("DB_PREFIX").I("newPassword"));
                    $user->save($userList);
                }else{
                    $data["data"] = "旧密码输入有误!";
                }
            }else{
                $data["data"] = $user->getError();
            }
            $this->ajaxReturn($data);
        }else{
            $this->redirect('Login/index');
        }
    }

    //获取职位关联
    public function getPostTypeAjax(){
        if(IS_AJAX){
            $data["status"] = 1;
            $mid = I("mid");
            $type = I("type");
            $department = M("Department");
            $quarters = M("Quarters");
            $level = M("Level");
            if($type == "department"){
                $rs = $department->select();
            }else if($type == "quarters"){
                $rs = $quarters->where(array("mid"=>$mid))->select();
            }else{
                $rs = $level->where(array("mid"=>$mid))->select();
            }
            $data["data"] = $rs;
            $this->ajaxReturn($data);
        }else{
            $this->redirect('Login/index');
        }
    }

    //根据id获取同级的职位关联
    public function getPostTypeToMidAjax(){
        if(IS_AJAX){
            $data["status"] = 1;
            $id = I("id");
            $type = I("type");
            $department = M("Department");
            $quarters = M("Quarters");
            $level = M("Level");
            if($type == "department"){
                $rs = $department->select();
            }else if($type == "quarters"){
                $mid =$quarters->where(array("id"=>$id))->select();
                $mid = $mid[0]["mid"];
                $rs = $quarters->where(array("mid"=>$mid))->select();
            }else{
                $mid =$level->where(array("id"=>$id))->select();
                $mid = $mid[0]["mid"];
                $rs = $level->where(array("mid"=>$mid))->select();
            }
            $data["data"] = $rs;
            $this->ajaxReturn($data);
        }else{
            $this->redirect('Login/index');
        }
    }
    function expUser(){//导出Excel
        $xlsName  = "User";
        $xlsCell  = array(
            array('id','账号序列'),
            array('account','登录账户'),
            array('nickname','账户昵称')
        );
        $xlsModel = M('Post');
        $xlsData  = $xlsModel->Field('id,account,nickname')->select();
        $this->exportExcel($xlsName,$xlsCell,$xlsData);
    }
    //测试
    public function test(){
        $reSession = new ReSession();
        $reSession->reSession(21);
        $this->display();
    }
}