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

    /*自动跳转*/
    var ocountDownVal=document.getElementsByClassName("countDown")[0];
    var num=parseInt(ocountDownVal.innerHTML);
    function countDown(){
        num--;
        console.log(num)
        ocountDownVal.innerHTML=num+"s";
        if(num==0){
            clearInterval(InterValObj);
            window.location.href='index.html';
        }
    }
    InterValObj=setInterval(countDown,1000);
})
