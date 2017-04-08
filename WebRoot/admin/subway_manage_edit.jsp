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
    <link rel="icon" type="image/png" href="../bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>地铁编辑-杜昂科技</title>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../bootstrap/css/duang.css" rel="stylesheet">
    <link href="../bootstrap/css/admin_edit_common.css" rel="stylesheet">
    <link href="../bootstrap/css/subway_edit.css" rel="stylesheet">
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
                        <li><a href="subway.do">地铁管理</a></li>
                        <li class="active">地铁编辑</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-11">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">编辑列表</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" action="/admin/createSubwayRegion.action" method="post">
                                <div class="form-group">
                                    <label  class="col-xs-2 control-label">地铁线路名称</label>
                                    <div class="col-xs-10">
                                        <input type="text" class="form-control" id="input1" name="subwayName" value="${subway.subwayName}" readonly>
                                        <input type="hidden" class="form-control1" id="input2" name="subwayId" value="${subway.id}">
                                        <input type="hidden" id="city_id" name="city_id" value="${subway.regionId}">
                                    </div>
                                </div>
                                <div class="form-group subway_station_box">
                                    <label  class="col-xs-2 control-label">站点</label>
                                    <span class="col-xs-10 subway_station_edit">
                                       <span class="station_haved">
                                       <c:forEach items="${station}" var="subwayStation">
                                            <div class="subway_station_check" id="station" name="subwaysation">${subwayStation.regionName}<span class="glyphicon glyphicon-remove"></span></div>
                                            <div class="hidden" name="subwayRegionId">${subwayStation.id}</div>
                                       </c:forEach>     
                                       </span>
                                       <span class="subway_station_add"/>+</span>
                                       <div class="subway_station_add_select">
                                               <div class="edit_select subway_select_groups district_groups">
                                                   <input type="hidden" id="district_region_id" value="">
                                                   <input type="text" class="form-control" id="district_region_name" value="" placeholder="行政区">
                                                   <span class="glyphicon glyphicon-chevron-down edit_select_icon"></span>
                                                   <ul class="edit-select_ul">
                                                       
                                                   </ul>
                                               </div>
                                           <div class="edit_select subway_select_groups area_groups">
                                               <input type="hidden" name="regionId" id="area_region_id" value="">
                                               <input type="text" class="form-control" id="area_region_name" value="" placeholder="地区">
                                           
                                               <span class="glyphicon glyphicon-chevron-down edit_select_icon"></span>
                                               <ul class="edit-select_ul">
                                                   
                                               </ul>
                                           </div>
                                           <input type="submit" class="btn btn-info add_station" value="添加站点">
                                        </div>
                                </div>
                                <!--  <div class="form-group subway_sub">
                                    <div class="col-xs-offset-2 col-xs-2">
                                        <input type="submit" class="edit_submit" value="保存">
                                    </div>
                                </div>  -->
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
<script src="/bootstrap/js/admin_subway_edit.js"></script>
</body>
</html>