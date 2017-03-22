/**
 * Created by yey on 2017/3/20.
 */
$(function(){
    /*go-top快速回顶*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });

})
//地区删除按钮
function delRegion(id){
    window.location.href="/admin/deleteRegion.action?id="+id;
}

//地区编辑按钮
function editRegion(id){
    window.location.href="/admin/editRegion.do?id="+id;
}
//新建地区按钮
function createRegion(){
    window.location.href="/admin/editRegion.do?type=create";
}
//房屋删除
function delHouse(id){
	window.location.href="/admin/deleteHouse.action?id="+id;
}

//房屋编辑
function editHouse(id){
	window.location.href="/admin/editHouse.do?id="+id;
}

//用户编辑
function editUser(id){
	window.location.href="/admin/editUser.do?id="+id;
}

//用户删除
function delUser(id){
	window.location.href="/admin/deleteUser.action?id="+id;
}
