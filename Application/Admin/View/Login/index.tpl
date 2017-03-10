<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="Cache-Control" content="no-transform " />
    <meta name="Keywords" content="svn，管理系统，svn管理系统，登陆界面，用户登陆">
    <meta name="Description" content="管理系统">
    <meta name="author" content="沈超">
    <title>用户登陆</title>
    <css href="__PUBLIC__/css/bootstrap.css"/>
    <css href="__PUBLIC__/css/font-awesome.min.css"/>
    <css href="__PUBLIC__/css/login.css"/>
    <script>
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https'){
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else{
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    </script>
</head>
<body class="bg">
<div class="box-bagBox">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h2 class="work-title">SVN积分管理系统</h2>
                <form class="login-box" method="post" action="/Admin/login/login">
                    <div class="login-title">
                        <h3>用户登陆</h3>
                    </div>
                    <div class="col-md-8 col-md-offset-2">
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-user-o"></i>
                                <input type="text" name="username" class="form-control" placeholder="账号">
                            </div>
                            <div class="error-div"></div>
                        </div>
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="password" class="form-control" placeholder="密码">
                            </div>
                            <div class="error-div"></div>
                        </div>
                        <div class="login-hint">
                            <div class="col-xs-6 mb-20">
                                <div class="row">
                                    <input type="text" name="verify" class="form-control" placeholder="验证码">
                                </div>
                            </div>
                            <div class="col-xs-5 col-xs-offset-1 mb-20">
                                <div class="row">
                                    <img src="/admin/login/verify/type/1" data="1" class="pull-right verify">
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-group-justified" type="submit">登陆</button>
                        <div class="error-div">{%$error%}</div>
                    </div>
                    <ul class="list-unstyled list-inline list-login">
                        <li>
                            <a class="text-none-space" href="#" id="signUp">注册账号</a>
                        </li>
                        <li>
                            <a class="text-none-space" href="#" id="forgetPassword">忘记密码</a>
                        </li>
                    </ul>
                </form>
                <form class="login-box" style="display: none" method="post" action="">
                    <div class="login-title">
                        <h3>用户注册</h3>
                    </div>
                    <div class="col-md-8 col-md-offset-2">
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-user-o"></i>
                                <input type="text" name="username" class="form-control" placeholder="账号">
                            </div>
                            <div class="error-div"></div>
                        </div>

                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="password" class="form-control" placeholder="密码">
                            </div>
                            <div class="error-div"></div>
                        </div>

                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="confirmPassword" class="form-control" placeholder="确认密码">
                            </div>
                            <div class="error-div"></div>
                        </div>

                        <div class="login-hint">
                            <div class="col-xs-6 mb-20">
                                <div class="row">
                                    <input type="text" name="verify" class="form-control" placeholder="验证码">
                                </div>
                            </div>
                            <div class="col-xs-5 col-xs-offset-1 mb-20">
                                <div class="row">
                                    <img src="/admin/login/verify/type/2" data="2" class="pull-right verify">
                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-primary" type="submit">注册</button>
                            <button class="btn btn-default form-return" date="0" type="button">返回</button>
                        </div>
                    </div>
                </form>
                <form class="login-box" style="display: none" method="post" action="" onsubmit="return false;">
                    <div class="login-title">
                        <h3>密码找回</h3>
                    </div>
                    <div class="col-md-8 col-md-offset-2">
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-user-o"></i>
                                <input type="text" name="username" class="form-control" placeholder="账号">
                            </div>
                            <div class="error-div"></div>
                        </div>
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-phone"></i>
                                <input type="text" name="phone" class="form-control" placeholder="手机号码">
                            </div>
                            <div class="error-div"></div>
                        </div>

                        <div class="login-hint">
                            <div class="col-xs-6 mb-20">
                                <div class="row">
                                    <input type="text" name="verify" class="form-control" placeholder="验证码">
                                </div>
                            </div>
                            <div class="col-xs-5 col-xs-offset-1 mb-20">
                                <div class="row">
                                    <img src="/admin/login/verify/type/3" data="3" class="pull-right verify">
                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-primary" type="submit">提交</button>
                            <button class="btn btn-default form-return" date="0" type="button">返回</button>
                        </div>
                    </div>
                </form>
                <form class="login-box" style="display: none" method="post" action="" onsubmit="return false;">
                    <div class="login-title">
                        <h3>密码找回</h3>
                    </div>
                    <div class="col-md-8 col-md-offset-2">
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="password" class="form-control" placeholder="新密码">
                            </div>
                            <div class="error-div"></div>
                        </div>
                        <div class="login-hint">
                            <div class="login-input">
                                <i class="fa fa-lock"></i>
                                <input type="password" name="confirmPassword" class="form-control" placeholder="确认密码">
                            </div>
                            <div class="error-div"></div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary" type="submit">确定</button>
                            <button class="btn btn-default form-return" date="2" type="button">返回</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/login.js"/>
<!--
<script type="text/javascript" async="" src="http://t5.zbjimg.com/t5s/output/common/js/count.js?201610119"></script>
-->
<script>
    $(function(){
        <eq name="firstLogin" value="yes">
        openLoginErrorHint("<strong>操作提示</strong><br>登陆账号可以自己注册。也能用默认账号：password<br>密码：123456",10000);
        </eq>
    });
</script>
</body>
</html>