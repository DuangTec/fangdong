<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="org.apache.shiro.subject.Subject"  %>
<%@ page import="com.fangdong.business.model.HouseVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>我要租房</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/house.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
   <div class="container">
        <a class="navbar-brand" href="#">Duang房咚网</a>
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
            <%
		        Subject currentUser=SecurityUtils.getSubject();
		        if (currentUser.isAuthenticated()) {
	        %>
	        <li class="log-reg">
                <a href="#"><%=currentUser.getPrincipal()%></a>&nbsp;欢迎您
            <span>|</span>
            </li>
            <li class="log-reg"><a href="/logout.action">注销</a></li>
            <%} else{%>
            <li class="log-reg">
                <a href="/login.jsp">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="/signUp.jsp">注册</a></li>
            <%}%>
        </ul>
        <ul class="nav">
            <li class="normal"><a href="/index.do">首页</a></li>
            <li class="active"><a href="/house.do">我要租房</a></li>
            <li class="normal"><a href="#">租前须知</a></li>
            <li class="normal"><a href="#">房东加盟</a></li>
            <li class="normal"><a href="#">关于杜昂</a></li>
        </ul>
    </div>
</div>

<!-- content -->
<div class="screen">
    <div class="container">
        <div class="s-left">
            <div class="new row">
                <h4 class="col-xs-12">条件找房</h4>
            </div>
            <div class="filter-row">
                <span class="filter-label"> 区域：</span>
                <div class="filter-tag">
                    <a href="#" class="active">全部</a>
                    <a href="#" class="">锦江区</a>
                    <a href="#" class="">青羊区</a>
                    <a href="#" class="">金牛区</a>
                    <a href="#" class="">武侯区</a>
                    <a href="#" class="">成华区</a>
                    <a href="#" class="">龙泉驿区</a>
                    <a href="#" class="">高新区</a>
                </div>
            </div>
            <div class="filter-row">
                <span class="filter-label"> 租金：</span>
                <div class="filter-tag">
                    <a href="#" class="active">全部</a>
                    <a href="#" class="">700以下</a>
                    <a href="#" class="">700-1000</a>
                    <a href="#" class="">1000-1500</a>
                    <a href="#" class="">1500-2000</a>
                    <a href="#" class="">2000以上</a>
                </div>
            </div>
            <div class="filter-row">
                <span class="filter-label"> 户型：</span>
                <div class="filter-tag">
                    <a href="#" class="active">全部</a>
                    <a href="#" class="">一室一厅</a>
                    <a href="#" class="">两室一厅</a>
                    <a href="#" class="">两室两厅</a>
                    <a href="#" class="">三室</a>
                    <a href="#" class="">跃层</a>
                </div>
            </div>
            <div class="filter-row">
                <span class="filter-label"> 入住：</span>
                <div class="filter-tag">
                    <a href="#" class="active">全部</a>
                    <a href="#" class="">拎包入住</a>
                    <a href="#" class="">一周内</a>
                    <a href="#" class="">两周内</a>
                </div>
            </div>

            <div class="new row">
                <h4 class="col-xs-12">Search</h4>
            </div>
            <div class="search-box">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-8">
                            <form action="#" method="post" autocomplete="off">
                                <input type="text" name="index-search" value="" placeholder="请输入区域、商圈或小区名"
                                       class="index-search form-control"/>
                                <img src="/bootstrap/images/index-search-img.png"/>
                                <button type="submit" name="index-search-sub" class="index-search-sub">
                                    <img src="/bootstrap/images/index-search-sub.png">
                                </button>
                            </form>
                        </div>
                        <div class="col-xs-4"></div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>
<!-- 全部房源 -->
<div class="hot-selected">
    <div class="container">
        <div class="new row">
            <h2 class="col-xs-12">全部房源</h2>
        </div>
        <div class="row hot-selected-content">
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected1.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期比华利国际城二期比华利国际城二期比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected2.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected3.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected1.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected2.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected3.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected1.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected2.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/bootstrap/images/hot-selected3.png" alt="...">
                    </a>
                    <div class="caption">
                        <h3>
                            <a href="#" title="【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间"
                               target="_blank">
                                锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                            </a>
                        </h3>
                        <div class="item-info clearfix">
                            <div class="item-loc pull-left">比华利国际城二期</div>
                            <div class="item-pri pull-right">￥590.00-800.00</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 分页 -->
<div class="pagenation text-center">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="#">首页</a></li>
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
<script src="/bootstrap/js/duang.js"></script>
<script src="/bootstrap/js/index.js"></script>
<script src="/bootstrap/js/house.js"></script>
</body>
</html>