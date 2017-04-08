<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>修改密码-杜昂科技</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/duang.css" rel="stylesheet">
    <link href="bootstrap/css/login_regist.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.html">Duang房咚网</a>
        <ul class="city-log-reg">
            <li class="log-reg">
                <a href="/userinfo.do"><shiro:principal property="username" /></a>&nbsp;欢迎您
            <span>|</span>
            </li>
				<li class="log-reg"><a href="/logout.action">退出登录</a></li>
        </ul>
    </div>
</div>
<div class="login_regist container edit_pwd_box">
    <div class="login_regist_box edit_pwd">
        <h1>修改密码</h1>
        <form action="/changePassowordSubmit.action?id=<shiro:principal property='id'/>" method="post" autocomplete="off">
            <ul>
                <li>
                    <span class="title">账户名：</span>
                    <span class="edit_pwd_phone">
                        <shiro:principal property="username" />
                    </span>
                </li>
                <li>
                    <span class="title">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
                    <input type="password" name="regist_pwd" id="regist_pwd" value=""
                           placeholder="请输入密码" class="form-control"/>
                </li>
                <li>
                    <span class="title">确认密码：</span>
                    <input type="password" name="regist_repwd" id="regist_repwd" value=""
                           placeholder="请再次输入密码" class="form-control"/>
                </li>
                <li>
                    <span class="title"></span>
                    <input type="submit" value="确&nbsp;&nbsp;定" name="regist"/>
                </li>
            </ul>
        </form>
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
<script src="bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/jquery.validate-1.13.1.js"></script>
<script src="bootstrap/js/login_regist.js"></script>
</body>
</html>