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
    <css href="__PUBLIC__/css/main.css"/>

</head>
<body>
<assign name="meau" value="home" />
<include file="Public/left"/>

<div class="main">
    <a href="#" id="toggle" aria-hidden="true" class="fa fa-2x fa-bars"></a>
    <h1>积分管理系统</h1>
    <div class="container">
        <div class="row">

            <div class="col-lg-10 col-lg-offset-1">
                <div class="row">
                    <div class="row host-list">
                        <div class="col-md-4">
                            <div class="media bg-24c">
                                <div class="media-left media-middle">
                                    <img src="__PUBLIC__/img/number.png"/>
                                </div>
                                <div class="media-body media-middle">
                                    <p>今日获取积分数：</p>
                                    <p class="text-center">{%$userTodayScore.sum%}分</p>
                                    <p class="text-right"><a href="/Admin/Svn/index">查询明细</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="media bg-987">
                                <div class="media-left media-middle">
                                    <img src="__PUBLIC__/img/purple.png"/>
                                </div>
                                <div class="media-body media-middle">
                                    <p>今日获取积分次数：</p>
                                    <p class="text-center">{%$userTodayScore.num%}次</p>
                                    <p class="text-right"><a href="/Admin/Svn/index">查询明细</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="media bg-00b">
                                <div class="media-left media-middle">
                                    <img src="__PUBLIC__/img/svn.png"/>
                                </div>
                                <div class="media-body media-middle">
                                    <p>今日SVN上传数：</p>
                                    <p class="text-center">{%$userTodayScore.count%}次</p>
                                    <p class="text-right"><a href="/Admin/Svn/index">查询明细</a></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <h4 class="pl-15">周积分情况：</h4>
                        <div class="col-md-9">
                            <div class="row">
                                <canvas id="canvas" class="max-width-canvas" width="723" height="250"></canvas>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="col-md-12 hover-box box-fen bg-79d visible-md visible-lg">
                                <p class="text-none-space">本周总积分<b>{%$weekList.sum%}</b>分</p>
                                <volist name="weekList.date" id="vo" offset="0" length='5'>
                                    <p><label>{%$vo%}</label>＋{%$weekList["sumScore"][$i-1]%}分</p>
                                </volist>
                            </div>
                        </div>
                    </div>

                    <div class="row pt-15">
                        <h4 class="pl-15">月积分排名：</h4>
                        <volist name="scoreList" id="sco" offset="0" length='3' key ="n">
                            <div class="col-md-3 visible-md visible-lg">
                                <div class="row fen-div">
                                    <div class="huan-text">
                                        <canvas id="canvas{%$n%}" class="max-width-canvas" height="200" width="250" num="{%$sco.sumScore%}" sum="{%$sum%}"></canvas>
                                        <div class="huan-text-div">{%$sco.sumScore%}<span>分</span></div>
                                    </div>
                                    <div class="max-width">
                                        <div class="center-block img-circle">
                                            <span>{%$sco.name%}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </volist>
                        <div class="col-md-3 col-sm-12 pull-right">
                            <div class="col-xs-12 hover-box box-fen-bottom bg-79d ptb-15">
                                <p class="text-none-space">本月积分排名：</p>
                                <volist name="scoreList" id="so" offset="0" length='3' key ="k">
                                    <div class="pb-10">
                                        <span class="text-left">
                                            第<eq name="k" value="1">一</eq><eq name="k" value="2">二</eq><eq name="k" value="3">三</eq>名
                                        </span>
                                        <span class="text-center active">{%$so.name%}</span>
                                        <span class="hidden-md hidden-lg text-right">{%$so.sumScore%}分</span>
                                    </div>
                                </volist>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/responsive-nav.js"/>
<js href="__PUBLIC__/js/Chart.js"/>
<js href="__PUBLIC__/js/jquery.circliful.min.js"/>
<script>
$(function(){
    $(".btn").on("click",function(){
        $(this).hide();
    });

    var d = new Date();
    var str = (d.getMonth() + 1) + "月" + parseInt(d.getDate()) + "日";
    var str1 = (d.getMonth() + 1) + "月" + parseInt(d.getDate() - 1) + "日";
    var str2 = (d.getMonth() + 1) + "月" + parseInt(d.getDate() - 2) + "日";
    var str3 = (d.getMonth() + 1) + "月" + parseInt(d.getDate() - 3) + "日";
    var str4 = (d.getMonth() + 1) + "月" + parseInt(d.getDate() - 4) + "日";
    //线形图
    var userDateList = {%$weekListStr%};
    var lineChartData = {
        //labels: [str4, str3, str2, str1, str],
        labels: userDateList.date,
        datasets: [
            {
                fillColor: "rgba(0,176,108,0)",
                strokeColor: "rgba(0,176,108,1)",
                pointColor: "rgba(0,176,108,1)",
                pointStrokeColor: "#fff",
                data: userDateList.sumScore
            }

        ]

    }
    var option = {
        scaleFontSize: 12
    }
    var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Line(lineChartData, option);


    $("#canvas1").circliful({ color: "#17C785"});
    $("#canvas2").circliful({ color: "#00B7EE"});
    $("#canvas3").circliful({ color: "#976FD8"});

});
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>