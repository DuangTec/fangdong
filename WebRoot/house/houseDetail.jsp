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
    <title>房屋详情-杜昂科技</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/houseDetail.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.html">Duang房咚网</a>
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
            <shiro:authenticated>
	        <li class="log-reg">
                <a href="/userinfo.do"><shiro:principal property="username" /></a>&nbsp;欢迎您
            <span>|</span>
            </li>
            <shiro:hasRole name="admin">
            <li class="log-reg">
                <a href="/admin.do">进入后台</a>
            <span>|</span>
            </li>
            </shiro:hasRole>
            <li class="log-reg"><a href="/logout.action">注销</a></li>
            </shiro:authenticated>
            <shiro:guest>
            <li class="log-reg">
                <a href="/login.do">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="/signUp.jsp">注册</a></li>
            </shiro:guest>
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
                <c:if test="${pending == 'pending'}">
                <div class="house_manage">
                    <button type="button" onclick="passApproval(${house.id})" class="btn btn-info">审核通过</button>
                    <button type="button" onclick="failApproval(${house.id})" class="btn duang-btn-error">审核不通过</button>
                </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div class="house_preview">
    <div class="container">
        <div class="row house_preview_row">
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
                        <span class="news_title">面积：</span>
                        <span class="news_text">${house.size}㎡</span>
                    </li>
                    <li>
                        <span class="news_title">户型：</span>
                        <span class="news_text">${house.room}室${house.hall}厅</span>
                    </li>
                    <li>
                        <span class="news_title">租赁类型：</span>
                        <span class="news_text">${house.rentType}</span>
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
                    <li class="booking_house_but">
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
        <div class="row house_details_box_row">
            <div class="house_details col-xs-9">
                <a id="house_ul"></a>
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="#house_detail1">房屋描述</a></li>
                    <li role="presentation"><a href="#house_detail2">配套设施</a></li>
                    <li role="presentation"><a href="#house_detail3">房屋特点</a></li>
                    <li role="presentation"><a href="#house_detail4">房屋图片</a></li>
                </ul>
                <div class="house_detail_news">
                    <a id="house_detail1"></a>
                    <span class="house_detail_news_icon">房屋描述</span>
                    <div class="house_detail_content">
                        ${house.houseDetail}
                    </div>
                    <a href="#house_ul" class="glyphicon glyphicon-hand-up go_house_ul"></a>
                </div>
                <div class="house_detail_news">
                    <a id="house_detail2"></a>
                    <span class="house_detail_news_icon">配套设施</span>
                    <div class="house_detail_content">
                        <img src="/bootstrap/images/chuang.jpg">
                        <img src="/bootstrap/images/TV.jpg">
                        <img src="/bootstrap/images/kuandai.jpg">
                        <img src="/bootstrap/images/xiyiji.jpg">
                        <img src="/bootstrap/images/bingxiang.jpg">
                        <img src="/bootstrap/images/kongtiao.jpg">
                        <img src="/bootstrap/images/nuanqi.jpg">
                        <img src="/bootstrap/images/reshuiqi.jpg">
                        <img src="/bootstrap/images/tianranqi.jpg">
                        <img src="/bootstrap/images/jiaju.jpg">
                    </div>
                    <a href="#house_ul" class="glyphicon glyphicon-hand-up go_house_ul"></a>
                </div>
                <div class="house_detail_news">
                    <a id="house_detail3"></a>
                    <span class="house_detail_news_icon">房屋特点</span>
                    <div class="house_detail_content house_feature">
                        <c:forEach items="${house.features}" var="feature">
                        <span>${feature}</span>
                        </c:forEach>
                    </div>
                    <a href="#house_ul" class="glyphicon glyphicon-hand-up go_house_ul"></a>
                </div>
                <div class="house_detail_news">
                    <a id="house_detail4"></a>
                    <span class="house_detail_news_icon">房屋图片</span>
                    <div class="house_detail_content house_imgs">
                      <c:forEach items="${house.pics}" var="pic">
                       <img src="${pic}">
                        </c:forEach>
                    </div>
                    <a href="#house_ul" class="glyphicon glyphicon-hand-up go_house_ul"></a>
                </div>
            </div>
            <div class="you_like col-xs-3">
                    <ul class="you_like_title_box">
                        <li class="you_like_title">猜你喜欢</li>
                    </ul>
                    <div class="you_like_groups">
                        <c:forEach items="${guessYouLikeList}" var="house">
                        <div class="col-xs-12 you_like_one">
                            <div class="thumbnail">
                                <a href="/house/houseDetail.do?houseid=${house.id }"  target="_blank" class="you_like_img">
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