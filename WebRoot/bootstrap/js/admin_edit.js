/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top快速回顶*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    /*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $(".edit_select input").focus(function(){
        $(".edit_select_icon").css("display","block")
    })
    $(".edit_select_icon").click(function(){
        $(".edit-select_ul").slideToggle(500)
    })
    $(".edit-select_ul li").click(function(){
        $(".edit_select input").val($(this).html())
        $(".edit-select_ul").slideToggle(500)
        $(".edit_select_icon").css("display","none")
    })
    /*获取所有父级地区*/
    getParentsRegion();

})

function getParentsRegion(){
    $.ajax({
        url:"/getParentsRegion.action",
        success:function(resultList){
            $.each(resultList,function(index,element){
                $(".edit_select .edit-select_ul").append("<li value='"+element.id+"'>"+element.regionName+"</li>")
            })
        }
    });
}