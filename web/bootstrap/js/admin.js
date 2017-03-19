/**
 * Created by yey on 2017/3/19.
 */
$(function(){
    /*footer始终在底部*/
    pageButtomPos();
    function pageButtomPos(){
        var min_height=600;
        var screen_Height=window.innerHeight;
        /*console.log(screen_Height)*/
        var buttom=document.getElementsByClassName("footer")[0];
        if(screen_Height<min_height){
            buttom.style.top=(min_height-80)+"px";
        }else{
            buttom.style.top=(screen_Height-80)+"px";
        }
    }
    $(window).resize(pageButtomPos);

    /*点击按钮跳转各自的后台管理界面*/
   /* $("#house_manegee").click(go_in_admin("house_manegee.html"));
    $("#area_manegee").click(go_in_admin("area_manegee.html"));
    $("#user_manegee").click(go_in_admin("user_manegee.html"));
    function go_in_admin(b){
        console.log(b)
      /!*  window.location.href=b;*!/
    }*/
    $("#house_manegee").click(function(){
        window.location.href="#";
    })
    $("#area_manegee").click(function(){
        window.location.href="#";
    })
    $("#user_manegee").click(function(){
        window.location.href="#";
    })
})