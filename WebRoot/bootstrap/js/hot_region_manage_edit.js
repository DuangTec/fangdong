$(function(){
    getAllArea();

/*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $("#region input").focus(function () {
        $("#region .edit_select_icon").css("display", "block")
        $("#region .edit-select_ul").slideToggle(500)
    })
});

function getAllArea(){
    $.ajax({
        url:"/getAllArea.action",
        success:function(resultList){
            $.each(resultList, function (index, element) {
                $("#region .edit-select_ul").append("<li id=" + element.id + ">" + element.regionName + "</li>");
            });
            //绑定点击事件
            $("#region .edit-select_ul li").click(function () {
                $("#regionName").attr("value", $(this).html());
                $("#regionId").attr("value", $(this).attr("id"));
                $(".select_control_label").attr("for", $(this).attr("id"));
                $("#region .edit-select_ul").slideToggle(500);
                $("#region .edit_select_icon").css("display", "none");
            });
        }
    })
}
