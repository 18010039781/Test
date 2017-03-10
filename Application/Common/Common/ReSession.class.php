<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/18
 * Time: 12:20
 */
namespace Common\Common;

class ReSession{
    public function reSession($id){
        $user = D("User");
        $userInfo = D("UserInfo");
        $department = M("Department");
        $quarters = M("Quarters");
        $level = M("Level");
        $rs = $userInfo->where(array("uid"=>$id))->select();
        if($rs){
            $userList = $rs[0];
            $rs = $department->where(array("id"=>$userList["usertype"]))->select();
            $userList["usertype"] = $rs[0]["value"];
            $rs = $quarters->where(array("id"=>$userList["userpost"]))->select();
            $userList["userpost"] = $rs[0]["value"];
            $rs = $level->where(array("id"=>$userList["posttype"]))->select();
            $userList["posttype"] = $rs[0]["value"];
        }else{
            $userList["signUp"] = $id;
        }
        $rs = $user->where(array("id"=>$id))->select();
        $userList["userAccName"] = $rs[0]["username"];

        session(null);
        session("user",$userList);
    }
}