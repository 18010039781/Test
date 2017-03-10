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
<assign name="meau" value="integral"/>
<include file="Public/left"/>

<div class="main">
    <a href="#" id="toggle" aria-hidden="true" class="fa fa-2x fa-bars"></a>
    <div class="col-md-12">
        <div class="row">
            <h1>积分管理系统</h1>
            <div class="col-xs-12 border-bottom-ddd">
                <ul class="list-unstyled integral-list pb-15">
                    <li class="active"><a href="/Admin/Integral/index">月积分明细</a></li>
                    <li class="hidden-xs"><a href="/Admin/Integral/month">月效绩排行榜</a></li>
                    <li class="hidden-xs"><a href="/Admin/Integral/year">累计积分排行榜</a></li>
                </ul>
                <div class="pb-15 pull-left text-center col-xs-12  col-md-1">
                    <input class="chack-date" size="16" type="text" value="{%$dateGet%}" id="change-date" readonly >
                </div>
            </div>
            <div class="col-xs-12 pt-15 text-right">
                <button class="btn btn-orange" id="openForm" type="add">录入</button>
                <a class="btn btn-green" href="/Admin/Integral/exportExcel">导出统计</a>
            </div>
            <div class="col-xs-12 pt-15">
                <table class="table table-hover table-bordered table-striped" id="example">
                    <thead>
                        <tr class="color-fff bg-18c">
                            <th class="hidden-xs">员工类别</th>
                            <th class="hidden-xs">工号</th>
                            <th>姓名</th>
                            <th>日期</th>
                            <th class="hidden-xs">积分类型</th>
                            <th class="hidden-xs">具体内容</th>
                            <th>分值</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <volist name="svnList" id="svn">
                        <tr>
                            <td class="hidden-xs">{%$svn.type%}</td>
                            <td class="hidden-xs">{%$svn.uid%}</td>
                            <td>{%$svn.username%}</td>
                            <td>{%$svn.datatime%}</td>
                            <td class="hidden-xs">{%$svn.scorename%}</td>
                            <td class="hidden-xs">{%$svn.text%}</td>
                            <td>{%$svn.score%}</td>
                            <td class="text-center"><a href="#" class="setUserSvn" type="set" scoretype="{%$svn.scoretype%}" dateId="{%$svn.id%}">编辑</a></td>
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
    <form class="form-horizontal" method="post">
        <div class="left-max-width">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-sm-5 control-label">工号-姓名:</label>
                    <div class="col-sm-7">
                        <select class="form-control" name="uid">
                            <volist name="userList" id="user">
                                <option value="{%$user.id%}">{%$user.id%} - {%$user.username%}</option>
                            </volist>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-5 control-label">日期:</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="integralDate" name="datatime">
                    </div>
                </div>
            </div>
        </div>
        <div class="left-max-width">
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-5 control-label">积分类型:</label>
                    <div class="col-sm-7">
                        <select class="form-control" name="scoretype">
                            <volist name="scoreTypeList" id="scoreType">
                                <option value="{%$scoreType.id%}">{%$scoreType.scorename%}</option>
                            </volist>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-5 control-label">分值:</label>
                    <div class="col-sm-7">
                        <input type="number" class="form-control" name="score">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group">
                <div class="col-sm-12">
                    <textarea placeholder="请输入获得积分具体内容" class="form-control" rows="5" name="text"></textarea>
                </div>
            </div>
        </div>
        <div class="col-sm-12 text-right">
            <button type="button" class="btn btn-primary" >取消</button>
            <button type="submit" class="btn btn-orange">确认</button>
        </div>
        <input type="hidden" name="id" disabled>
    </form>
</div>

<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/responsive-nav.js"/>
<js href="__PUBLIC__/js/bootstrap-datetimepicker.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.js"/>
<js href="__PUBLIC__/js/jquery.validate.min.js"/>
<js href="__PUBLIC__/js/messages.js"/>
<script>
$(function(){
    var newDate= new Date();
    var todayDate= newDate.getFullYear()+"-"+(newDate.getMonth()+1);
    var todayDateMax= newDate.getFullYear()+"-"+(newDate.getMonth()+1)+"-"+newDate.getDate()+" "+newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds();
    $("#change-date").datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm',
        autoclose: true,
        todayBtn: true,
        startDate:"2015-1",
        endDate:todayDate,
        startView: 'year',
        minView: 'year',
        maxView: 'decade'
    }).on("changeDate",function() {
        window.location.href="/Admin/integral/index/date/"+$(this).val();
    });

    $("#integralDate").datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd hh:ss:ii',
        autoclose: true,
        todayBtn: true,
        startDate:"2015-1-1 00:00:00",
        endDate:todayDateMax,
        startView: 'year'
    });

    var dataTable=$('#example').DataTable();

    /*录入弹框*/
    $(".form-bg,.form-box-top .close").on("click",function() {
        $(".form-bg,.form-box-top").hide();
    });


    $("body").delegate("#openForm,#example .setUserSvn","click",function() {
        var type = $(this).attr("type");
        var input1 = "";
        var input2 = "";
        var select1 = "";
        var select2 = "";
        var textarea = "";
        if(type == "set"){
            $("#fromOpenDiv form input[name='id']").prop("disabled",false);
            $("#fromOpenDiv form input[name='id']").val($(this).attr("dateId"));
            type = "/Admin/Integral/saveSvn";
            var $tr = $(this).parents("tr");
            if($tr){
                var $td = $tr.find("td");
                input1 = $td.eq(3).text();
                input2 = $td.eq(6).text();
                select1 = $td.eq(1).text();
                select2 = $(this).attr("scoretype");
                textarea = $td.eq(5).text();
            }
        }else{
            $("#fromOpenDiv form input[name='id']").prop("disabled",true);
            type = "/Admin/Integral/addSvn";
        }
        $("#fromOpenDiv form").attr("action",type);
        $("#fromOpenDiv form input").eq(0).val(input1);
        $("#fromOpenDiv form input").eq(1).val(input2);
        $("#fromOpenDiv form select").eq(0).val(select1);
        $("#fromOpenDiv form select").eq(1).val(select2);
        $("#fromOpenDiv form textarea").eq(0).val(textarea);
        var maxHeight = $(window).height();
        var formHeight = $("#fromOpenDiv").height();
        var top = "-"+(formHeight/2)+"px";
        $(".form-bg").css({
            display:"block",
            top:"100%",
            left:"100%"
        }).animate({
            left:"0px",
            top:"0px"
        },700);
        $("#fromOpenDiv").css({
            display:"block",
            marginTop:"60%"
        }).animate({
            marginTop:top
        },700);
    });


    $("#fromOpenDiv form").validate({
        rules: {
            uid: {
                required: true,
                digits: true
            },
            datatime: {
                required: true,
                date: true
            },
            scoretype: {
                required: true,
                digits:true
            },
            score: {
                required: true,
                digits: true
            }
        },
        messages: {
            uid: {
                required: "工号-姓名不能为空",
                digits: "工号-姓名格式不正确"
            },
            datatime: {
                required: "日期不能为空",
                date: "日期格式不正确"
            },
            scoretype: {
                required: "积分类型不能为空",
                digits: "积分类型格式不正确"
            },
            score: {
                required: "分值不能为空",
                digits: "分值只能为数字"
            }
        },
        submitHandler:function(form){
            //alert("提交事件!");
            form.submit();
        }
    });
});
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>