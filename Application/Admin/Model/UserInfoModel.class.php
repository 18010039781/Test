<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 20:06
 */

namespace Admin\Model;


use Think\Model;

class UserInfoModel extends Model {
    /*用户关联表*/
    protected $_validate=array(
        array("username","require","姓名不能为空"),
        array('username','lenMinMax','姓名长度不能大于5',0,"function",array(1,5)),
        //array("username","require","账号不能为空"),
        //array('username','/^([a-zA-Z0-9]{5,15})$/','账号必须是在5-15之间的数字、英文'),
        array("phone","require","手机号码不能为空"),
        array('phone','/^(1[34578]\d{9})$/','手机号码格式不正确'),
        array("usertype","require","所属部门不能为空"),
        array("usertype","number","所属部门格式不正确"),
        array("userpost","require","岗位信息不能为空"),
        array("userpost","number","岗位信息格式不正确"),
        array("posttype","require","所属级别不能为空"),
        array("posttype","number","所属级别格式不正确"),
    );

}