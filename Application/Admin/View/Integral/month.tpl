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
                    <li><a href="/Admin/Integral/index">月积分明细</a></li>
                    <li class="active"><a href="/Admin/Integral/month">月效绩排行榜</a></li>
                    <li><a href="/Admin/Integral/year">累计积分排行榜</a></li>
                </ul>
                <div class="pb-15 pull-left text-center col-xs-12  col-md-1">
                    <input class="chack-date" size="16" type="text" value="{%$dateGet%}" id="change-date" readonly >
                </div>
            </div>
            <div class="col-xs-12 pt-15">
                <table class="table table-hover table-bordered table-striped" id="example">
                <thead>
                <tr class="color-fff bg-18c">
                    <th rowspan="2">员工类别</th>
                    <th rowspan="2">工号</th>
                    <th rowspan="2">姓名</th>
                    <th colspan="2" class="text-center">当月积分分值</th>
                    <th colspan="2" class="text-center">当月积分次数</th>
                    <th colspan="3" class="text-center">当月积分绩效（元）</th>
                </tr>
                <tr class="color-fff bg-18c">
                    <th>分值</th>
                    <th>排名</th>
                    <th>次数</th>
                    <th>排名</th>
                    <th>分值排名</th>
                    <th>次数排名</th>
                    <th>无积分提交次数</th>
                </tr>
                </thead>
                <tbody>
                <volist name="svnList" id="svn">
                    <tr>
                        <eq name="svn.type" value="1" >
                            <td>正式员工</td>
                            <else/>
                            <td>试用期员工</td>
                        </eq>
                        <td>{%$svn.uid%}</td>
                        <td>{%$svn.name%}</td>
                        <td>{%$svn.sumScore%}</td>
                        <td>{%$svn.sumScoreSort%}</td>
                        <td>{%$svn.numScore%}</td>
                        <td>{%$svn.numScoreSort%}</td>
                        <td>{%$svn.sumScoreSort%}</td>
                        <td>{%$svn.numScoreSort%}</td>
                        <td>{%$svn.numYesScore%}</td>
                    </tr>
                </volist>
                </tbody>
                <tfoot>
                <tr class="bg-ef9 color-fff">
                    <td>正式员工</td>
                    <td colspan="2" class="text-center">小计</td>
                    <td>{%$count.formal.numOne%}</td>
                    <td>&nbsp;</td>
                    <td>{%$count.formal.numTwo%}</td>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>{%$count.formal.numThr%}</td>
                </tr>
                <tr class="bg-ef9 color-fff">
                    <td>试用期员工</td>
                    <td colspan="2" class="text-center">小计</td>
                    <td>{%$count.tryout.numOne%}</td>
                    <td>&nbsp;</td>
                    <td>{%$count.tryout.numTwo%}</td>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>{%$count.tryout.numThr%}</td>
                </tr>
                <tr class="bg-53c color-fff">
                    <td>全体员工</td>
                    <td colspan="2" class="text-center">合计</td>
                    <td>{%$count.count.numOne%}</td>
                    <td>&nbsp;</td>
                    <td>{%$count.count.numTwo%}</td>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>{%$count.count.numThr%}</td>
                </tr>
                </tfoot>
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
        window.location.href="/Admin/integral/month/date/"+$(this).val();
    });

    var table =$('#example').DataTable();
});
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>