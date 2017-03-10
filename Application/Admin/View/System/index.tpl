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
                    <li class="text-center active"><a href="/Admin/System/index" style="width: 130px;">岗位配置</a></li>
                    <li class="text-center"><a href="/Admin/System/integral" style="width: 130px;">积分类型配置</a></li>
                </ul>
            </div>
            <div class="col-xs-12 pt-15">
                <div class="row">
                    <div class="col-xs-12 pb-10">
                        <ul class="list-unstyled list-inline system-ul">
                            <li><span style="margin-right: 0px;">当前位置：</span></li>
                            <li>
                                <a href="/Admin/System/index">
                                    <empty name="thisNameOne">
                                        所属部门配置<else/>{%$thisNameOne%}
                                    </empty>
                                </a>
                            </li>
                            <egt name="type" value="2">
                                <li>
                                    <span>></span>
                                    <a href="/Admin/System/index/type/2/mid/{%$midOne%}">
                                        <empty name="thisNameTwo">
                                            岗位信息配置<else/>{%$thisNameTwo%}
                                        </empty>
                                    </a>
                                </li>
                            </egt>
                            <eq name="type" value="3">
                                <li>
                                    <span>></span>
                                    <a href="/Admin/System/index/type/3/mid/{%$midTwo%}">所属级别配置</a>
                                </li>
                            </eq>
                        </ul>
                    </div>
                </div>
                <div class="pull-right ml-10 mb-5">
                    <a class="btn btn-green addIndex" id="addIndex" href="#" dataType="{%$type%}" dataName="{%$typeName%}" dataId="{%$mid%}">添加{%$typeName%}</a>
                </div>
                <table class="table table-hover table-bordered table-striped" id="example">
                    <thead>
                        <tr class="color-fff bg-18c">
                            <th class="text-center">序号</th>
                            <th class="text-center">{%$typeName%}名字</th>
                            <neq name="type" value="3">
                                <th class="text-center">
                                    <eq name="type" value="1">
                                        岗位个数<else/>级别个数
                                    </eq>
                                </th>
                            </neq>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <volist name="arrList" id="arr">
                        <tr>
                            <td class="text-center">{%$i%}</td>
                            <td class="text-center">{%$arr["value"]%}</td>
                            <neq name="type" value="3">
                                <td class="text-center">{%$arr["num"]%}</td>
                            </neq>
                            <td class="text-center">
                                <neq name="type" value="3">
                                    <a href="/Admin/System/index/type/{%$type+1%}/mid/{%$arr.id%}">管理</a>
                                </neq>
                                <a dataId ="{%$arr["id"]%}" dataType ="{%$type%}" dataName="{%$typeName%}" href="#" class="save">编辑</a>
                                <eq name="Think.session.user.id" value="4">
                                    <a dataId ="{%$arr["id"]%}" dataType ="{%$type%}" dataMid ="{%$mid%}" href="#" class="delete">删除</a>
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
            <label class="col-sm-2 control-label"><span class="input-label"></span>名字：</label>
            <div class="col-sm-8">
                <input class="form-control" name="value">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 text-center">
                <button type="submit" class="btn btn-primary" >提交</button>
            </div>
            <input type="hidden" name="id" disabled>
            <input type="hidden" name="mid" value="{%$mid%}">
            <input type="hidden" name="type" value="{%$type%}">
        </div>
    </form>
</div>
<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/responsive-nav.js"/>
<js href="__PUBLIC__/js/bootstrap-datetimepicker.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.js"/>
<js href="__PUBLIC__/js/jquery.validate.min.js"/>
<js href="__PUBLIC__/js/messages.js"/>
<js href="__PUBLIC__/js/system.js"/>
<script>
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>