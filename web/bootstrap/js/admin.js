/**
 * Created by yey on 2017/3/19.
 */
$(function(){
    /*go-top*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    $("#house_manage").click(function(){
        window.location.href="house_manage.html";
    })
    $("#house_check").click(function(){
        window.location.href="house_check.html";
    })
    $("#area_manage").click(function(){
        window.location.href="area_manage.html";
    })
    $("#user_manage").click(function(){
        window.location.href="user_manage.html";
    })
    $("#hot_area_manage").click(function(){
        window.location.href="hot_area_manage.html";
    })
    $("#subway_manage").click(function(){
        window.location.href="subway_manage.html";
    })
})