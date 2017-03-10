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
<assign name="meau" value="set"/>
<include file="Public/left"/>

<div class="main">
    <a href="#" id="toggle" aria-hidden="true" class="fa fa-2x fa-bars"></a>
    <div class="col-md-12">
        <div class="row">
            <h1>积分管理系统</h1>
            <div class="container">
                <div class="row bg-f8f mb-20">
                    <div class="col-sm-12">
                        <ul class="menu-set list-unstyled">
                            <li class="text-center">
                                <a class="active"><span class="fa fa-2x fa-user"></span>个人信息</a>
                            </li>
                            <li class="text-center">
                                <a><span class="fa fa-2x fa-lock"></span>密码设置</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12" id="divForm">
                        <form id="setFormUser" class="form-horizontal form-table" method="post" enctype="multipart/form-data" onsubmit="return false;">
                            <notempty  name="Think.session.user.signUp">
                                <div class="form-group">
                                    <label class="control-label col-sm-2">头像：</label>
                                    <div class="col-sm-8 text-center from-updateImg" date="__PUBLIC__/{%$Think.session.user.userimg%}" datatype="0">
                                        <div class="setImg"></div>
                                        <div class="setImg-div show">
                                            <span class="fa fa-pencil"></span>
                                            <input type="file" name="userimg" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">姓名：</label>
                                    <div class="col-sm-8 inputNotNull" datatype="0">
                                        <input class="form-control" name="userinfo" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">用户名：</label>
                                    <div class="col-sm-8 inputNotNull" datatype="0">
                                        <input class="form-control" name="username" value="{%$Think.session.user.userAccName%}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">手机号码：</label>
                                    <div class="col-sm-8 inputNotNull"  datatype="0">
                                        <input class="form-control" name="phone" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">所属部门：</label>
                                    <div class="col-sm-8 inputNotNull" datatype="1">
                                        <select class="form-control selectChange" name="usertype" data="quarters">
                                            <volist name="department" id="dep">
                                                <option value="{%$dep.id%}">{%$dep.value%}</option>
                                            </volist>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">岗位信息：</label>
                                    <div class="col-sm-8 inputNotNull" datatype="1">
                                        <select class="form-control selectChange" name="userpost" data="level">
                                            <volist name="quarters" id="qua">
                                                <option value="{%$qua.id%}">{%$qua.value%}</option>
                                            </volist>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">所属级别：</label>
                                    <div class="col-sm-8 inputNotNull" datatype="1">
                                        <select class="form-control" name="posttype" id="selectLast">
                                            <volist name="level" id="lev">
                                                <option value="{%$lev.id%}">{%$lev.value%}</option>
                                            </volist>
                                        </select>
                                    </div>
                                </div>
                                <else/>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">头像：</label>
                                    <div class="col-sm-8 text-center from-updateImg" date="__PUBLIC__/{%$Think.session.user.userimg%}" datatype="0">
                                        <div class="setImg">
                                            <notempty  name="Think.session.user.userimg">
                                                <img class="img-circle" src="__PUBLIC__/{%$Think.session.user.userimg%}"/>
                                            </notempty >
                                        </div>
                                        <div class="setImg-div">
                                            <span class="fa fa-pencil"></span>
                                            <input type="file" name="userimg" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">姓名：</label>
                                    <div class="col-sm-8" date="{%$Think.session.user.username%}" datatype="0">
                                        <p class="form-table-text">{%$Think.session.user.username%}</p>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">用户名：</label>
                                    <div class="col-sm-8" date="{%$Think.session.user.userAccName%}" datatype="0">
                                        <p class="form-table-text">{%$Think.session.user.userAccName%}</p>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">手机号码：</label>
                                    <div class="col-sm-8" date="{%$Think.session.user.phone%}" datatype="0">
                                        <p class="form-table-text">{%$Think.session.user.phone%}</p>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">所属部门：</label>
                                    <div class="col-sm-8" date="{%$userList.usertype%}" datatype="1">
                                        <p class="form-table-text">{%$Think.session.user.usertype%}</p>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">岗位信息：</label>
                                    <div class="col-sm-8" date="{%$userList.userpost%}" datatype="1">
                                        <p class="form-table-text">{%$Think.session.user.userpost%}</p>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">所属级别：</label>
                                    <div class="col-sm-8" date="{%$userList.posttype%}" datatype="1">
                                        <p class="form-table-text">{%$Think.session.user.posttype%}</p>
                                    </div>
                                    <div class="col-sm-2 text-right">
                                        <a class="form-table-set">修改</a>
                                    </div>
                                </div>
                            </notempty>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4">
                                    <button class="btn btn-primary btn-group-justified" type="submit">修改并保存</button>
                                </div>
                            </div>
                        </form>
                        <form id="setFormPassword" class="form-horizontal" method="post" onsubmit="return false;">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">旧&nbsp;&nbsp;密&nbsp;&nbsp;码：</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="newPassword">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label text-none-space">确认密码：</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="conPassword">
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <div class="col-md-4 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary btn-group-justified">修改并保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<js href="__PUBLIC__/js/jquery-3.1.1.min.js"/>
<js href="__PUBLIC__/js/responsive-nav.js"/>
<js href="__PUBLIC__/js/public.js"/>
<script>
$(function(){
    $(".menu-set a").on("click",function(){
        var num = $(this).parent("li").index();
        if($(this).hasClass("active")){
            return false;
        }
        $(".menu-set a").removeClass("active");
        $(this).addClass("active");
        $("#divForm>form").stop().eq(1-num).hide(200,function() {
            $("#divForm>form").eq(num).show(200);
        });
    });

    $(".form-table-set").on("click",function() {
        var $pre = $(this).parent().prev("div");
        var data = $pre.attr("date");
        var index = $(this).parent().parent().index();
        var arr = ["userimg","userinfo","username","phone","usertype","userpost","posttype"];
        var objList = {
            usertype:{%$departmentSize%},
            userpost:{%$quartersSize%},
            posttype:{%$levelSize%}
        };
        var html = "";
        if($(this).text() == "修改"){
            $(this).text("取消");
            if(index == 0){
                $(".setImg-div").show();
                $pre.find("input").val("").prop("disabled",false);
            }else if(index < 4){
                html='<input class="form-control" name="'+arr[index]+'" value="'+data+'">';
                $pre.html(html);
            }else{
                html='<select class="form-control';
                if(index == 4 || index == 5){
                    html +=" selectChange";
                }
                html+='" name="'+arr[index]+'"';
                if(index == 6){
                    html +=" id='selectLast'";
                }
                if(index == 4){
                    html +=" data='quarters'";
                }
                if(index == 5){
                    html +=" data='level'";
                }
                html+='>';
                var optionList = objList[arr[index]];
                for(var i = 0;i<optionList.length;i++){
                    html+='<option value="'+optionList[i]["id"]+'">'+optionList[i]["value"]+'</option>';
                }
                html+='</select>';
                $pre.html(html);
                $pre.find("select option[value='"+data+"']").prop("selected",true);
            }
        }else{
            $(this).text("修改");
            if(index == 0){
                if(data == "__PUBLIC__/"){
                    $(".setImg").html("");
                }else{
                    $(".setImg img").attr("src",data);
                }
                $(".setImg-div").hide();
                $pre.find("input").prop("disabled",true);
            }else{
                $pre.html('<p class="form-table-text">'+data+'</p>');
            }
        }
    });

    $(".setImg-div input").on("change",function() {
        var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
        if (objUrl) {
            if($(".setImg img").length<1){
                $(".setImg").html("<img class='img-circle' src='' >");
            }
            var img = new Image();
            img.src = objUrl;
            if(img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数
                $(".setImg img").attr("src",objUrl);
                return; // 直接返回，不用再处理onload事件
            }
            img.onload = function () { //图片下载完毕时异步调用callback函数。
                $(".setImg img").attr("src",objUrl);
            };
        }
    });
var ajaxBool = true;
    $("form:first").on("submit",function() {
        if(!ajaxBool){
            return false;
        }
        ajaxBool = false;
        var $form = new FormData($(this).get(0));
        $.ajax({
            url:"/Admin/Set/saveUserAjax",
            data:$form,
            type:"POST",
            cache : false,
            processData : false, // 不处理发送的数据，因为data值是Formdata对象，不需要对数据做处理
            contentType : false,
            dataType:"json",
            success:function(data){
                ajaxBool = true;
                if(data.status == 0){
                    openLoginErrorHint(data.data);
                }else{
                    openLoginErrorHint("保存成功！2秒后自动刷新");
                    $("body").css({ "pointer-events":"none"});
                    setTimeout(function(){
                        location.reload();
                    },2000);
                }
            },
            error:function(){
                ajaxBool = true;
            }
        });
        return false;
    });

    $("form:last").on("submit",function() {
        if(!ajaxBool){
            return false;
        }
        ajaxBool = false;
        var $form = $(this);
        $.ajax({
            url:"/Admin/Set/savePassWordAjax",
            data:$form.serialize(),
            type:"POST",
            dataType:"json",
            success:function(data){
                ajaxBool = true;
                if(data.status == 1){
                    openLoginErrorHint("修改成功！2秒后自动刷新");
                    $("body").css({ "pointer-events":"none"});
                    setTimeout(function(){
                        location.reload();
                    },2000);
                }else{
                    openLoginErrorHint(data.data);
                }
            },
            error:function(){
                ajaxBool = true;
            }
        });
        return false;
    });

    //下拉表单变化
    $("body").delegate(".selectChange","change",function() {
        if(!ajaxBool){
            return false;
        }
        var mid = $(this).val();
        var statusData = $(this).attr("data");
        var $that = $(this);
        $.ajax({
            url:"/Admin/Set/getPostTypeAjax",
            data:{ mid:mid,type:statusData},
            type:"POST",
            dataType:"json",
            success:function(data){
                ajaxBool = true;
                if(data.status == 1){
                    var status = data.data;
                    if(statusData == "quarters"){
                        var $select = $(".selectChange[data='level']");
                        $select.empty();
                        for(var i = 0;i<status.length;i++){
                            $select.append("<option value='"+status[i]["id"]+"'>"+status[i]["value"]+"</option>")
                        }
                        $select.change();
                    }else if(statusData == "level"){
                        var $select = $("#selectLast");//selectLast
                        $select.empty();
                        for(var i = 0;i<status.length;i++){
                            $select.append("<option value='"+status[i]["id"]+"'>"+status[i]["value"]+"</option>")
                        }
                    }
                }
            },
            error:function(){
                ajaxBool = true;
            }
        })
    });

    <notempty  name="Think.session.user.signUp">
            openLoginErrorHint("请先完善资料！");
    </notempty >
});
var navigation = responsiveNav("#nav", {customToggle: "#toggle"});
</script>

</body>
</html>