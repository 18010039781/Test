<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 21:51
 */

namespace Admin\Controller;


use Common\Common\ReSession;
use Think\Controller;

class LoginController extends Controller {

    public function _initialize(){
    }

    public function index(){
        if (session("?user")) {
            //session("uid",session("uid"));
            $this->redirect('Admin/index/index');
        }else{
            $firstLogin = session("firstLogin");
            if(empty($firstLogin)){
                session("firstLogin","no");
                $this->assign("firstLogin","yes");
            }
            $error = I("error","","htmlspecialchars");
            if($error != ""){
                $this->assign("error",$error);
            }
            $this->display();
        }
    }

//生成验证码
    public function verify(){
        $codeType = I("type",1);
        $loginVerify = new \Think\Verify;
        $loginVerify->codeSet = '0123456789';
        $loginVerify->fontSize = 40;
        $loginVerify->length = 4;
        $loginVerify->entry($codeType);
    }

    //检测验证码
    private function check_verify($verify,$codeType){
        $verify = I('get.code');
        $codeType = I("type",1);
        $verify = $this->loginVerify->check($verify, $codeType);
        return $verify;
    }

    /*登陆表单提交*/
    public function login(){
        if(IS_POST){
            $verify = I('verify');
            $loginVerify = new \Think\Verify;
            if(!$loginVerify->check($verify, 1)){
                $this->redirect('Login/index',array("error" => "验证码不正确"));
            }
            $user = D('User');
            if($user->create($_POST)){
                $re = $user->where(array("username" => $_POST["username"]))->select();
                if(!$re){
                    $this->redirect('Login/index',array("error" => "用户名不存在"));
                }else{
                    $password = md5(C("DB_PREFIX").$_POST["password"]);
                    $re = $user->where(array("username" => $_POST["username"],"password" => $password))->select();
                    if(!$re){
                        $this->redirect('Login/index',array("error" => "密码不正确"));
                    }else{
                        $reSession = new ReSession();
                        $reSession->reSession($re[0]['id']);

                        $this->redirect('Index/index');
                    }
                }
            }else{
                $this->redirect('Login/index',array("error" => $user->getError()));
            }
        }else{
            $this->redirect('Login/index');
        }
    }

    /*注册异步提交*/
    public function signUpAjax(){
        if(IS_AJAX){
            $loginVerify = new \Think\Verify;
            $verify = I('verify');
            if(!$loginVerify->check($verify, 2)){
                $this->ajaxReturn(array("status" =>0,"data"=>"验证码不正确"));
            }
            //异步请求
            $user = D("User");
            $ajaxData["status"] = 0; //异步请求是否错误 0:错误
            $ajaxData["data"] = "";  //异步返回结果
            if($user->create($_POST)){
                $userArr["username"] = I("username");
                $userArr["password"] = I("password");
                if(!empty($userArr["username"]) && !empty($userArr["password"])){
                    if($user->where(array("username" =>$userArr["username"]))->select()){
                        $ajaxData["data"] = "用户名已存在";
                    }else{
                        $userIp = get_client_ip();
                        $rs = $user->where(array("ip" =>$userIp))->select();
                        if(count($rs) > 5){
                            $this->ajaxReturn("你已经注册过5个账号,无法继续注册");
                        }

                        $userArr["password"] =md5(C("DB_PREFIX").$userArr["password"]);
                        $userArr["sex"] = I("男");
                        $userArr["ip"] = $userIp;
                        $Ip = new \Org\Net\IpLocation("UTFWry.dat"); // 实例化类 参数表示IP地址库文件
                        $userArr["address"] = $Ip->getlocation();
                        if(!empty($userArr["address"]) && !empty($userArr["address"]["country"])){
                            $userArr["address"] = $userArr["address"]["country"];
                        }
                        $rs = $user->add($userArr);
                        if($rs){
                            $ajaxData["status"] = 1;
                            $rsList["signUp"] = $rs;
                            $rsList["userAccName"] = $userArr["username"];
                            session("user",$rsList);
                        }else{
                            $ajaxData["data"] = "数据库异常";
                        }
                    }
                }else{
                    $ajaxData["data"] = "参数不能为空";
                }
            }else{
                $ajaxData["data"] = $user->getError();
            }
            $this->ajaxReturn($ajaxData);
        }else{
            //die("error");
            $this->redirect('Login/index');
        }
    }

    /*找回密码步骤一提交*/
    public function forgetPasswordOneAjax(){
        if(IS_AJAX){
            $loginVerify = new \Think\Verify;
            $verify = I('verify');
            if(!$loginVerify->check($verify, 3)){
                $this->ajaxReturn(array("status" =>0,"data"=>"验证码不正确"));
            }

            $user = D("User");
            $userInfo = D("UserInfo");
            //异步请求
            $data["status"] = 0;
            $userList["username"] = I("username");
            $userInfoList["phone"] = I("phone");
            if($user->create($userList)){
                if($userInfo->create($userInfoList)){
                    $rs = $user->where($userList)->select();
                    if($rs){
                        $userInfoList["uid"] = $rs[0]["id"];
                        $rs = $userInfo->where($userInfoList)->select();
                        if($rs){
                            session("id",$userInfoList["uid"]);
                            $data["status"] = 1;
                        }else{
                            $data["data"] = "手机号码不正确！";
                        }
                    }else{
                        $data["data"] = "用户名不存在！";
                    }
                }else{
                    $data["data"] = $userInfo->getError();
                }
                //$userList["confirmPassword"] = I("confirmPassword");
            }else{
                $data["data"] = $user->getError();
            }

            $this->ajaxReturn($data);
        }else{
            $this->redirect('Login/index');
        }
    }

    /*找回密码步骤二提交*/
    public function forgetPasswordTwoAjax(){
        if(IS_AJAX){
            //异步请求
            $user = D("User");
            $data["status"] = 0;
            if($user->create($_POST)){
                if(!session("?id")){
                    $data["data"] = "页面停留时间过久，请刷新重试！";
                }else{
                    $data["status"] = 1;
                    $userList["id"] = session("id");
                    session(null);
                    $userList["password"] = md5(C("DB_PREFIX").I("password"));
                    $user->save($userList);
                }
            }else{
                $data["data"] = $user->getError();
            }
            $this->ajaxReturn($data);
        }else{
            $this->redirect('Login/index');
        }
    }

    /*退出系统*/
    public function out(){
        session(null);
        $this->redirect("Login/index");
    }

}