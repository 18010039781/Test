$(function(){
    var ajaxBoool = true;
    /*注册步骤一*/
    $("#signUp").on("click",function(){
        $("form").stop();
        $(this).parents("form:first").fadeOut(200,function(){
            $("form").eq(1).fadeIn(200);
        });
    });

    /*
    **注册步骤一处理
    **第二个表单提交
    */
    $("form").eq(1).on("submit",function(){
        var $form = $(this);
        if(!ajaxBoool){
            return false;
        }
        ajaxBoool = false;
        $.ajax({
            url:"/Admin/Login/signUpAjax",
            data:$form.serialize(),
            type:"POST",
            dataType:"json",
            success:function(status){
                ajaxBoool = true;
                if(status.status == 0){
                    openLoginErrorHint(status.data);
                    refreshVerify();
                }else{
                    openLoginErrorHint("注册成功！2秒后自动登录");
                    $("body").css({"pointer-events":"none"});
                    setTimeout(function(){
                        location.reload();
                    },2000);
                    //location.reload();
                }
            },
            error:function(error){
                ajaxBoool = true;
            }
        });
        return false;
    });

    /*找回密码步骤一*/
    $("#forgetPassword").on("click",function(){
        $("form").stop();
        $(this).parents("form:first").fadeOut(200,function(){
            $("form").eq(2).fadeIn(200);
        });
    });

    /*
     **找回密码步骤一处理
     **第三个表单提交
     */
    $("form").eq(2).on("submit",function(){
        var $form = $(this);
        if(!ajaxBoool){
            return false;
        }
        ajaxBoool = false;
        $.ajax({
            url:"/Admin/Login/forgetPasswordOneAjax",
            data:$form.serialize(),
            type:"POST",
            dataType:"json",
            success:function(status){
                ajaxBoool = true;
                if(status.status == 0){
                    openLoginErrorHint(status.data);
                    refreshVerify();
                }else{
                    $("form").stop();
                    $form.fadeOut(200,function(){
                        $("form").eq(3).fadeIn(200);
                    });
                }
            },
            error:function(error){
                ajaxBoool = true;
            }
        });
        return false;
    });

    /*
     **找回密码步骤二处理
     **第四个表单提交
     */
    $("form").eq(3).on("submit",function(){
        var $form = $(this);
        if(!ajaxBoool){
            return false;
        }
        ajaxBoool = false;
        $.ajax({
            url:"/Admin/Login/forgetPasswordTwoAjax",
            data:$form.serialize(),
            type:"POST",
            dataType:"json",
            success:function(status){
                ajaxBoool = true;
                if(status.status == 0){
                    openLoginErrorHint(status.data);
                    refreshVerify();
                }else{
                    openLoginErrorHint("密码修改成功！2秒后返回登录界面");
                    $("body").css({"pointer-events":"none"});
                    setTimeout(function(){
                        location.reload();
                    },2000);
                }
            },
            error:function(error){
                ajaxBoool = true;
            }
        });
        return false;
    });


    /*返回*/
    $(".form-return").on("click",function(){
        $(this).parents("form:first").get(0).reset();
        $("form").stop();
        var date = $(this).attr("date");
        $(this).parents("form:first").fadeOut(200,function(){
            $("form").eq(date).fadeIn(200);
        });
    });

    $(".verify").on("click",refreshVerify);
});


function loginErrorHintAjax($form,str,num){
    $form.find(".error-div").eq(num).text(str);
}

function refreshVerify(){
    var timestamp=new Date().getTime();
    $(".verify").each(function(){
        var src = "/admin/login/verify/type/";
        src+=$(this).attr("data")+"/timestamp/"+timestamp;
        $(this).attr("src",src);
    });
}

