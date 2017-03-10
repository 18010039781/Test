## 简介

项目使用ThinkPHP框架开发的积分管理系统，是我学习thinkPHP框架后写的一个小demo。不足之处：业务逻辑没有完全分离，有写方法直接写在Action里了。

项目包括的功能：

*  登陆、注册、找回
*  验证码
*  导出Excel文件
*  添加、删除、修改积分
*  职位与部门关联
*  图片上传

## 项目地址

  [项目测试地址](http://www.shenchao.net.cn/admin)

## 项目部署

数据库使用了：mysql<br>

  1、把项目中根目录下的test.sql导入数据库中（共7张表）<br>
  2、修改Application/Common/Conf/config.php文件里数据库的设置<br>
  3、根据不同的环境系统修改根目录下.htaccess文件的路由设置，可参考[URL重写](http://document.thinkphp.cn/manual_3_2/url_rewrite.html)。
