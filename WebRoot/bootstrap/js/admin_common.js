/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top快速回顶*/
	$(".go-top").click(function () {
		$(window).scrollTop(0);
	});
    /*footer始终在底部*/
    pageButtomPos();
    function pageButtomPos(){      
        var center_content_height=parseFloat($(".center_content").css("height"));
        var screen_Height=window.innerHeight;
        var buttom=document.getElementsByClassName("footer")[0];
        console.log(center_content_height)
                console.log(screen_Height-80)
                if(screen_Height-80<center_content_height){
                    buttom.style.top=center_content_height+"px";
        }else{
            buttom.style.top=(screen_Height-80)+"px";
        }
    }
    $(window).resize(pageButtomPos);
})