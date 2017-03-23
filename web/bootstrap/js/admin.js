/**
 * Created by yey on 2017/3/19.
 */
$(function(){
    /*go-top¿ìËÙ»Ø¶¥*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    $("#house_manage").click(function(){
        window.location.href="house_manage.html";
    })
    $("#area_manage").click(function(){
        window.location.href="area_manage.html";
    })
    $("#user_manage").click(function(){
        window.location.href="user_manage.html";
    })
})