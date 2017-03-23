<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fangdong.business.model.HouseVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>房屋管理-杜昂科技房咚网</title>
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
                <a href="/logout.action">退出登录</a>
            </li>
        </ul>
    </div>
</div>
<div class="manage_box house_manage">
    <div class="container">
        <div class="row">      
            <div class="col-xs-2 manege_nav_box">
                <ul class="manege_nav">
                    <li class="active"><a href="/house_manage.do">房屋管理</a></li>
                    <li><a href="area_manage.do">地区管理</a></li>
                    <li><a href="user_manage.do">用户管理</a></li>
                </ul>
            </div>
            <div class="col-xs-10  manage_table">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>创建日期</th>
                            <th>房屋标题</th>
                            <th>房屋大小</th>
                            <th>房屋详情</th>
                            <th>房屋地址</th>
                            <th>产权年限</th>
                            <th>租金          </th>
                            <th>地区          </th>
                            <th>房屋规格</th>
                            <th>租赁类型(1住房/2商铺)</th>
                            <th>设施          </th>
                            <th class="col-lg-1 col-xs-2">相关操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${houseList}" var="house">   
                    <tr>
                        <td><fmt:formatDate value='${house.createDate }' pattern='yyyy-MM-dd '/></td>
                        <td>${house.title} </td>
                        <td>${house.size}</td>
                        <td>${house.houseDetail}</td>
                        <td>${house.address}</td>
                        <td>${house.propertyRights}</td>
                        <td>${house.rentPrice}</td>
                        <td>${house.area}</td>
                        <td>${house.hall}室${house.room}厅</td>
                        <td align="center">${house.houseType}</td>
                        <td>${house.facilities}</td>
                        <td>
                            <span class="glyphicon glyphicon-pencil house_news_edit"onclick="editHouse(${house.id})"></span>
                            <span class="glyphicon glyphicon-trash house_news_del" onclick="delHouse(${house.id})"></span>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="add_news">
                    <input type="button" value="添加记录" name="add_news" class="add_news_but" onclick="createHouse()">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="../index.html">首页</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>                   
                        <li><a href="#">尾页</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
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