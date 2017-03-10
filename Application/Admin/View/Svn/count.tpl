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
<assign name="meau" value="svn"/>
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
                    <li class="text-center"><a href="/Admin/Svn/index" style="width: 130px;">当月全部明细</a></li>
                    <li class="text-center active"><a href="/Admin/Svn/count" style="width: 130px;">统计</a></li>
                </ul>
                <div class="pb-15 pull-left text-center col-xs-12  col-md-1">
                    <input class="chack-date" size="16" type="text" value="{%$dateGet%}" id="change-date" readonly >
                </div>
            </div>
            <div class="col-xs-12 pt-15">
                <div class="pull-right ml-10 mb-5">
                    <a class="btn btn-green" href="#" id="exportExcel">导出统计</a>
                </div>
                <table class="table table-hover table-bordered table-striped" id="example">
                    <thead>
                        <tr class="color-fff bg-18c">
                            <th class="text-center">工号</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">提交次数</th>
                            <th class="text-center">未提交天数</th>
                        </tr>
                    </thead>
                    <tbody>
                    <volist name="svnList" id="svn">
                        <tr>
                            <td class="text-center">{%$svn[0]%}</td>
                            <td class="text-center">{%$svn[1]%}</td>
                            <td class="text-center">{%$svn[2]%}</td>
                            <td class="text-center">{%$svn[3]%}</td>
                        </tr>
                    </volist>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/responsive-nav.js"/>
<js href="__PUBLIC__/js/bootstrap-datetimepicker.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.min.js"/>
<js href="__PUBLIC__/js/jquery.dataTables.js"/>
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
        window.location.href="/Admin/Svn/count/date/"+$(this).val();
    });

    $('#example').DataTable();

    $("#exportExcel").on("click",function() {
        window.location.href="/Admin/Svn/exportExcelCount/date/"+$("#change-date").val();
    })
});
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>