/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top���ٻض�*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    $(".house_news_del").click(function(){
        $(this).parent().parent().css("display","none")
    })
})