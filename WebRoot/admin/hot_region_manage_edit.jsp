<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>热门地区编辑-杜昂科技</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/admin_edit_common.css" rel="stylesheet">
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
                        <li><a href="admin.html">后台管理</a></li>
                        <li><a href="/admin/hotRegion.do">热门地区管理</a></li>
                        <c:choose>
                    	<c:when test="${type == 'create' }">
                    <li class="active">创建热门地区</li>
                    	</c:when>
                    	<c:otherwise>
                    <li class="active">热门地区编辑</li>
                    	</c:otherwise>
                    	</c:choose>
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
                        <form class="form-horizontal" action="/admin/editHotRegionSubmit.action?type=create" method="post">
                    	</c:when>
                    	<c:otherwise>
                        <form class="form-horizontal" action="/admin/editHotRegionSubmit.action" method="post">
                        </c:otherwise>
                    	</c:choose>
                        <input type="hidden" value="${hotRegion.id}" name="hotRegionId"/>
                                <div class="form-group">
                                    <label  class="col-xs-2 control-label">热门地区名称</label>
                                    <div class="col-xs-10">
                                        <input type="text" class="form-control" name="hotRegionName" id="hotRegionName" value="${hotRegion.hotRegionName}">
                                    </div>
                                </div> 
                                <div class="form-group">
								<label class="col-xs-2 control-label">热门地区类型</label>
								<div class="col-xs-10">
									<label class="checkbox-inline"><input type="radio"
										name="hotRegionType" value="1"
										<c:if test="${hotRegion.hotRegionType ==1 }">checked</c:if>>学校</label>
									<label class="checkbox-inline"><input type="radio"
										name="hotRegionType" value="2"
										<c:if test="${hotRegion.hotRegionType ==2 }">checked</c:if>>商圈</label>
								</div>
							</div>
                                <div class="form-group">
                                    <label  class="col-xs-2 control-label">热门地区关联地区</label>
                                    <div class="col-xs-10" id="region">
                                        <input type="text" class="form-control" id="regionName" value="${hotRegion.regionName}" readonly>
                                        <input type="hidden" id="regionId" name="regionId" value="${hotRegion.regionId}">
                                        <span class="glyphicon glyphicon-chevron-down edit_select_icon"></span>
                                        <ul class="edit-select_ul">
                                        </ul>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-offset-2 col-xs-2">
                                        <input type="submit" class="edit_submit" value="保存" >
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
<script src="/bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/admin_common.js"></script>
<script src="/bootstrap/js/hot_region_manage_edit.js"></script>
</body>
</html>