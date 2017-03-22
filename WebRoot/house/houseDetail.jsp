<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"  %>
<%@page import="com.fangdong.business.model.HouseVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>房屋详情-杜昂科技房咚网</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/houseDetail.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index.do">Duang房咚网</a>
        <ul class="city-log-reg">
            <li class="dropdown">
                <%String regionCode=(String)session.getAttribute("regionCode");
       			if((regionCode==null)||(regionCode.equals("1"))){%>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">重庆市<span class="caret"></span></a>
                <%} else if(regionCode.equals("3")){ %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">北京市<span class="caret"></span></a>
				<%} else if(regionCode.equals("2")){ %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成都市<span class="caret"></span></a>
				<%} %>		
                <ul class="dropdown-menu">
                    <li><a href="/changeregion.action?region=1">重庆市</a></li>
                    <li><a href="/changeregion.action?region=2">成都市</a></li>
                    <li><a href="/changeregion.action?region=3">北京市</a></li>
                </ul>
            </li>
            <%
		        Subject currentUser=SecurityUtils.getSubject();
		        if (currentUser.isAuthenticated()) {
	        %>
	        <li class="log-reg">
                <a href="#"><%=currentUser.getPrincipal()%></a>&nbsp;欢迎您
            <span>|</span>
            </li>
            <li class="log-reg"><a href="/logout.action">注销</a></li>
            <%} else{%>
            <li class="log-reg">
                <a href="/login.jsp">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="/signUp.jsp">注册</a></li>
            <%}%>
        </ul>
        <ul class="nav">
            <li class="normal"><a href="/index.do">首页</a></li>
            <li class="active"><a href="/house.do">我要租房</a></li>
            <li class="normal"><a href="#">租前须知</a></li>
            <li class="normal"><a href="#">房东加盟</a></li>
            <li class="normal"><a href="#">关于杜昂</a></li>
        </ul>
    </div>
</div>
<div class="house_path">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ol class="breadcrumb duang-breadcrumb">
                    <li><a href="/index.do">首页</a></li>
                    <li><a href="/house.do">我要租房</a></li>
                    <li class="active">
                        ${house.title }
                    </li>
                </ol>
            </div>
        </div>
    </div>
</div>
<div class="house_preview">
    <div class="container">
        <div class="row">
            <div class="col-xs-5 house_img_preview">
                <div class="row magnifier">
                    <div class="col-xs-12 house_small_img_preview">
                         <img src="${house.pics[0] }">
                        <div class="move"></div>
                    </div>
                    <div class="house_big_img_preview">
                        <img src="${house.pics[0] }">
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 scoll_img">
                        <span class="scroll_left">&lt;</span>
                        <div class="scroll_outer">
                            <div class="list-inline list-unstyled scroll_inner">
                            <c:forEach items="${house.pics }" var="pic">
                                <span><img src="${pic }"></span>
                            </c:forEach>
                            </div>
                        </div>
                        <span class="scroll_right">&gt;</span>
                    </div>
                </div>
            </div>
            <div class="col-xs-7 house_news_preview">
                <h1>${house.title}</h1>
                <ul class="house_news">
                    <li>
                        <span class="news_title">租金：</span>
                        <span class="news_text news_text_money">￥${house.rentPrice}</span>
                    </li>
                    <li>
                        <span class="news_title">户型：</span>
                        <span class="news_text">${house.room}室${house.hall}厅</span>
                    </li>
                    <li>
                        <span class="news_title">地址：</span>
                        <span class="news_text">
                            <a href="">${house.district}</a> -
                            <a href="">${house.area}</a> -
                            <a href="">${house.address}</a>
                        </span>
                    </li>
                    <li class="house_phone">
                        <span class="news_title">联系方式：</span>
                        <input type="hidden" value="${house.ownerId}" id="ownerId"/>
                        <span class="news_text new_text_phone">13511111111</span>
                    </li>
                    <li>
                    	<shiro:authenticated>
                       	<input type="button" value="我要看房" class="booking_house"/>
                    	</shiro:authenticated>
                    	<shiro:guest>
                    	<input type="button" value="登录查看联系方式" class="login_to_book booking_house" />
                    	</shiro:guest>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="house_details_box">
    <div class="container">
        <div class="row">
            <div class="house_details col-xs-12">
                <h2 class="house_details_title">房屋详情</h2>
                <div class="house_details_groups">
                    <h3>详情描述</h3>
                    <p style="width:70%">${house.houseDetail}</p>
                </div>
                <div class="house_details_groups">
                    <h3>配套设施</h3>
                    <c:forEach items="${house.facility }" var="equip" >
                    <span class="house_equipment">${equip}</span>
                    </c:forEach>
                        <!-- <span class="house_equipment house_equipment_no">水、电、气</span> -->
                </div>
                <div class="house_details_groups">
                        <h3>房屋图片</h3>
                        <div class="house_details_img"></div>
                    </div>
            </div>
        </div>
    </div>
</div>
<div class="you_like_box">
    <div class="container">
        <div class="row">
            <div class="you_like col-xs-12">
                <h2 class="you_like_title">猜你喜欢</h2>
                <div class="you_like_groups">
                
                <c:forEach items="${guessYouLikeList }" var="house">
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="/house/houseDetail.do?houseid=${house.id }" target="_blank">
                        <img src="${house.pics[0] }" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="${house.district} ${house.area}"
                                    target="_blank">
                                ${house.district } ${house.area}
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">${house.address }</div>
                            <div class="item-pri pull-right">￥${house.rentPrice }</div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <!-- 
                    <div class="col-xs-4 you_like_one">
                        <div class="thumbnail">
                            <a href="#" target="_blank" class="you_like_img">
                                <img src="/bootstrap/images/hot-selected1.png" alt="...">
                            </a>
                            <div class="caption">
                                <h3>
                                    <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                                       target="_blank">
                                        锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                                    </a>
                                </h3>
                                <div class="item-info clearfix">
                                    <div class="item-loc pull-left">比华利国际城二期比华利国际城二期比华利国际城二期比华利国际城二期</div>
                                    <div class="item-pri pull-right">￥590.00-800.00</div>
                                </div>
                            </div>
                        </div>
                    </div>
                   -->
                    
                    
                    
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <p>
            Copyright&copy;20170224<span></span>杜昂科技<br/>
            重庆师范大学<span></span>安博教育集团<span></span>信息与计算科学(软件服务外包)
        </p>
        <a class="go-top">TOP</a>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="/bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/duang.js"></script>
<script src="/bootstrap/js/houseDetail.js"></script>
</body>
</html>