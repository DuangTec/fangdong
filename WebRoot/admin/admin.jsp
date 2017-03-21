<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>后台管理-杜昂科技房咚网</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/admin.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/index.do">Duang房咚网</a>
        <ul class="city-log-reg esc_login">
            <li class="log-reg">
                <a href="/logout.action">退出登录</a>
            </li>
        </ul>
    </div>
</div>
<div class="go_in_buts">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-xs-offset-3">
                <ul class="list-unstyled list-inline row">
                    <li class="col-xs-4">
                        <input type="button" name="house_manegee" id="house_manage" value="房屋管理"/>
                    </li>
                    <li class="col-xs-4">
                        <input type="button" name="area_manegee" id="area_manage" value="地区管理"/>
                    </li>
                    <li class="col-xs-4">
                        <input type="button" name="user_manegee" id="user_manage" value="用户管理"/>
                    </li>
                </ul>
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
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="/bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/admin_common.js"></script>
<script src="/bootstrap/js/admin.js"></script>
</body>
</html>