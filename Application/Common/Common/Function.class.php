<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/18
 * Time: 12:20
 */

function lenMinMax($str,$min,$max){
    preg_match_all("/./u",$str,$matches);
    $len = count($matches[0]);
    if($len >= $min && $len <= $max){
        return true;
    }else{
        return false;
    }
}