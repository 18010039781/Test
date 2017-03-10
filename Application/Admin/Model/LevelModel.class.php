<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 20:06
 */

namespace Admin\Model;


use Think\Model;

class LevelModel extends Model {
    /*svn积分*/
    protected $_validate=array(
        array("id","require","级别不存在"),
        array("id","number","级别不合法"),
        array("mid","require","岗位不存在"),
        array("mid","number","岗位不合法"),
        array("value","require","级别名字不能为空"),
    );
}