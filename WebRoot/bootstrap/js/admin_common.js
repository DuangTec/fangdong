/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*footerÊ¼ÖÕÔÚµ×²¿*/
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
})