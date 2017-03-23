<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"  %>
<%@page import="com.fangdong.business.model.HouseVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <a class="navbar-brand" href="/">Duang房咚网</a>
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
                <a href="/login.jsp">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="/signUp.jsp">注册</a></li>
            </shiro:guest>
        </ul>
        <ul class="nav">
            <li class="active"><a href="/index.do">首页</a></li>
            <li class="normal"><a href="/house.do?type=all">我要租房</a></li>
            <li class="normal"><a href="/prompt.html">租前须知</a></li>
            <li class="normal"><a href="#">房东加盟</a></li>
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
            <form  method="post" action="/userInfoSubmit.do" >
                <div class="row">
                    <div class="col-xs-3"></div>
                    <div class="col-xs-6">
                        <h5> <span class="red">*&nbsp;&nbsp;</span>我的账户信息</h5>
                        <div class="input-row">
                            <span class="input-label">用户名：</span>
                            <input type="text" class="form-control short" readonly="readonly" name="username" value="${user.username}">
                            <input type="hidden" value="${user.id}" name="userid"/>
                        </div>
                        <div class="input-row">
                            <span class="input-label">用户密码：</span>
                            <input type="text" class="form-control short" name="password" value="${user.password}">
                        </div>
                        <h5> <span class="red">*&nbsp;&nbsp;</span>我的详细信息</h5>
                        <div class="input-row">
                            <span class="input-label">联系人：</span>
                            <input type="text" class="form-control short" name="name" value="${user.name}">
                        </div>
                        <div class="input-row">
                            <span class="input-label">性别：</span>
                            <label class="checkbox-inline"><input type="radio" name="housetype" name="sex" value="男" <c:if test="${user.sex =='男' }">checked</c:if>>男</label>
                            <label class="checkbox-inline"><input type="radio" name="housetype" name="sex" value="女" <c:if test="${user.sex =='女' }">checked</c:if>>女</label>
                        </div>
                        <div class="input-row">
                            <span class="input-label">联系电话：</span>
                            <input type="text" class="form-control short"  name="phone" value="${user.phone}">
                        </div>
                        <div class="input-row">
                            <span class="input-label">权限：</span>
                            <c:if test="${user.authority =='2' }"><input type="text" class="form-control short" readonly="readonly" name="authority" value="管理员"></c:if>
                            <c:if test="${user.authority =='1' }"><input type="text" class="form-control short" readonly="readonly" name="authority" value="用户"></c:if>
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
                                <th>title</th>
                                <th>address</th>
                                <th>createDat</th>
                                <th>rentPrice</th>
                                <th class="col-lg-2 col-xs-2">相关操作</th>
                            </tr>
                            </thead>
                            <c:forEach items="${house }" var="house">
                            <tbody>
                            <tr>
                            	<td>${house.title}</td>
                            	<td>${house.address}</td>
                                <td><fmt:formatDate value='${house.createDate }' pattern='yyyy-MM-dd'/></td>
                                <td>${house.rentPrice}</td>
                                <td>
                                    <span class="glyphicon glyphicon-pencil" onclick="editHome(a)"></span>
                                    <span class="glyphicon glyphicon-trash" onclick="delHome(a)"></span>
                                </td>
                            </tr>
                            </tbody>
                            </c:forEach>
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