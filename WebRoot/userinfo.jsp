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
    <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>用户信息</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/duang.css" rel="stylesheet">
    <link href="bootstrap/css/index.css" rel="stylesheet">
    <link href="bootstrap/css/userinfo.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Duang房咚网</a>
        <ul class="city-log-reg">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成都<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">成都</a></li>
                    <li><a href="#">北京</a></li>
                </ul>
            </li>
            <li class="log-reg">
                <a href="login.html">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="regist.html">注册</a></li>
        </ul>
        <ul class="nav">
            <li class="normal"><a href="#">首页</a></li>
            <li class="normal"><a href="#">我要租房</a></li>
            <li class="normal"><a href="#">租前须知</a></li>
            <li class="active"><a href="#">房东加盟</a></li>
            <li class="normal"><a href="#">关于杜昂</a></li>
        </ul>
    </div>
</div>

<!-- content -->
<div class="userinfo">
    <div class="container">
        <div class="info-title">
            <h3>我的信息</h3>
            <h5>My Information</h5>
        </div>
        <div class="con-input">
            <form action="" method="post">
                <div class="row">
                    <div class="col-xs-3"></div>
                    <div class="col-xs-6">
                        <h5> <span class="red">*&nbsp;&nbsp;</span>我的账户信息</h5>
                        <div class="input-row">
                            <span class="input-label">用户名：</span>
                            <input type="text" class="form-control short" readonly="readonly" value="123123">
                        </div>
                        <div class="input-row">
                            <span class="input-label">用户密码：</span>
                            <input type="text" class="form-control short">
                        </div>
                        <h5> <span class="red">*&nbsp;&nbsp;</span>我的详细信息</h5>
                        <div class="input-row">
                            <span class="input-label">联系人：</span>
                            <input type="text" class="form-control short" value="小明">
                        </div>
                        <div class="input-row">
                            <span class="input-label">性别：</span>
                            <input type="text" class="form-control short" value="女">
                        </div>
                        <div class="input-row">
                            <span class="input-label">联系电话：</span>
                            <input type="text" class="form-control short"  value="13188888888">
                        </div>
                        <div class="input-row">
                            <span class="input-label">权限：</span>
                            <input type="text" class="form-control short" readonly="readonly" value="总管">
                        </div>

                        <h5>我的租房信息</h5>



                    </div>
                    <div class="col-xs-3"></div>
                </div>
                <div class="row">
                    <div class="col-xs-1"></div>
                    <div class="col-xs-10">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Title</th>
                                <th>地址</th>
                                <th class="col-lg-2 col-xs-2">相关操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><a href="#">123</a></td>
                                <td>555555555555</td>
                                <td>
                                    <span class="glyphicon glyphicon-pencil" onclick="editHome(a)"></span>
                                    <span class="glyphicon glyphicon-trash" onclick="delHome(a)"></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-xs-1"></div>
                </div>

                <div class="row">
                    <div class="col-xs-5"></div>
                    <div class="col-xs-4"><button type="submit" class="btn btn-primary sub">Submit</button></div>
                    <div class="col-xs-3"></div>
                </div>
            </form>
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
<script src="bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/index.js"></script>
<script src="bootstrap/js/userinfo.js"></script>
</body>
</html>