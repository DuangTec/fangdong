/**
 * Created by yey on 2017/3/20.
 */
$(function() {
	/*go-top快速回顶*/
	$(".go-top").click(function() {
		$(window).scrollTop(0);
	});
	/*获取所有父级地区*/
	getParentsRegion();
	/*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
	$(".edit_select input").focus(function() {
		$(".edit_select_icon").css("display", "block")
	})
	$(".edit_select_icon").click(
			function() {
				$(".edit-select_ul").slideToggle(500)
				$(".edit-select_ul li")
						.click(
								function() {
									$(this).parents(".edit_select").children(
											"input").attr("value",
											$(this).html());
									/*alert($(".edit_select input").attr("value"));
									 alert($(".edit_select input").val());*/
									$(this).parents(".edit_select").children(
											"input").attr("id",
											$(this).attr("id"));
									$(this).parents(".form-group").children(
											"label").attr("for",
											$(this).attr("id"));
									$(this).parents(".edit_select").children(
											".edit-select_ul").slideUp(500);
									$(this).parents(".edit_select").children(
											".edit_select_icon").css("display",
											"none");
								});
			});
	/*删除站点*/
	del_station()
	function del_station() {
		$(".glyphicon-remove").click(function() {
			$(this).parent(".subway_station_check").css("display", "none");
			var subwayRegionId=$(this).parent().next().text();
			window.location.href = "/admin/delSubwayRegion.action?subwayRegionId="+ subwayRegionId;
		})
	}
	/*添加站点*/
	$(".subway_station_add").click(function() {
		getSonRegion();
		$(".subway_station_add_select").slideToggle(100);
	})
	$(".add_station")
			.click(
					function() {				
						if ($(".yiji").val() != "" && $(".erji").val() != ""/*&& $(".sanji").val()!=""*/) {
							$(".station_haved")
									.append(
											"<div class='subway_station_check'>"
													+ $(".yiji").attr("value")
													+ $(".erji").val()/*+$(".sanji").val()*/
													+ "<span class='glyphicon glyphicon-remove'></span></div>");
							del_station();
						}
					})

})

function getParentsRegion() {
	$.ajax({
		url : "/admin/getParentsRegion.action",
		success : function(resultList) {
			$.each(resultList, function(index, element) {
				$(".edit_select .edit-select_ul").append(
						"<li id=" + element.id + ">" + element.regionName
								+ "</li>");
			});
			//绑定点击事件
			$(".edit-select_ul li").click(function() {
				$("#parentRegionName").attr("value", $(this).html());
				$("#parentRegionId").attr("value", $(this).attr("id"));
				$(".select_control_label").attr("for", $(this).attr("id"));
				$(".edit-select_ul").slideToggle(500);
				$(".edit_select_icon").css("display", "none");
			});
		}
	});
}

function getSonRegion() {
	$.ajax({
		url : "/admin/getSonRegion.action",
		success : function(resultList1) {
			$.each(resultList, function(index, element) {
				$(".subway_select_groups .uxz").append(
						"<li id=" + element.id + ">" + element.regionName
								+ "</li>");
			});
			//绑定点击事件
			$(".edit-select_ul li").click(function() {
				$("#SonRegionName").attr("value", $(this).html());
				$("#SonRegionId").attr("value", $(this).attr("id"));
				$(".select_control_label").attr("for", $(this).attr("id"));
				$(".edit-select_ul").slideToggle(500);
				$(".edit_select_icon").css("display", "none");
			});
		}
	});
}

function delSubwayRegion(id) {
	window.location.href = "/admin/delSubway.action?id=" + id;
}

function addSubwayRegion(name) {
	window.location.href = "/admin/delSubway.action?name=" + name;
}
