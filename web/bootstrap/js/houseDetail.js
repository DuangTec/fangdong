/**
 * Created by yey on 2017/3/16.
 */
$(function(){
    /*�Ŵ�Сͼ��Դȷ��*/
    $(".scroll_inner img").click(function(){
        $(".house_small_img_preview img").attr("src",$(this).attr("src"));
        $(".house_big_img_preview img").attr("src",$(this).attr("src"));
    });
    /*ͼƬ�����л�*/
    $(".scroll_left").click(scrollLeft);
    function scrollLeft(){
        document.getElementsByClassName("scroll_outer")[0].scrollLeft+=100;
    }
    $(".scroll_right").click(scrollRight);
    function scrollRight(){
        document.getElementsByClassName("scroll_outer")[0].scrollLeft-=100;
    }
    /*�Ŵ�*/
    $(".house_small_img_preview").mouseenter(function(){
        $(".move").css("display","block");
        $(".house_big_img_preview").css("display","block");
    });
    $(".house_small_img_preview").mouseleave(function(){
        $(".move").css("display","none");
        $(".house_big_img_preview").css("display","none");
    });
    //�����С������룬�����������ƶ���Ҳ�ƶ����ƶ����������ĸ���ֵ�Ƕ�̬�ı��
    $(".house_small_img_preview").mousemove(function (ev) {
        var evx=ev.pageX;
        var evy=ev.pageY;
        var small_x= $(".house_small_img_preview").offset().left;//û�е�λ��ֻ��
        console.log(small_x)
        var small_y= $(".house_small_img_preview").offset().top;
        var move_width= $(".move").css("width");
        var move_height= $(".move").css("height");
        var small_width=$(".house_small_img_preview").css("width");
        var small_height=$(".house_small_img_preview").css("height");
        var move_top=evy-small_y-parseFloat(move_height)/2;//�漰��ʽ���ԣ�width��height�Ļ��е�λ���ɶ���д�����ȱ����ж���
        var move_left=evx-small_x-parseFloat(move_width)/2;

        var move_maxx=parseFloat(small_width)-parseFloat(move_width);
        var move_maxy=parseFloat(small_height)-parseFloat(move_height);

        var bigimg_width=$(".house_big_img_preview img").css("width");
        var bigimg_height=$(".house_big_img_preview img").css("height");
        var big_width=$(".house_big_img_preview").css("width");
        var big_height=$(".house_big_img_preview").css("height");
        var big_move_maxx=parseFloat(bigimg_width)-parseFloat(big_width);
        var big_move_maxy=parseFloat(bigimg_height)-parseFloat(big_height);
        //���������ͼƬ��Χ֮���ƶ����ƶ�������ͼƬ��Χ
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
        $(".move").css({top:move_top,left:move_left});//����ֵҲ���е�λ��
        //СͼƬ������ƶ�����ͼƬҲ��֮ͬ���ƶ����ﵽ�Ŵ󾵵�Ч��
        /*var x_bili=move_left/move_maxx;//СͼƬ��λ�ñ���=�ƶ��Ķ�̬λ�ã����ƶ������Χ��=СͼƬ�߿�-С��߿�
         var y_bili=move_top/move_maxy;
         var big_img_top=y_bili*big_move_maxy;//��Ϊ������ȣ����Դ�ͼƬ��top��left���ƶ���̬λ��=����λ��*��ͼƬ���ƶ������λ��
         var big_img_left=x_bili*big_move_maxx;
         $(".big img").css({top:-big_img_top,left:-big_img_left});*/
        var x_bili=move_left/parseFloat(small_width);//���������ַ���
        var y_bili=move_top/parseFloat(small_height);
        var big_img_top=y_bili*parseFloat(bigimg_width);
        var big_img_left=x_bili*parseFloat(bigimg_height);
        $(".house_big_img_preview img").css({top:-big_img_top,left:-big_img_left});
    });
})