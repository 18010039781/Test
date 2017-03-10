<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="Cache-Control" content="no-transform " />
    <title>积分管理系统</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <css href="__PUBLIC__/css/bootstrap.css"/>
    <css href="__PUBLIC__/css/font-awesome.min.css"/>
    <css href="__PUBLIC__/css/styles.css"/>
    <css href="__PUBLIC__/css/bootstrap-datetimepicker.min.css"/>
    <css href="__PUBLIC__/css/dataTables.css"/>
    <css href="__PUBLIC__/css/main.css"/>

</head>
<body>
<assign name="meau" value="system"/>
<include file="Public/left"/>

<div class="main">
    <a href="#" id="toggle" aria-hidden="true" class="fa fa-2x fa-bars"></a>
    <div class="col-md-12">
        <div class="row">
            <h1>积分管理系统</h1>
            <div class="col-xs-12 border-bottom-ddd">
                <ul class="list-unstyled integral-list pb-15" style="width: 280px;">
                    <!--
                    <li class="active"><a href="/Admin/Integral/index">月积分明细</a></li>
                    -->
                    <li class="text-center"><a href="/Admin/System/index" style="width: 130px;">岗位配置</a></li>
                    <li class="text-center active"><a href="/Admin/System/integral" style="width: 130px;">积分类型配置</a></li>
                </ul>
            </div>
            <div class="col-xs-12 pt-15">
                <div class="pull-right ml-10 mb-5">
                    <a class="btn btn-green addIndex" href="/Admin/Svn/integralAdd">添加积分类型</a>
                </div>
                <table class="table table-hover table-bordered table-striped" id="example">
                    <thead>
                        <tr class="color-fff bg-18c">
                            <th class="text-center">序号</th>
                            <th class="text-center">积分类型</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <volist name="arrList" id="arr">
                        <tr>
                            <td class="text-center">{%$i%}</td>
                            <td class="text-center">{%$arr["scorename"]%}</td>
                            <td class="text-center">
                                <a dataId ="{%$arr["id"]%}" class="save" href="#">编辑</a>
                                <eq name="Think.session.user.id" value="4">
                                    <a dataId ="{%$arr["id"]%}" href="#">删除</a>
                                </eq>
                            </td>
                        </tr>
                    </volist>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<div class="form-bg"></div>
<div class="form-box-top" id="fromOpenDiv">
    <div class="col-sm-12">
        <div class="row text-right pb-5"><span class="close">×</span></div>
    </div>
    <div class="col-sm-12">
        <p><b id="fromType" class="pull-left"></b></p>
    </div>
    <form class="form-horizontal" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">积分类型：</label>
            <div class="col-sm-8">
                <input class="form-control" name="scorename">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 text-center">
                <button type="submit" class="btn btn-primary" >提交</button>
            </div>
            <input type="hidden" name="id" disabled>
        </div>
    </form>
</div>
<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/responsive-nav.js"/>
<js href="__PUBLIC__/js/bootstrap-datetimepicker.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.js"/>
<js href="__PUBLIC__/js/integral.js"/>
<script>
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>