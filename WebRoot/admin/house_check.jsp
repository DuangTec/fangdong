<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fangdong.business.model.HouseVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="com.fangdong.auth.model.FdUser"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="../bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>房屋审核-杜昂科技</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/admin_manage_common.css" rel="stylesheet">
    <link href="/bootstrap/css/house_manage.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index.do">Duang房咚网</a>
        <ul class="city-log-reg esc_login">
            <li class="log-reg">
                <a href="/userinfo.do"><shiro:principal property="username" /></a>&nbsp;欢迎您
            <span>|</span>
            </li>
				<li class="log-reg"><a href="/logout.action">退出登录</a></li>
        </ul>
    </div>
</div>
<div class="center_content">
    <div class="manage_box house_manage">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 manege_nav_box">
                    <ul class="manege_nav">
                        <li><a href="house_manage.do">房屋管理</a></li>
                        <li class="active"><a href="house_check.do">房屋审核</a></li>
                        <li><a href="area_manage.do">地区管理</a></li>
                        <li><a href="user_manage.do">用户管理</a></li>
                        <li><a href="subway.do">地铁管理</a></li>
                        <li><a href="hotRegion.do">热门地区管理</a></li>
                    </ul>
                </div>
                <div class="col-xs-10  manage_table">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>房屋标题</th>
                            <th>提前审批1</th>
                            <th>房屋状态</th>
                            <th class="col-lg-2 col-xs-2 text-center">相关操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pendingHouseList}" var="house"> 
                        <tr>
                            <td class="house_name"><a href="/house/houseDetail.do?pending=pending&houseid=${house.id}">${house.title}</a></td>
                            <td>${house.priorApproval}</td>
                            <td>${house.houseStatus}</td>
                            <td class="text-center">
                                <span class="house_news_check"><a href="/house/houseDetail.do?pending=pending&houseid=${house.id}">审核</a></span>
                            </td>
                        </tr>
						</c:forEach>
                        </tbody>
                    </table>
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
<script src="../bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
<script src="../bootstrap/js/admin_common.js"></script>
<script src="../bootstrap/js/admin_manage.js"></script>
</body>
</html>