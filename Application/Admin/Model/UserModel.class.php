<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 20:06
 */

namespace Admin\Model;


use Think\Model;

class UserModel extends Model {
    /*用户表*/

    protected $_validate = array(
        array("username","require","用户名不能为空"),
        array('username','/^([a-zA-Z0-9]{5,15})$/','用户名必须是在5-15之间的数字、英文'),
        array("password","require","密码不能为空"),
        array('password','/^([a-zA-Z_0-9]{5,15})$/','密码必须是在5-15之间的数字、英文'),
        array("confirmPassword","password","两次密码不一致",0,"confirm"),
        array("newPassword","require","新密码不能为空"),
        array('newPassword','/^([a-zA-Z_0-9]{5,15})$/','新密码必须是在5-15之间的数字、英文'),
        array("conPassword","newPassword","两次密码不一致",0,"confirm"),
    );


}