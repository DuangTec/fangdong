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
    <title>地铁管理-杜昂科技</title>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../bootstrap/css/duang.css" rel="stylesheet">
    <link href="../bootstrap/css/admin_manage_common.css" rel="stylesheet">
    <link href="../bootstrap/css/house_manage.css" rel="stylesheet">
    <link href="../bootstrap/css/subway_manage.css" rel="stylesheet">
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
    <div class="manage_box subway_manage">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 manege_nav_box">
                    <ul class="manege_nav">
                        <li><a href="house_manage.do">房屋管理</a></li>
                        <li><a href="house_check.do">房屋审核</a></li>
                        <li><a href="area_manage.do">地区管理</a></li>
                        <li><a href="user_manage.do">用户管理</a></li>
                        <li class="active"><a href="subway.do">地铁管理</a></li>
                        <li><a href="hotRegion.do">热门地区管理</a></li>
                    </ul>
                </div>
                <div class="col-xs-10 manage_table">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <c:forEach items="${subwayList}" var="subway">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="glyphicon glyphicon-road"></span>${subway.subwayName}
                                    </a>
                                    <span class="glyphicon glyphicon-pencil subway_news_edit" onclick="editSubway(${subway.id})"></span>
                                    <span class="glyphicon glyphicon-trash subway_line_del" onclick="delSubway(${subway.id})"></span>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                	<c:forEach items="${subway.subwayRegion}" var="subwayStation">
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>${subwayStation}<br></div>
                                    <!-- <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>熊猫大道</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>动物园</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>昭觉寺南路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>驷马桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>李家沱</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>前锋路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>红星桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>市二医院</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>春熙路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>新南门</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>磨子桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>省体育馆</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>衣冠庙</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>熊猫大道</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>高升桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>红牌楼</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>太平园</div> -->
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
            <!--             <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="glyphicon glyphicon-road"></span>地铁线路2
                                    </a>
                                    <span class="glyphicon glyphicon-pencil subway_news_edit"></span>
                                    <span class="glyphicon glyphicon-trash subway_line_del"></span>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>军区总医院</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>熊猫大道</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>动物园</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>昭觉寺南路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>驷马桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>李家沱</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>前锋路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>红星桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>市二医院</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>春熙路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>新南门</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>磨子桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>省体育馆</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>衣冠庙</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>熊猫大道</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>高升桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>红牌楼</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>太平园</div>
                                </div>
                            </div>
                        </div> -->
                        <!-- <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="glyphicon glyphicon-road"></span>地铁线路3
                                    </a>
                                    <span class="glyphicon glyphicon-pencil subway_news_edit"></span>
                                    <span class="glyphicon glyphicon-trash subway_line_del"></span>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>军区总医院</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>熊猫大道</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>动物园</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>昭觉寺南路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>驷马桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>李家沱</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>前锋路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>红星桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>市二医院</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>春熙路</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>新南门</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>磨子桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>省体育馆</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>衣冠庙</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>熊猫大道</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>高升桥</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>红牌楼</div>
                                    <div class="subway_station"><span class="glyphicon glyphicon-map-marker"></span>太平园</div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                     <div class="add_news">
                        <input type="button" value="添加新线路" name="add_news" class="add_news_but" onclick="createSubway()">
                    </div> 
                </div>
            </div>
           <!--  <div class="row">
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
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">尾页</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div> -->
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