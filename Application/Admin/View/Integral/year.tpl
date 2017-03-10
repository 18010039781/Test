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
                    <li><a href="/Admin/Integral/month">月效绩排行榜</a></li>
                    <li class="active"><a href="/Admin/Integral/year">累计积分排行榜</a></li>
                </ul>
            </div>
            <div class="col-xs-12 pt-15">
                <table class="table table-hover table-bordered table-striped" id="example">
                    <thead>
                    <tr class="color-fff bg-18c">
                        <th rowspan="2">员工类别</th>
                        <th rowspan="2">工号</th>
                        <th rowspan="2">姓名</th>
                        <th colspan="3" class="text-center">积分分值</th>
                        <th colspan="3" class="text-center">积分绩效（元）</th>
                    </tr>
                    <tr class="color-fff bg-18c">
                        <th>{%$day - 1%}年</th>
                        <th>{%$day%}年</th>
                        <th>小计</th>
                        <th>{%$day - 1%}年</th>
                        <th>{%$day%}年</th>
                        <th>小计</th>
                    </tr>
                    </thead>
                    <tbody id="score-point">
                    <volist name="svnList" id="svn">
                        <tr>
                            <eq name="svn.type" value="1" >
                                <td>正式员工</td>
                                <else/>
                                <td>试用期员工</td>
                            </eq>
                            <td>{%$svn.uid%}</td>
                            <td>{%$svn.name%}</td>
                            <td>{%$svn.old%}</td>
                            <td>{%$svn.now%}</td>
                            <td>{%$svn["old"] + $svn["now"]%}</td>
                            <td>{%$svn.oldPer%}</td>
                            <td>{%$svn.nowPer%}</td>
                            <td>{%$svn["oldPer"] + $svn["nowPer"]%}</td>
                        </tr>
                    </volist>
                    </tbody>
                    <tfoot>
                    <tr class="bg-ef9 color-fff">
                        <td>正式员工</td>
                        <td colspan="2" class="text-center">小计</td>
                        <td>{%$count.formal.numOne%}</td>
                        <td>{%$count.formal.numTwo%}</td>
                        <td>{%$count["formal"]["numOne"] + $count["formal"]["numTwo"]%}</td>
                        <td>{%$count.formal.numThr%}</td>
                        <td>{%$count.formal.numFou%}</td>
                        <td>{%$count["formal"]["numThr"] + $count["formal"]["numFou"]%}</td>
                    </tr>
                    <tr class="bg-ef9 color-fff">
                        <td>试用期员工</td>
                        <td colspan="2" class="text-center">小计</td>
                        <td>{%$count.tryout.numOne%}</td>
                        <td>{%$count.tryout.numTwo%}</td>
                        <td>{%$count["tryout"]["numOne"] + $count["tryout"]["numTwo"]%}</td>
                        <td>{%$count.tryout.numThr%}</td>
                        <td>{%$count.tryout.numFou%}</td>
                        <td>{%$count["tryout"]["numThr"] + $count["tryout"]["numFou"]%}</td>
                    </tr>
                    <tr class="bg-53c color-fff">
                        <td>全体员工</td>
                        <td colspan="2" class="text-center">合计</td>
                        <td>{%$count.count.numOne%}</td>
                        <td>{%$count.count.numTwo%}</td>
                        <td>{%$count["count"]["numOne"] + $count["count"]["numTwo"]%}</td>
                        <td>{%$count.count.numThr%}</td>
                        <td>{%$count.count.numFou%}</td>
                        <td>{%$count["count"]["numThr"] + $count["count"]["numFou"]%}</td>
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
    var table =$('#example').DataTable();
});
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>