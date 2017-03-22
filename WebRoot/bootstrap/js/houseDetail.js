/**
 * Created by yey on 2017/3/16.
 */
$(function(){
    /*放大镜小图资源确定*/
    $(".scroll_inner img").click(function(){
        $(".house_small_img_preview img").attr("src",$(this).attr("src"));
        $(".house_big_img_preview img").attr("src",$(this).attr("src"));
    });
    /*图片左右切换*/
    $(".scroll_left").click(scrollLeft);
    function scrollLeft(){
        document.getElementsByClassName("scroll_outer")[0].scrollLeft-=100;
    }
    $(".scroll_right").click(scrollRight);
    function scrollRight(){
        document.getElementsByClassName("scroll_outer")[0].scrollLeft+=100;
    }
    /*放大镜*/
    $(".house_small_img_preview").mouseenter(function(){
        $(".move").css("display","block");
        $(".house_big_img_preview").css("display","block");
    });
    $(".house_small_img_preview").mouseleave(function(){
        $(".move").css("display","none");
        $(".house_big_img_preview").css("display","none");
    });
    //鼠标在小块的中央，且随着鼠标的移动块也移动：移动过程中鼠标的各项值是动态改变的
    $(".house_small_img_preview").mousemove(function (ev) {
        var evx=ev.pageX;
        var evy=ev.pageY;
        var small_x= $(".house_small_img_preview").offset().left;//没有单位，只读
        console.log(small_x)
        var small_y= $(".house_small_img_preview").offset().top;
        var move_width= $(".move").css("width");
        var move_height= $(".move").css("height");
        var small_width=$(".house_small_img_preview").css("width");
        var small_height=$(".house_small_img_preview").css("height");
        var move_top=evy-small_y-parseFloat(move_height)/2;//涉及样式属性：width和height的会有单位，可读可写，事先必须有定义
        var move_left=evx-small_x-parseFloat(move_width)/2;

        var move_maxx=parseFloat(small_width)-parseFloat(move_width);
        var move_maxy=parseFloat(small_height)-parseFloat(move_height);

        var bigimg_width=$(".house_big_img_preview img").css("width");
        var bigimg_height=$(".house_big_img_preview img").css("height");
        var big_width=$(".house_big_img_preview").css("width");
        var big_height=$(".house_big_img_preview").css("height");
        var big_move_maxx=parseFloat(bigimg_width)-parseFloat(big_width);
        var big_move_maxy=parseFloat(bigimg_height)-parseFloat(big_height);
        //将块控制在图片范围之类移动，移动不超出图片范围
        if(move_top<0){
            move_top=0
        }
        if(move_left<0){
            move_left=0
        }
        if(move_left>move_maxx){
            move_left=move_maxx;
        }
        if(move_top>move_maxy){
            move_top=move_maxy;
        }
        $(".move").css({top:move_top,left:move_left});//属性值也是有单位的
        //小图片中鼠标移动，大图片也随之同步移动，达到放大镜的效果
        /*var x_bili=move_left/move_maxx;//小图片的位置比例=移动的动态位置：可移动的最大范围（=小图片高宽-小块高宽）
         var y_bili=move_top/move_maxy;
         var big_img_top=y_bili*big_move_maxy;//因为比例相等，所以大图片的top和left的移动动态位置=比例位置*大图片可移动的最大位置
         var big_img_left=x_bili*big_move_maxx;
         $(".big img").css({top:-big_img_top,left:-big_img_left});*/
        var x_bili=move_left/parseFloat(small_width);//比例有两种方法
        var y_bili=move_top/parseFloat(small_height);
        var big_img_top=y_bili*parseFloat(bigimg_width);
        var big_img_left=x_bili*parseFloat(bigimg_height);
        $(".house_big_img_preview img").css({top:-big_img_top,left:-big_img_left});
    });
    /*看房电话显示*/
    $(".booking_house").click(function(){
        $(".house_phone").show(500,function(){
            $.ajax({
                url:"/getUserPhone.action",
                data:{ownerId:$("#ownerId").val()},
                success:function(result){
                    $(".news_text .new_text_phone").html(result);
                }
            });
            return true;
        });
    })
    /*未登录点击登录 */
    $(".login_to_book").click(function(){
        location.href = '/login.do';
    });
    $(".house_details_img").html($(".scroll_inner").html())
})