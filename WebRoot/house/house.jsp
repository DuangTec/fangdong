<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@ page import="com.fangdong.business.model.HouseVo"%>
<%@ page import="com.fangdong.business.model.FdRegion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit" />
<!--国产浏览器高速渲染360-->
<link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" />
<!--改变title图标：h5-->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--禁止百度转码-->
<title>我要租房</title>
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/bootstrap/css/duang.css" rel="stylesheet">
<link href="/bootstrap/css/house.css" rel="stylesheet">
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/index.do">Duang房咚网</a>
			<ul class="city-log-reg">
				<li class="dropdown">
					<%
						String regionCode = (String) session.getAttribute("regionCode");
						if ((regionCode == null) || (regionCode.equals("1"))) {
					%> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">重庆市<span
						class="caret"></span></a> <%
 	} else if (regionCode.equals("3")) {
 %> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">北京市<span
						class="caret"></span></a> <%
 	} else if (regionCode.equals("2")) {
 %> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">成都市<span
						class="caret"></span></a> <%
 	}
 %>
					<ul class="dropdown-menu">
						<li><a href="/changeregion.action?region=1">重庆市</a></li>
						<li><a href="/changeregion.action?region=2">成都市</a></li>
						<li><a href="/changeregion.action?region=3">北京市</a></li>
					</ul>
				</li>
				<%
					Subject currentUser = SecurityUtils.getSubject();
					if (currentUser.isAuthenticated()) {
				%>
				<li class="log-reg"><a href="/userinfo.do"><shiro:principal
							property="username" /></a>&nbsp;欢迎您 <span>|</span></li>
				<shiro:hasRole name="admin">
					<li class="log-reg"><a href="/admin.do">进入后台</a> <span>|</span>
					</li>
				</shiro:hasRole>
				<li class="log-reg"><a href="/logout.action">注销</a></li>
				<%
					} else {
				%>
				<li class="log-reg"><a href="/login.jsp">登录</a> <span>|</span>
				</li>
				<li class="log-reg"><a href="/signUp.jsp">注册</a></li>
				<%
					}
				%>
			</ul>
			<ul class="nav">
				<li class="normal"><a href="/index.do">首页</a></li>
				<li class="active"><a href="/house.do">我要租房</a></li>
				<li class="normal"><a href="/prompt.jsp">租前须知</a></li>
				<li class="normal"><a href="/house/createHouse.do">房东加盟</a></li>
				<li class="normal"><a href="/about_duang.jsp">关于杜昂</a></li>
			</ul>
		</div>
	</div>

	<!-- content -->
	<div class="screen">
		<div class="container">
			<div class="s-left">
				<div class="new row">
					<h4 class="col-xs-12">

						<span data-search-type="region"
							<c:if test="${param.searchRegionType!='hotRegion' and param.searchRegionType!='subway'}">class="now"</c:if>>区域找房</span>
						<span data-search-type="subway"
							<c:if test="${param.searchRegionType=='subway'}">class="now"</c:if>>地铁找房</span>
						<span data-search-type="hotRegion"
							<c:if test="${param.searchRegionType=='hotRegion'}">class="now"</c:if>>热门地区</span>

					</h4>
				</div>
				<div class="filter-row">
					<span class="filter-label"> 区域：</span>


					<div class="filter-tag first">
						<a href="#"
							<c:if test="${empty searchParam.l2RegionId}">class="active"</c:if>
							id="allfirst" data-l2regionid="all">全部</a>
						<c:if
							test="${searchParam.searchRegionType=='hotRegion' or searchParam.searchRegionType=='region'}">
							<c:forEach items="${fdRegionResult}" var="region">
								<a href="#"
									<c:if test="${searchParam.l2RegionId == region.id}">class="active"</c:if>
									data-l2regionid="${region.id}">${region.regionName}</a>
							</c:forEach>
						</c:if>
						<c:if test="${searchParam.searchRegionType=='subway'}">
							<c:forEach items="${subwayList}" var="subway">
								<a href="#"
									<c:if test="${searchParam.l2RegionId == subway.id}">class="active"</c:if>
									data-l2regionid="${subway.id}">${subway.subwayName}</a>
							</c:forEach>
						</c:if>
					</div>
					<div class="filter-row secondlevel"
						<c:if test="${!empty searchParam.l2RegionId}">style="display:block"</c:if>>
						<div class="filter-tag">
							<a href="#"
								<c:if test="${empty searchParam.l3RegionId}">class="active"</c:if>
								data-l3regionid="all">不限</a>
							<c:if test="${searchParam.searchRegionType=='region'}">
								<c:forEach items="${regionVoList}" var="region">
									<a href="#"
										<c:if test="${searchParam.l3RegionId == region.id}">class="active"</c:if>
										data-l3regionid="${region.id }"><span
										class="glyphicon glyphicon-map-marker"></span>${region.regionName }</a>
								</c:forEach>
							</c:if>

							<c:if test="${searchParam.searchRegionType=='subway'}">
								<c:forEach items="${subwayRegionList}" var="subwayRegion">
									<a href="#"
										<c:if test="${searchParam.l3RegionId == subwayRegion.regionId}">class="active"</c:if>
										data-l3regionid="${subwayRegion.regionId }"><span
										class="glyphicon glyphicon-map-marker"></span>${subwayRegion.regionName }</a>
								</c:forEach>
							</c:if>

							<c:if test="${searchParam.searchRegionType=='hotRegion'}">
								<c:forEach items="${hotRegionList}" var="hotRegion">
									<a href="#"
										<c:if test="${searchParam.l3RegionId == hotRegion.id}">class="active"</c:if>
										data-l3regionid="${hotRegion.id }"><span
										class="glyphicon glyphicon-map-marker"></span>${hotRegion.hotRegionName }</a>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<!--<div class="filter-tag">
                <c:choose>
                 <c:when test="${(district != null) and (district ne '')}">
                    <a href="/house.do?district=&rentprice=${rentprice}&housetype=${housetype}" class="">全部</a>
                    </c:when>	
                    <c:otherwise>
                    <a href="/house.do?district=&rentprice=${rentprice}&housetype=${housetype}" class="active">全部</a>
                    </c:otherwise>
                </c:choose>
                    <c:forEach items="${fdRegionResult }" var="districtResult">
                    <c:choose>
                    <c:when test="${district == districtResult.id }">
                    <a href="/house.do?district=${districtResult.id}&rentprice=${rentprice}&housetype=${housetype}" class="active">${districtResult.regionName }</a>
                    </c:when>
                    <c:otherwise>
                    <a href="/house.do?district=${districtResult.id}&rentprice=${rentprice}&housetype=${housetype}" class="">${districtResult.regionName }</a>
                    </c:otherwise>
                    </c:choose>                    
                    </c:forEach>     
                </div>-->
				</div>
				<div class="filter-row">
					<span class="filter-label"> 租金：</span>
					<div class="filter-tag rentprice">
						<a href="#" data-rentprice="all" <c:if test="${empty searchParam.lowerPrice and empty searchParam.upperPrice}">class="active"</c:if>>全部</a> <a href="#"
							data-rentprice="700L" <c:if test="${searchParam.upperPrice==700}">class="active"</c:if>>700以下</a> <a href="#"
							data-rentprice="700to1000" <c:if test="${searchParam.lowerPrice==700}">class="active"</c:if>>700-1000</a> <a href="#"
							data-rentprice="1000to1500" <c:if test="${searchParam.lowerPrice==1000}">class="active"</c:if>>1000-1500</a> <a href="#"
							data-rentprice="1500to2000" <c:if test="${searchParam.lowerPrice==1500}">class="active"</c:if>>1500-2000</a> <a href="#"
							data-rentprice="2000M" <c:if test="${searchParam.lowerPrice==2000}">class="active"</c:if>>2000以上</a>
					</div>
				</div>
				<div class="filter-row">
					<span class="filter-label"> 户型：</span>
					<div class="filter-tag housetype">
						<a href="#" data-housetype="all"<c:if test="${empty searchParam.roomNum and empty searchParam.hallNum}">class="active"</c:if>>全部</a> <a href="#"
							data-housetype="1n1" <c:if test="${searchParam.roomNum==1 and searchParam.hallNum==1}">class="active"</c:if>>一室一厅</a> <a href="#"
							data-housetype="2n1" <c:if test="${searchParam.roomNum==2 and searchParam.hallNum==1}">class="active"</c:if>>两室一厅</a> <a href="#"
							data-housetype="2n2" <c:if test="${searchParam.roomNum==2 and searchParam.hallNum==2}">class="active"</c:if>>两室两厅</a> <a href="#"
							data-housetype="3" <c:if test="${searchParam.roomNum==3}">class="active"</c:if>>三室</a>
					</div>
				</div>
                <div class="filter-row">
                    <span class="filter-label"> 租赁方式：</span>
                    <div class="filter-tag renttype">
                        <a href="#" data-renttype="all" <c:if test="${searchParam.rentType eq null}">class="active"</c:if>>全部</a>
                        <a href="#" data-renttype="single" <c:if test="${searchParam.rentType=='单间'}">class="active"</c:if>>单间</a>
                        <a href="#" data-renttype="whole" <c:if test="${searchParam.rentType=='整租'}">class="active"</c:if>>整租</a>
                    </div>
                </div>
				<!--  <div class="filter-row">
                <span class="filter-label"> 入住：</span>
                <div class="filter-tag">
                    <a href="#" class="active">全部</a>
                    <a href="#" class="">拎包入住</a>
                    <a href="#" class="">一周内</a>
                    <a href="#" class="">两周内</a>
                </div>
            </div> -->

				<div class="new row">
					<h4 class="col-xs-12">Search</h4>
				</div>
				<div class="search-box">
					<div class="container">
						<div class="row">
							<div class="col-xs-8">
								<form action="/house.do?type=fuzzySearch" method="post"
									autocomplete="off">
									<input type="text" name="index-search" value=""
										placeholder="请输入区域、商圈或小区名" class="index-search form-control" />
									<img src="/bootstrap/images/index-search-img.png" />
									<button type="submit" name="index-search-sub"
										class="index-search-sub">
										<img src="/bootstrap/images/index-search-sub.png">
									</button>
								</form>
							</div>
							<div class="col-xs-4"></div>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>
	<!-- 全部房源 -->
	<div class="hot-selected">
		<div class="container">
			<div class="new row">
				<h2 class="col-xs-12">全部房源</h2>
			</div>
			<div class="row hot-selected-content">
				<c:forEach items="${houseList }" var="house">
					<div class="col-xs-4">
						<div class="thumbnail">
							<a href="/house/houseDetail.do?houseid=${house.id }"
								target="_blank"> <img src="${house.pics[0] }" alt="...">
							</a>
							<div class="caption">
								<h3>
									<a href="#" title="${house.district} ${house.area}"
										target="_blank"> ${house.district } ${house.area} </a>
								</h3>
								<div class="item-info clearfix">
									<div class="item-loc pull-left">${house.title }</div>
									<div class="item-pri pull-right">￥${house.rentPrice }</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!--

<div class="pagenation text-center">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="#">首页</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">尾页</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
-->

	<!-- footer -->
	<div class="footer">
		<div class="container">
			<p>
				Copyright&copy;20170224<span></span>杜昂科技<br /> 重庆师范大学<span></span>安博教育集团<span></span>信息与计算科学(软件服务外包)
			</p>
			<a class="go-top">TOP</a>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="/bootstrap/js/jquery-1.12.1.min.js"></script>
	<script src="/bootstrap/js/bootstrap.js"></script>
	<script src="/bootstrap/js/duang.js"></script>
	<script src="/bootstrap/js/index.js"></script>
	<script src="/bootstrap/js/house.js"></script>
</body>
</html>