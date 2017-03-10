<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 20:06
 */

namespace Admin\Model;


use Think\Model;

class SvnModel extends Model {
    /*svn积分*/
    protected $_validate=array(
        array("id","require","数据不存在"),
        array("id","number","数据不合法"),
        array("uid","require","工号不能为空"),
        array("uid","number","工号格式不正确"),
        array("score","require","分值不能为空"),
        array("score","number","分值格式不正确"),
        array("scoretype","require","积分类型不能为空"),
        array("scoretype","number","积分类型格式不正确"),
        array("datatime","require","日期不能为空"),
    );
}