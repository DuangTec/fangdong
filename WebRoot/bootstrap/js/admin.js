/**
 * Created by yey on 2017/3/19.
 */
$(function(){
    /*�����ť��ת���Եĺ�̨�������*/
   /* $("#house_manegee").click(go_in_admin("house_manegee.html"));
    $("#area_manegee").click(go_in_admin("area_manegee.html"));
    $("#user_manegee").click(go_in_admin("user_manegee.html"));
    function go_in_admin(b){
        console.log(b)
      /!*  window.location.href=b;*!/
    }*/
    $("#house_manage").click(function(){
        window.location.href="house_manage.html";
    })
    $("#area_manage").click(function(){
        window.location.href="area_manage.html";
    })
    $("#user_manage").click(function(){
        window.location.href="user_manage.html";
    })
})