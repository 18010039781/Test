<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="Cache-Control" content="no-transform " />
    <title>测试</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <css href="__PUBLIC__/css/bootstrap.css"/>

</head>
<body style="background: red;">
<div>
    <canvas class="canvas" width="250" height="200" num="33" sum="100" color="#17C785"></canvas>
</div>
<div>
    <canvas class="canvas" width="250" height="200" num="99" sum="100" color="#00B7EE"></canvas>
</div>

<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/jquery.circliful.min.js"/>
<script>
$(function(){
    $(".canvas").circliful();
    /*
    var context = $("#canvas").get(0).getContext('2d');
    context.clearRect(0,0,250,200);
    context.lineWidth=17;
    context.strokeStyle="blue";
    context.beginPath();
    // 坐标移动到圆心
    //context.moveTo(100, 100);
    // 画圆,圆心是24,24,半径24,从角度0开始,画到2PI结束,最后一个参数是方向顺时针还是逆时针
    context.arc(125, 100, 38, 1.5*Math.PI, -0.5*Math.PI, false);
    //context.closePath();
    context.stroke();
    context.fillStyle="red";
    context.fill();
     */
});
</script>

</body>
</html>