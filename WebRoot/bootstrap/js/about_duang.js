/**
 * Created by yey on 2017/3/22.
 */
$(function(){
    $(window).scroll(function() {
        var h = $(window).scrollTop();
        if(h>600){
            $(".form-nav").css("display","block");
        }else{
            $(".form-nav").css("display","none");
        }
    })
})