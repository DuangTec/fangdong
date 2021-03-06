<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>注册-杜昂科技房咚网</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/duang.css" rel="stylesheet">
    <link href="bootstrap/css/login_regist.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index.do">Duang房咚网</a>
        <ul class="city-log-reg">
            <li class="log-reg">
                <a href="/login.jsp">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="/signUp.jsp">注册</a></li>
        </ul>

    </div>
</div>
<div class="login_regist container">
    <div class="login_regist_box">
        <h1>用户注册</h1>
        <form action="/userSignUp.action" method="post" autocomplete="off">
            <ul>
                <li>
                    <input type="text" name="username_reg" id="username_reg" value=""
                           placeholder="请输入用户名" class="form-control"/>
                </li>
                <li>
                    <input type="password" name="password_reg" id="password_reg" value=""
                           placeholder="请输入密码" class="form-control"/>
                </li>
                <li>
                    <input type="password" name="password_rep" id="password_rep" value=""
                           placeholder="请再次输入密码" class="form-control"/>
                </li>
                <li>
                    <input type="submit" value="注&nbsp;&nbsp;册" name="regist"/>
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