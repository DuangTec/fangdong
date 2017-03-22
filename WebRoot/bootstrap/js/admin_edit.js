/**
 * Created by yey on 2017/3/20.
 */
$(function () {
    /*go-top快速回顶*/
    $(".go-top").click(function () {
        $(window).scrollTop(0);
    });
    /*获取所有父级地区*/
    getParentsRegion();
    /*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $(".edit_select input").focus(function () {
        $(".edit_select_icon").css("display", "block")
    })
    $(".edit_select_icon").click(function () {
        $(".edit-select_ul").slideToggle(500)
    });


})

function getParentsRegion() {
    $.ajax({
        url: "/admin/getParentsRegion.action",
        success: function (resultList) {
            $.each(resultList, function (index, element) {
                $(".edit_select .edit-select_ul").append("<li id=" + element.id + ">" + element.regionName + "</li>");
            });
            //绑定点击事件
            $(".edit-select_ul li").click(function () {
                $("#parentRegionName").attr("value", $(this).html());
                $("#parentRegionId").attr("value", $(this).attr("id"));
                $(".select_control_label").attr("for", $(this).attr("id"));
                $(".edit-select_ul").slideToggle(500);
                $(".edit_select_icon").css("display", "none");
            });
        }
    });
}

