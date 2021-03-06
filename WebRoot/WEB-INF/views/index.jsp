<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fangdong.auth.model.FdUser"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>杜昂科技房咚网</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/index.css" rel="stylesheet">
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
            <%
		        FdUser loginUser = (FdUser) session.getAttribute("verifiedUser");
		        if (loginUser != null) {
	        %>
            <li class="log-reg"><a href="#">${verifiedUser.username }</a>&nbsp;欢迎您！&nbsp;</li>
            <%} else{%>
            <li class="log-reg">
                <a href="#">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="#">注册</a></li>
            <%}%>
        </ul>
        <ul class="nav">
            <li class="active"><a href="#">首页</a></li>
            <li class="normal"><a href="#">我要租房</a></li>
            <li class="normal"><a href="#">租前须知</a></li>
            <li class="normal"><a href="#">房东加盟</a></li>
            <li class="normal"><a href="#">关于杜昂</a></li>
        </ul>
    </div>
</div>
<div class="banner">
    <div id="carousel-example-generic" class="carousel slide container" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/img/banner2.png" alt="...">
            </div>
            <div class="item">
                <img src="/img/banner3.png" alt="...">
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<div class="search-box">
    <div class="container">
        <div class="row">
            <div class="col-xs-2"></div>
            <div class="col-xs-8">
                <form action="#" method="post" autocomplete="off">
                    <input type="text" name="index-search" value="" placeholder="请输入区域、商圈或小区名"
                            class="index-search form-control"/>
                    <img src="/img/index-search-img.png"/>
                    <button type="submit" name="index-search-sub" class="index-search-sub">
                        <img src="/img/index-search-sub.png">
                    </button>
                </form>
            </div>
            <div class="col-xs-2"></div>
        </div>
    </div>
</div>
<div class="hot-selected">
    <div class="container">
        <h2 class="text-center">今日精选房源</h2>
        <div class="row hot-selected-content">
            <div class="col-xs-4">
                <div class="thumbnail">
                    <a href="#" target="_blank">
                        <img src="/img/hot-selected1.png" alt="...">
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
                        <img src="/img/hot-selected2.png" alt="...">
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
                        <img src="/img/hot-selected3.png" alt="...">
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
                        <img src="/img/hot-selected1.png" alt="...">
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
                        <img src="/img/hot-selected2.png" alt="...">
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
                        <img src="/img/hot-selected3.png" alt="...">
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
                        <img src="/img/hot-selected1.png" alt="...">
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
                        <img src="/img/hot-selected2.png" alt="...">
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
                        <img src="/img/hot-selected3.png" alt="...">
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
</body>
</html>