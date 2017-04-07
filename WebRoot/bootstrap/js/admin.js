/**
 * Created by yey on 2017/3/19.
 */
$(function(){
    /*点击按钮跳转各自的后台管理界面*/
   /* $("#house_manegee").click(go_in_admin("house_manegee.html"));
    $("#area_manegee").click(go_in_admin("area_manegee.html"));
    $("#user_manegee").click(go_in_admin("user_manegee.html"));
    function go_in_admin(b){
        console.log(b)
      /!*  window.location.href=b;*!/
    }*/
    $("#house_manage").click(function(){
        window.location.href="/admin/house_manage.do";
    })
    $("#area_manage").click(function(){
        window.location.href="/admin/area_manage.do";
    })
    $("#user_manage").click(function(){
        window.location.href="/admin/user_manage.do";
    })
    $("#hot_area_manage").click(function(){
        window.location.href="/admin/hotRegion.do";
    })
    $("#subway_manage").click(function(){
        window.location.href="/admin/subway.do";
    })
})