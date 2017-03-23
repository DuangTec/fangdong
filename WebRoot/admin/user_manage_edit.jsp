<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fangdong.auth.model.FdUser" %>
<%@page import="com.fangdong.auth.model.FdUserExample" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <c:choose>
    <c:when test="${type == 'create' }">
    <title>新建用户-杜昂科技房咚网</title>    	
    </c:when>
    <c:otherwise>
    <title>用户编辑-杜昂科技房咚网</title>
    </c:otherwise>
    </c:choose>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../bootstrap/css/duang.css" rel="stylesheet">
    <link href="../bootstrap/css/admin_edit_common.css" rel="stylesheet">
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
	<div class="edit_page_box">
	    <div class="container">
	        <div class="row">
	            <div class="col-xs-12">
	                <ol class="breadcrumb">
	                    <li><a href="/admin.do">后台管理</a></li>
	                    <li><a href="house_manage.do">用户管理</a></li>
	                    <li class="active">用户编辑</li>
	                </ol>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-xs-10">
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h3 class="panel-title">编辑列表</h3>
	                    </div>
	                    <div class="panel-body"> 
	                    <c:choose>
	                    	<c:when test="${type == 'create' }">
	                        <form class="form-horizontal" action="/admin/editUserSubmit.action?type=create" method="post">
	                    	</c:when>
	                    	<c:otherwise>
	                        <form class="form-horizontal" action="/admin/editUserSubmit.action" method="post">                 
	                     	</c:otherwise>
	                    	</c:choose>
	                 
	                            <div class="form-group">
	                                <label for="input1" class="col-xs-2 control-label">姓名</label>
	                                <div class="col-xs-10">
	                                    <input type="text" class="form-control" id="input1" name="name" value='${AditUser.name}'>
	                                    <input type="hidden" value="${AditUser.id}" name="userid"/>
	                                </div>
	                            </div>                      
	                            <div class="form-group">
	                                <label for="input2" class="col-xs-2 control-label">用户名</label>
	                                <div class="col-xs-10">
	                                    <input type="text" class="form-control" id="input2" name="username" value='${AditUser.username}'>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label for="input3" class="col-xs-2 control-label">密码</label>
	                                <div class="col-xs-10">
	                                    <input type="text" class="form-control" id="input3" name="password" value='${AditUser.password}'>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label for="input4" class="col-xs-2 control-label">电话</label>
	                                <div class="col-xs-10">
	                                    <input type="text" class="form-control" id="input4" name="phone" value="${AditUser.phone}">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label for="input4" class="col-xs-2 control-label">权限(1普通/2管理)</label>
	                                <div class="col-xs-10" >
	                                    <label class="checkbox-inline"><input type="radio" name="authority" value="1" <c:if test="${AditUser.authority ==1 }">checked</c:if>>普通用户</label>
	                                    <label class="checkbox-inline"><input type="radio" name="authority" value="2" <c:if test="${AditUser.authority ==2 }">checked</c:if>>管理员</label>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label for="input4" class="col-xs-2 control-label">性别</label>
	                                <div class="col-xs-10">
	                                    <label class="checkbox-inline"><input type="radio" name="sex" value="男" <c:if test="${AditUser.sex =='男' }">checked</c:if>>男</label>
	                                    <label class="checkbox-inline"><input type="radio" name="sex" value="女" <c:if test="${AditUser.sex =='女' }">checked</c:if>>女</label>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <div class="col-xs-offset-2 col-xs-2">
	                                    <input type="submit" class="edit_submit" value="保存">
	                                </div>
	                            </div>
	                        </form>
	                    </div>
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
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="../bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
<script src="../bootstrap/js/admin_common.js"></script>
<script src="../bootstrap/js/admin_edit.js"></script>
</body>
</html>