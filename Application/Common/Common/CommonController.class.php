<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 22:31
 */

namespace Common\Common;


use Think\Controller;

class CommonController extends Controller {
    public $setUser = true;//是否必须完善资料

    public function __construct(){
        //判断用户是否已经登录
        if (!session("?user")) {
            //die("没有session");
            $this->redirect('Admin/Login/index');
        }else{
            $user = session("user");
            if(!empty($user["signUp"])){
                //新注册用户必须完善资料
                if($this->setUser){
                    $this->redirect('Admin/Set/index');
                }
            }else{
                session(null);
                session("user",$user);
            }
        }
        parent::__construct();
    }


    public function arr_sort($arr,$str,$type = "int"){
        if(empty($arr)){
            return $arr;
        }
        $arrList = [];
        foreach($arr as $list){
            $list[$str."Sort"] = 1;
            array_push($arrList,$list);
        }
        if(empty($arrList[0])){
            return $arr;
        }

        for($i =0;$i<count($arrList);$i++){
            for($j = $i+1;$j<count($arrList);$j++){
                if(intval($arrList[$i][$str]) < intval($arrList[$j][$str])){
                    $arrList[$j][$str."Sort"] = $arrList[$i][$str."Sort"];
                    $arrList[$i][$str."Sort"] ++;

                    $emptyList = $arrList[$i];
                    $arrList[$i] = $arrList[$j];
                    $arrList[$j] = $emptyList;
                }elseif(intval($arrList[$i][$str]) == intval($arrList[$j][$str])){
                    $arrList[$j][$str."Sort"] = $arrList[$i][$str."Sort"];
                }else{
                    $arrList[$j][$str."Sort"] = $arrList[$i][$str."Sort"]+1;
                }
            }
        }
        return $arrList;
    }
}