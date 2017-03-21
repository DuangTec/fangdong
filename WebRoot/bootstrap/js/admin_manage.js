/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top快速回顶*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });

    //编辑按钮
    $(".house_manage .house_news_edit").click(function(){
        window.location.href='house_manage_edit.html';
    })
    $(".user_manage .house_news_edit").click(function(){
        window.location.href='user_manage_edit.html';
    })
    //新建按钮
    $(".house_manage .add_news_but").click(function(){
        window.location.href='house_manage_edit.html';
    })
    $(".area_manage .add_news_but").click(function(){
        window.location.href='area_manage_edit.html';
    })
    $(".user_manage .add_news_but").click(function(){
        window.location.href='user_manage_edit.html';
    })
})
//删除按钮
function delRegion(id){
    window.location.href="/admin/deleteRegion.action?id="+id;
}

//编辑按钮
function editRegion(id){
    window.location.href="/admin/editRegion.do?id="+id;
}