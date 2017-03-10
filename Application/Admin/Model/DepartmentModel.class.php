<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 20:06
 */

namespace Admin\Model;


use Think\Model;

class DepartmentModel extends Model {
    /*svn积分*/
    protected $_validate=array(
        array("id","require","部门不存在"),
        array("id","number","部门不合法"),
        array("value","require","部门名字不能为空"),
    );
}