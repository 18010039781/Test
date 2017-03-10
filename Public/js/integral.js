$(function(){
    var ajaxBoool = true;

    /*表格排序*/
    $('#example').DataTable();

    /*弹出弹框*/
    $("body").delegate(".addIndex,.save","click",function(){
        if($(this).hasClass("save")){
            var labelText = $(this).parents("tr").find("td").eq(1).text();
            $("#fromType").html("编辑积分类型");
            $("#fromOpenDiv form input[name='id']").val($(this).attr("dataId")).prop("disabled",false);
            $("#fromOpenDiv form input[name='scorename']").val(labelText);
            $("#fromOpenDiv form").attr("action","/Admin/System/integralSave");
        }else if($(this).hasClass("addIndex")){
            $("#fromOpenDiv form input[name='id']").prop("disabled",true);
            $("#fromType").html("添加积分类型");
            $("#fromOpenDiv form").attr("action","/Admin/System/integralAdd");
        }else{
            return false;
        }

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

        return false;
    });

    /*关闭弹框*/
    $(".form-bg,.form-box-top .close").on("click",function() {
        $(".form-bg,.form-box-top").hide();
    });

    /*删除数据*/
    $("body").delegate("#example_wrapper td>.delete","click",function(){
        if(!confirm("你确定要删除整条数据？")){
            return false;
        }
        if(!ajaxBoool){
            return false;
        }else{
            ajaxBoool = false;
        }
        var $that = $(this);
        $.ajax({
            type: "POST",
            url: "/Admin/System/integralDelete",
            dataType: "json",
            data:{
                "id":$that.attr("dataId")
            },
            success: function (result) {
                ajaxBoool = true;
                if(result.status == 1){
                    var table=$('#example').DataTable();
                    table.row($that.parents('tr')).remove().draw();
                    openLoginErrorHint("删除成功");
                }else{
                    openLoginErrorHint(result.info);
                }
            }
        });
        return false;
    });
});


