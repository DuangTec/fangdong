/**
 * Created by yey on 2017/3/19.
 */
$(function(){
    /*go-top���ٻض�*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    /*���������л�*/
    function dropdownActive(){
        $(".dropdown-toggle").html($(this).text()+'<span class="caret"></span>');
    }
    $(".dropdown-menu a").click(dropdownActive);
    function navBgColor(){
        $(this).parent().attr("class","active").siblings().attr("class","normal");
    }
    $(".nav a").click(navBgColor);
})