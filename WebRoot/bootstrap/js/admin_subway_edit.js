$(function () {
    /*添加站点*/
    $(".subway_station_add").click(function () {
        getDistrict();
        $(".subway_station_add_select").slideToggle(100);
    });
    //删除站点
    $(".glyphicon-remove").click(function () {
        $(this).parent(".subway_station_check").css("display", "none");
        var subwayRegionId = $(this).parent().next().text();
        window.location.href = "/admin/delSubwayRegion.action?subwayRegionId=" + subwayRegionId;
    });

    /*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $(".district_groups input").focus(function () {
        $(".edit_select_icon").css("display", "block")
    })
    $(".district_groups .edit_select_icon").click(
        function () {
            $(".district_groups .edit-select_ul").slideToggle(500);
        });
    $(".area_groups .edit_select_icon").click(function () {
        $(".area_groups .edit-select_ul").slideToggle(500);
    });

});



function getDistrict() {
    $.ajax({
        url: "/admin/getDistrictBySubway.action",
        data: { cityId: $('#city_id').val() },
        success: function (resultList) {
            $.each(resultList, function (index, element) {
                $(".district_groups ul").append(
                    "<li id=" + element.id + ">" + element.regionName
                    + "</li>");
            });
            //绑定点击事件
            $(".district_groups .edit-select_ul li").click(function () {
                $("#district_region_name").attr("value", $(this).html());
                $("#district_region_id").attr("value", $(this).attr("id"));
                // $(".select_control_label").attr("for", $(this).attr("id"));
                $(".district_groups .edit-select_ul").slideToggle(500);
                $(".district_groups .edit_select_icon").css("display", "none");


                $("#area_region_name").attr("value", "");
                $("#area_region_id").attr("value", "");


                $.ajax({
                    url: "/getArea.action",
                    data: { districtId: $("#district_region_id").val() },
                    success: function (resultList) {





                        $.each(resultList, function (index, element) {
                            $(".area_groups ul").append(
                                "<li id=" + element.id + ">" + element.regionName
                                + "</li>");
                        });
                        //绑定点击事件
                        $(".area_groups .edit-select_ul li").click(function () {
                            $("#area_region_name").attr("value", $(this).html());
                            $("#area_region_id").attr("value", $(this).attr("id"));
                            // $(".select_control_label").attr("for", $(this).attr("id"));
                            $(".area_groups .edit-select_ul").slideToggle(500);
                            $(".area_groups .edit_select_icon").css("display", "none");
                        });

                    }
                })
            });
        }
    });
}
