<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>房东加盟-房源发布</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/index.css" rel="stylesheet">
    <link href="/bootstrap/css/createHouse.css" rel="stylesheet"/>
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
                <a href="/login.do">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="/signUp.jsp">注册</a></li>
            </shiro:guest>
        </ul>
        <ul class="nav">
            <li class="normal"><a href="/index.do">首页</a></li>
            <li class="normal"><a href="/house.do">我要租房</a></li>
            <li class="normal"><a href="/prompt.jsp">租前须知</a></li>
            <li class="active"><a href="/house/createHouse.do">房东加盟</a></li>
            <li class="normal"><a href="/about_duang.jsp">关于杜昂</a></li>
        </ul>
    </div>
</div>

<!-- content -->
<div class="info-input">
    <div class="container">
        <div class="info-title">
            <h3>快速发布您的房源</h3>
            <h5>全网推广，免去中介，隐私保护，房源置顶——四项优质专享服务</h5>
        </div>

        <div class="con-input">
            <c:choose>
                <c:when test="${type == 'update'}">
                    <form action="/house/updateHouseSubmit.action" method="post" enctype="multipart/form-data" >
                </c:when>
                <c:otherwise>
                    <form action="/house/createHouseSubmit.action" method="post" enctype="multipart/form-data" >
                </c:otherwise>
            </c:choose>
                <div class="row">
                <div class="col-xs-2">
                </div>
                <div class="col-xs-8">
                    <h5> <span class="red">*&nbsp;&nbsp;</span>房源基本信息</h5>
                    <c:if test="${type=='update'}"><input type="hidden" value="${house.id}" name="houseId"></c:if>
                    <div class="input-row">
                        <span class="input-label">标题：</span>
                        <input type="text" name="title" class="form-control" value="${house.title}">
                        <div></div>
                    </div>
                    <div class="input-row">
                        <span class="input-label"> 租金：</span>
                        <input type="number" name="rentprice" class="form-control short" value="${house.rentPrice}">
                        <div></div>
                    </div>
                    <div class="input-row">
                        <span class="input-label"> 户型：</span>
                        <div class="row">
                            <div class="col-xs-4">
                                <span class="input-group-addon">室</span>
                                <input type="number" name="room" class="form-control" value="${house.room}" min="1" max="999" maxlength="3">
                                <div></div>
                            </div>
                            <div class="col-xs-4">
                                <span class="input-group-addon">厅</span>
                                <input type="number" name="hall" class="form-control" value="${house.hall}" min="1" max="999" maxlength="3">
                                <div></div>
                            </div>
                            <div class="col-xs-4">
                                <span class="input-group-addon">㎡</span>
                                <input type="number" name="size" class="form-control" value="${house.size}" min="1" max="5000" >
                                <div></div>
                            </div>
                        </div>

                    </div>
                    <div class="input-row">
                        <span class="input-label"> 小屋地址：</span>
                        <div class="row">
                            <div class="col-xs-3 edit_select" id="district">
                                <input type="text" class="form-control" id="districtName" value="${house.district}" readonly>
                                <input type="hidden" id="districtId" name="districtId" value="">
                                <span class="glyphicon glyphicon-chevron-down edit_select_icon"></span>
                                <ul class="edit-select_ul">
                                </ul>
                            </div>
                            <div class="col-xs-3 edit_select" id="area">
                                <input type="text" class="form-control" id="areaName" value="${house.area}" readonly>
                                <input type="hidden" id="areaId" name="areaId" value="${house.regionId}">
                                <span class="glyphicon glyphicon-chevron-down edit_select_icon"></span>
                                <ul class="edit-select_ul">
                                </ul>
                            </div>
                            <div class="col-xs-6">
                                <input type="text" name="address" value="${house.address}" class="form-control" placeholder="详细地址">
                            </div>
                        </div>
                    </div>
                    <div class="input-row">
                        <span class="input-label">详细信息：</span>
                        <textarea class="form-control" rows="3" name="houseDetail">${house.houseDetail}</textarea>
                        <div></div>
                    </div>

                    <h5> <span class="red">*&nbsp;&nbsp;</span>详细信息</h5>
                    <div class="input-row">
                        <span class="input-label i-down"> 配套设施：</span>
                        <div class="checkbox input-tag">
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="床" <c:if test="${fn:contains(house.facilities,'床')}">checked</c:if>>床</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="沙发" <c:if test="${fn:contains(house.facilities,'沙发')}">checked</c:if>>沙发</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="桌子" <c:if test="${fn:contains(house.facilities,'桌子')}">checked</c:if>>桌子</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="衣柜" <c:if test="${fn:contains(house.facilities,'衣柜')}">checked</c:if>>衣柜</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="空调" <c:if test="${fn:contains(house.facilities,'空调')}">checked</c:if>>空调</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="电视" <c:if test="${fn:contains(house.facilities,'电视')}">checked</c:if>>电视</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="洗衣机" <c:if test="${fn:contains(house.facilities,'洗衣机')}">checked</c:if>>洗衣机</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="热水器" <c:if test="${fn:contains(house.facilities,'热水器')}">checked</c:if>>热水器</label>
                            <label  class="checkbox-inline"><input type="checkbox" name="facility" value="水、电、气" <c:if test="${fn:contains(house.facilities,'水、电、气')}">checked</c:if>>水、电、气</label>
                        </div>
                    </div>
                    <div class="input-row create_house_img_preview">
                        <span class="input-label">小屋美图：</span>
                        <span class="img_preview"><c:forEach items="${picList}" var="pic"><img src="${pic.pictureUrl}"></c:forEach></span>
                        <a href="javascript:;" class="create_house_file">
                            <input type="file" id="edit-doc-ipt-file-5" class="create_house_input"
                                   accept="image/jpg,image/jpeg,image/gif,image/png" multiple="multiple" name="file">上传图片
                        </a>
                    </div>
                    <div class="up">
                        <input type="submit" value="上传房屋信息" class="upload"/>
                    </div>
                </div>
                <div class="col-xs-2"></div>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- footer -->
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
<script src="/bootstrap/js/index.js"></script>
<script src="/bootstrap/js/jquery.validate-1.13.1.js"></script>
<script src="/bootstrap/js/createHouse.js"></script>
</body>
</html>