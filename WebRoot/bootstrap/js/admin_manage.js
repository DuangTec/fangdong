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
//新建房屋
function createHouse(){
    window.location.href="/admin/editHouse.do?type=create";
}

//用户编辑
function editUser(id){
	window.location.href="/admin/editUser.do?id="+id;
}
//用户删除
function delUser(id){
	window.location.href="/admin/deleteUser.action?id="+id;
}
//新建用户按钮
function createUser(){
    window.location.href="/admin/editUser.do?type=create";
}


//新建热门地区
function createHotRegion(){
    window.location.href="/admin/editHotRegion.do?type=create";
}
//热门地区删除
function delHotRegion(id){
	window.location.href="/admin/delHotRegion.action?id="+id;
}
//热门地区编辑编辑
function editHotRegion(id){
	window.location.href="/admin/editHotRegion.do?id="+id;
}

//新建地铁
function createSubway(){
    window.location.href="/admin/editSubway.do?type=create";
}
//地铁线路删除
function delSubway(id){
	window.location.href="/admin/delSubway.action?id="+id;
}
//地铁线路编辑
function editSubway(id){
	window.location.href="/admin/editSubway.do?id="+id;
}
