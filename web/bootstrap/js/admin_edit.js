/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top���ٻض�*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    /*input�۽�������ť���֣���ť���ģ��select���֣�select���input��ö�Ӧֵ*/
    $(".edit_select input").focus(function(){
        $(".edit_select_icon").css("display","block");
    })
    $(".edit_select_icon").click(function(){
        $(".edit-select_ul").slideToggle(500);
    })
    $(".edit-select_ul li").click(function(){
        $(".edit_select input").val($(this).html());
        $(".edit-select_ul").slideToggle(500);
        $(".edit_select_icon").css("display","none");
    })
})