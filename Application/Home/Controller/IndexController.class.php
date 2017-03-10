<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display();
    }

    public function test(){
        $arr = [
            0 =>[
                a=>1,
                b=>3,
                c=>3
            ],
            1=>[
                a=>2,
                b=>2,
                c=>3
            ],
            2=>[
                a=>1,
                b=>2,
                c=>3
            ]
        ];
        for($i = 0;$i < count($arr); $i++){
            for($j = $i+1;$j <count($arr);$j++){
                $temp1 = $arr[$i];
                $temp2 = $arr[$j];
                if($temp1["a"] > $temp2["a"] || ($temp1["a"] == $temp2["a"] && $temp1["b"] > $temp2["b"]) || ($temp1["a"] == $temp2["a"] && $temp1["b"] == $temp2["b"] && $temp1["c"] > $temp2["c"])){
                    $arr[$i] = $temp2;
                    $arr[$j] = $temp1;
                }
            }
        }
        var_dump($arr);

        $this->assign("aaa","shenchao");
        $this->display();
    }

    public function svg(){
        $this->display();
    }

    public function canvas(){
        $this->display();
    }
}