<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="com.fangdong.business.model.HouseVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@page import="com.fangdong.auth.model.FdUser"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>关于杜昂-杜昂科技</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/duang.css" rel="stylesheet">
    <link href="bootstrap/css/about_duang.css" rel="stylesheet">
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
            <li class="normal"><a href="/house.do">我要租房</a></li>
            <li class="normal"><a href="/prompt.jsp">租前须知</a></li>
            <li class="normal"><a href="/house/createHouse.do">房东加盟</a></li>
            <li class="active"><a href="/about_duang.jsp">关于杜昂</a></li>
        </ul>
    </div>
</div>
<div class="about_us_banner">
    <img src="bootstrap/images/about_duang0.jpg"/>
</div>
<div class="about_duang">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="about_duang_box">
                    <div id="page2">
                        <h1><img src="bootstrap/i/Duang.jpg">Duang-杜昂科技</h1>
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <img src="bootstrap/images/about_duang1.jpg" alt="...">
                                    <div class="caption">
                                        <h3>公司成立</h3>
                                        <p>duang科技成立于20014年12月，六人现任企业总裁。经过几年发展，其实并没有什么发展。</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <img src="bootstrap/images/about_duang2.jpg" alt="...">
                                    <div class="caption">
                                        <h3>公司还没上市</h3>
                                        <p>2013年10月31日，duang科技正式于纽交所挂牌上市，这标志着duang科技成功登陆美国资本市场成为一家生活服务领域的上市企业。</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="thumbnail">
                                    <img src="bootstrap/images/about_duang3.jpg" alt="...">
                                    <div class="caption">
                                        <h3>公司价值</h3>
                                        <p>依托于人们飞速发展的日常生活需求，duang科技秉承着“人人信赖的生活服务平台”的愿景和“用户第一、主动协作、简单可信、创业精神、学习成长” 的核心价值观，以“人人信赖的生活服务平台”为愿景，孜孜不倦地追求技术的创新以及服务品类的纵深发展，致力于持续为用户提供“本地、免费、真实、高效”的生活服务。</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="page3">
                        <h1><img src="bootstrap/images/about_duang4.jpg">基本信息</h1>
                        <p>业务范畴<span class="glyphicon glyphicon-hand-right"></span>外包服务，毕业设计以及各种混吃等死</p>
                        <p>核心业务<span class="glyphicon glyphicon-hand-right"></span>租房，为普通人提供便利</p>
                        <p>公司电话<span class="glyphicon glyphicon-hand-right"></span>13511111111</p>
                    </div>
                    <div id="page4">
                        <h1><img src="bootstrap/images/about_duang5.jpg">核心价值观</h1>
                        <p>用户第一、主动协作、简单可信、创业精神、学习成长</p>
                    </div>
                    <div id="page5">
                        <h1><img src="bootstrap/images/about_duang6.jpg">杜昂的使命</h1>
                        <p>通过互联网让人们生活更简单</p>
                    </div>
                    <div id="page6">
                        <h1><img src="bootstrap/images/about_duang7.jpg">我们的愿景</h1>
                        <p class="font_big">成为 >> 海贼王！</p>
                    </div>
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
<ul class="form-nav">
        <li><a href="#page2"></a></li>
        <li><a href="#page3"></a></li>
        <li><a href="#page4"></a></li>
        <li><a href="#page5"></a></li>
        <li><a href="#page6"></a></li>
    </ul>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/duang.js"></script>
<script src="bootstrap/js/about_duang.js"></script>
</body>
</html>