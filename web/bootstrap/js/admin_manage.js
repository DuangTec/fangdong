/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top快速回顶*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    /*管理界面删除条目*/
    $(".house_news_del").click(function(){
        $(this).parent().parent().css("display","none");
    })
    /*地铁线路删除*/
    $(".subway_line_del").click(function(){
        $(this).parents(".panel").css("display","none");
    })
    /*编辑跳转*/
    $(".house_manage .house_news_edit").click(function(){
        window.location.href='house_manage_edit.html';
    })
    $(".area_manage .house_news_edit").click(function(){
        window.location.href='area_manage_edit.html';
    })
    $(".user_manage .house_news_edit").click(function(){
        window.location.href='user_manage_edit.html';
    })
    $(".hot_area_manage .house_news_edit").click(function(){
        window.location.href='hot_area_manage_edit.html';
    })
    $(".subway_manage .house_news_edit").click(function(){
        window.location.href='subway_manage_edit.html';
    })
    /*添加条目跳转编辑*/
    $(".house_manage .add_news_but").click(function(){
        window.location.href='house_manage_edit.html';
    })
    $(".area_manage .add_news_but").click(function(){
        window.location.href='area_manage_edit.html';
    })
    $(".user_manage .add_news_but").click(function(){
        window.location.href='user_manage_edit.html';
    })
    $(".hot_area_manage .add_news_but").click(function(){
        window.location.href='hot_area_manage_edit.html';
    })
    $(".subway_manage .add_news_but").click(function(){
        window.location.href='subway_manage_edit.html';
    })
    $(".subway_manage .subway_news_edit").click(function(){
        window.location.href='subway_manage_edit.html';
    })
})