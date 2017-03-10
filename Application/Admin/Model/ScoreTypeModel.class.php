<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/17
 * Time: 20:06
 */

namespace Admin\Model;


use Think\Model;

class ScoreTypeModel extends Model {
    /*svn积分*/
    protected $_validate=array(
        array("id","require","数据不存在"),
        array("id","number","数据不合法"),
        array("scorename","require","积分类型不能为空")
    );
}