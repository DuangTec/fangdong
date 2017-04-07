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
        $(".edit_select_icon").css("display","block");
    })
    $(".edit_select_icon").click(function(){
        $(".edit-select_ul").append("<li id='top1'>fff</li>")
        $(".edit-select_ul").slideToggle(500);
        $(".edit-select_ul li").click(function(){
            $(".edit_select input").attr("value",$(this).html());
            /*alert($(".edit_select input").attr("value"));
             alert($(".edit_select input").val());*/
            $(".edit_select input").attr("id",$(this).attr("id"));
            $(".select_control_label").attr("for",$(this).attr("id"));
            $(".edit-select_ul").slideUp(500);
            $(".edit_select_icon").css("display","none");
        })
    })
    /*删除站点*/
    del_station()
    function del_station(){
        $(".glyphicon-remove").click(function(){
            $(this).parent(".subway_station_check").css("display","none");
        })
    }
    /*添加站点*/
    $(".subway_station_add").focus(function(){
        $(this).attr("value","");
        $(this).val("");
    })
    $(".subway_station_add").blur(function(){
        if($(".subway_station_add").val()!=""){
            $(".station_haved").append("<div class='subway_station_check'>"+
                $(".subway_station_add").val()+"<span class='glyphicon glyphicon-remove'></span></div>");
                del_station();
        }
        $(this).attr("value","+");
        $(this).val("+");
    })

})