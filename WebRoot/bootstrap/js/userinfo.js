/**
 * Created by sony on 2017/3/22.
 */
// 房屋编辑
function editHome(id){
    window.location.href="/house/updateHouse.action?id="+id;
}
//房屋删除
function delHome(id){
	window.location.href="/deleteHome.action?id="+id;
}
//刷新房屋
function refreshHome(id){
	window.location.href="/refreshHouse.action?id="+id;
}
//房屋下架
function takeOffHouse(id){
	window.location.href="/takeOffHouse.action?id="+id;
}
//房屋上架
function putOnHouse(id){
	window.location.href="/putOnHouse.action?id="+id;
}
//充值
function recharge(id){
	window.location.href="/recharge.do?id="+id;
}