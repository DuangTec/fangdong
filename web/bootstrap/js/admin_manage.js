/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top���ٻض�*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    $(".house_news_del").click(function(){
        $(this).parent().parent().css("display","none");
    })
    $(".house_manage .house_news_edit").click(function(){
        window.location.href='house_manage_edit.html';
    })
    $(".area_manage .house_news_edit").click(function(){
        window.location.href='area_manage_edit.html';
    })
    $(".user_manage .house_news_edit").click(function(){
        window.location.href='user_manage_edit.html';
    })
})