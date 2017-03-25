/**
 * Created by sony on 2017/3/21.
 */
// 配套设施
function inputAllBg() {
    $(this).attr("class", "active").siblings().attr("class", "active");
}
$(".input-tag a:first-child").click(inputAllBg);
function inputothers() {
    if ($(this).parent().children().first().hasClass("active")) {
        $(this).siblings().attr("class", "grey");
    };
    $(this).attr("class", "active");
    $(this).parent().children().first().attr("class", "grey");
}
$(function () {
    getDistrictRegion();
    /*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $("#district input").focus(function () {
        $("#district .edit_select_icon").css("display", "block")
        $("#district .edit-select_ul").slideToggle(500)
    })
    // $("#district .edit_select_icon").click(function () {
    // });
    // $("#area .edit_select_icon").click(function () {
    // });

    $("#area input").focus(function () {
        $("#area .edit_select_icon").css("display", "block")
        $("#area .edit-select_ul").slideToggle(500)
    })
});

function getDistrictRegion() {
    $.ajax({
        url: "/getDistrict.action",
        success: function (resultList) {
            $.each(resultList, function (index, element) {
                $("#district .edit-select_ul").append("<li id=" + element.id + ">" + element.regionName + "</li>");
            });
            //绑定点击事件
            $("#district .edit-select_ul li").click(function () {
                $("#districtName").attr("value", $(this).html());
                $("#districtId").attr("value", $(this).attr("id"));
                $(".select_control_label").attr("for", $(this).attr("id"));
                $("#district .edit-select_ul").slideToggle(500);
                $("#district .edit_select_icon").css("display", "none");
                //初始化area选择框
                $.ajax({
                    url: "/getArea.action",
                    data: { districtId: $("#districtId").attr("value") },
                    success: function (areaList) {
                        $("#area .edit-select_ul").empty();
                        $("#areaName").attr("value","");
                        $("#areaId").attr("value", "");
                        $.each(areaList, function (index, element) {
                            $("#area .edit-select_ul").append("<li id=" + element.id + ">" + element.regionName + "</li>");
                        });
                        //绑定点击事件
                        $("#area .edit-select_ul li").click(function () {
                            $("#areaName").attr("value", $(this).html());
                            $("#areaId").attr("value", $(this).attr("id"));
                            $(".select_control_label").attr("for", $(this).attr("id"));
                            $("#area .edit-select_ul").slideToggle(500);
                            $("#area .edit_select_icon").css("display", "none");
                        });
                    }
                });
            });
        }
    });
}

    //表单验证
	$("form").validate({
        rules:{
            /*登录验证*/
        	title:{
                required:true,          
            },
            rentprice:{
            	required:true,
            },
            room:{
            	required:true,
            },
            hall:{
            	required:true,
            },
            size:{
            	required:true,
            },
            address:{
            	required:true,
            },
        },
	messages:{
		title:{
            required:"请输入正确的用户名",
        },
        rentprice:{
            required:"租金不可为空！",
        },
        room:{
            required:"室不可为空",
        },
        hall:{
            required:"厅不可为空！",
        },
        size:{
            required:"房屋面积不可为空！",
        },
        address:{
            required:"详细地址不可为空！",
        },
    }
})
//上传图片
$(".create_house_input").on("change", function () {
    var img_preview = $(this).parents(".create_house_img_preview").find('.img_preview')[0];
    $(img_preview).html("");
    var fileList = this.files;
    var fileListLen = fileList.length;
    for (var i = 0; i < fileListLen; i++) {
        $(img_preview).append(" <img/>");
        var imgObjPreview = img_preview.children[i];
        if (this.files && this.files[i]) {
            imgObjPreview.src = window.URL.createObjectURL(this.files[i]);
        }
    }
})