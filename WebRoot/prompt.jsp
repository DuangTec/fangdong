<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
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
    <title>租前须知-杜昂科技</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/duang.css" rel="stylesheet">
    <link href="bootstrap/css/prompt.css" rel="stylesheet">
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
            <li class="active"><a href="/prompt.jsp">租前须知</a></li>
            <li class="normal"><a href="/house/createHouse.do">房东加盟</a></li>
            <li class="normal"><a href="/about_duang.jsp">关于杜昂</a></li>
        </ul>
    </div>
</div>
<div class="center">
    <div class="container">
        <div class="prompt_box">
            <div class="container">
                <div class="row">
                    <div class="col-xs-3">
                        <div class="prompt_nav_box">
                            <a href="#top1">
                                看房预约指南<span class="glyphicon glyphicon-menu-right panel_title_open"></span>
                            </a>
                        </div>
                        <div class="prompt_nav_box">
                            <a class="prompt_box_nav_h1" href="#top2">
                                找房注意事项<span class="glyphicon glyphicon-menu-right panel_title_open"></span>
                            </a>
                        </div>
                        <div class="prompt_nav_box">
                            <a class="prompt_box_nav_h1" href="#top3">
                                杜昂承诺<span class="glyphicon glyphicon-menu-right panel_title_open"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-9 col-xs-offset-3">
                <div class="page">
                    <h1><a id="top1"></a><span class="glyphicon glyphicon-send"></span>看房预约指南</h1>
                    <div class="page_content">
                        <p>如何快速的在官网搜索到目标房源（首先进入官网www.uoko.com的首页）</p>
                        <p class="text_bold">1.模糊查询页面</p>
                        <p>通过查找地址，可以迅速推送客户关于这个地址的所有房屋</p>
                        <p><img src="bootstrap/images/prompt_page1.png"></p>
                        <p class="text_bold">2.条件找房</p>
                        <p>进入“我要租房”板块，选择区域、租金、户型等标签信息，缩小找房范围寻找房源</p>
                        <p><img src="bootstrap/images/prompt_page2.png"></p>
                        <p class="text_bold">3.查看房源</p>
                        <p>按区域、租金等条件查找后即可看到对应的房源</p>
                        <p><img src="bootstrap/images/prompt_page3.png"></p>
                        <p>点击即可进入查看房屋具体信息</p>
                        <p><img src="bootstrap/images/prompt_page4.png"></p>
                        <p><img src="bootstrap/images/prompt_page5.png"></p>
                        <p><img src="bootstrap/images/prompt_page6.png"></p>
                        <p class="text_bold">4.预约看房</p>
                        <p>方式一：直接拨打1100优客官网预约电话</p>
                        <p>方式二：点击“我要看房”，输入对应信息即可</p>
                        <p>方式三：点击“QQ咨询”，可以直接加QQ咨询客服小伙伴</p>
                    </div>

                    <h1><a id="top2"></a><span class="glyphicon glyphicon-send"></span>找房注意事项</h1>
                    <div class="page_content">
                        <p class="text_bold">1.如何节省找房时间</p>
                        <p>不同的优客逸家管家会负责不同的区域，所以在预约时请告知清楚需求，让管家帮忙推荐可以最大限度节省宝贵的时间</p>
                        <p class="text_bold">2.看房前考虑清楚对交通、户型、周边配套等要素的需求度，提高找房精准度</p>
                        <p class="text_bold">3.交付钥匙</p>
                        <p>在合同规定的房屋交付日交验时您需注意：</p>
                        <p>（1）房屋是否与合同约定的一致；</p>
                        <p>（2）家电、家具等是否与合同相符；</p>
                        <p>（3）钥匙是否已交付；
                        <p>（4）水电气表读书等（物业交割时未满会帮您计算清楚）</p>
                    </div>

                    <h1><a id="top3"></a><span class="glyphicon glyphicon-send"></span>杜昂承诺</h1>
                    <div class="page_content">
                        <p class="text_bold">1. 100%真实房源信息</p>
                        <p class="text_bold">2. 租住中房屋质量问题维修无责任换房    </p>
                        <p>1）房屋质量问题承诺的范围</p>
                        <p>卫生间防水问题导致不能正常使用，严重影响你的租住生活</p>
                        <p> 房屋墙面返潮发霉需维修，严重影响你的租住生活 </p>
                        <p>房屋内外墙渗水需维修，严重影响你的租住生活</p>
                        <p>室内空气质量问题，严重影响你的租住生活</p>
                        <p>2)当我认为存在以上房屋质量问题后，该如何操作呢？后面需要我配合做什么？</p>
                        <p class="text_indent">a：通过微信联系优客微信服务号（uokoHome），或致电400，向客服人员提出遇到房屋质量问题，提出维修；</p>
                        <p class="text_indent">b：客服中心将会派维修单，维修师傅上门检查是否可以通过维修来解决问题，并给出维修方案；</p>
                        <p class="text_indent">c：如果您对维修方案表示接受，我们会根据维修方案尽快帮助您解决问题。</p>
                        <p class="text_bold">3 保洁自保洁日起48小时内可无条件返工</p>
                        <p>如果超过日期无法安排，此问题需要查询相关信息后方可回答您，建议准备好签约手机号、房屋地址等、房屋编号信息，致电4000004170描述您想反馈的问题。</p>
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
<script src="bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/duang.js"></script>
</body>
</html>