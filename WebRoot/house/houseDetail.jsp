<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.subject.Subject"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="/bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>房屋详情-杜昂科技房咚网</title>
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/duang.css" rel="stylesheet">
    <link href="/bootstrap/css/houseDetail.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.html">Duang房咚网</a>
        <ul class="city-log-reg">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成都<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">成都</a></li>
                    <li><a href="#">北京</a></li>
                </ul>
            </li>
            <li class="log-reg">
                <a href="login.html">登录</a>
                <span>|</span>
            </li>
            <li class="log-reg"><a href="regist.html">注册</a></li>
        </ul>
        <ul class="nav">
            <li class="normal"><a href="index.html">首页</a></li>
            <li class="active"><a href="#">我要租房</a></li>
            <li class="normal"><a href="#">租前须知</a></li>
            <li class="normal"><a href="#">房东加盟</a></li>
            <li class="normal"><a href="#">关于杜昂</a></li>
        </ul>
    </div>
</div>
<div class="house_path">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ol class="breadcrumb duang-breadcrumb">
                    <li><a href="index.html">首页</a></li>
                    <li><a href="#">我要租房</a></li>
                    <li><a href="#">比华利国际城二期</a></li>
                    <li class="active">
                        锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间
                    </li>
                </ol>
            </div>
        </div>
    </div>
</div>
<div class="house_preview">
    <div class="container">
        <div class="row">
            <div class="col-xs-5 house_img_preview">
                <div class="row magnifier">
                    <div class="col-xs-12 house_small_img_preview">
                        <img src="/bootstrap/images/hot-selected1.png"/>
                        <div class="move"></div>
                    </div>
                    <div class="house_big_img_preview">
                        <img src="/bootstrap/images/hot-selected1.png"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 scoll_img">
                        <span class="scroll_left"><</span>
                        <div class="scroll_outer">
                            <div class="list-inline list-unstyled scroll_inner">
                                <span><img src="/bootstrap/images/hot-selected1.png"></span><span>
                                <img src="/bootstrap/images/hot-selected2.png"></span><span>
                                <img src="/bootstrap/images/hot-selected3.png"></span><span>
                                <img src="/bootstrap/images/hot-selected1.png"></span><span>
                                <img src="/bootstrap/images/hot-selected2.png"></span><span>
                                <img src="/bootstrap/images/hot-selected3.png"></span><span>
                                <img src="/bootstrap/images/hot-selected2.png"></span><span>
                                <img src="/bootstrap/images/hot-selected3.png"></span>
                            </div>
                        </div>
                        <span class="scroll_right">></span>
                    </div>
                </div>
            </div>
            <div class="col-xs-7 house_news_preview">
                <h1>锦江区 川师 【首月半价】地铁2号线塔子山公园 东客站附近 非中介精装单间</h1>
                <ul class="house_news">
                    <li>
                        <span class="news_title">租金：</span>
                        <span class="news_text news_text_money">￥590.00-800.00</span>
                    </li>
                    <li>
                        <span class="news_title">户型：</span>
                        <span class="news_text">两室两厅</span>
                    </li>
                    <li>
                        <span class="news_title">地址：</span>
                        <span class="news_text">
                            <a href="">锦江区</a> -
                            <a href="">川师</a> -
                            <a href="">比华利国际城二期</a>
                        </span>
                    </li>
                    <li class="house_phone">
                        <span class="news_title">联系方式：</span>
                        <span class="news_text new_text_phone">13511111111</span>
                    </li>
                    <li>
                       <input type="button" value="我要看房" class="booking_house"/>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="house_details_box">
    <div class="container">
        <div class="row">
            <div class="house_details col-xs-12">
                <h2 class="house_details_title">房屋详情</h2>
                <div class="house_details_groups">
                        <h3>配套设施</h3>
                        <span class="house_equipment">床</span>
                        <span class="house_equipment">沙发</span>
                        <span class="house_equipment">桌子</span>
                        <span class="house_equipment">衣柜</span>
                        <span class="house_equipment">空调</span>
                        <span class="house_equipment">电视</span>
                        <span class="house_equipment">洗衣机</span>
                        <span class="house_equipment">热水器</span>
                        <span class="house_equipment house_equipment_no">水、电、气</span>
                    </div>
                <div class="house_details_groups">
                        <h3>房屋图片</h3>
                        <div class="house_details_img"></div>
                    </div>
            </div>
        </div>
    </div>
</div>
<div class="you_like_box">
    <div class="container">
        <div class="row">
            <div class="you_like col-xs-12">
                <h2 class="you_like_title">猜你喜欢</h2>
                <div class="you_like_groups">
                    <div class="col-xs-4 you_like_one">
                        <div class="thumbnail">
                            <a href="#" target="_blank" class="you_like_img">
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
                    <div class="col-xs-4 you_like_one">
                        <div class="thumbnail">
                            <a href="#" target="_blank" class="you_like_img">
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
                    <div class="col-xs-4 you_like_one">
                        <div class="thumbnail">
                            <a href="#" target="_blank" class="you_like_img">
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
                    <div class="col-xs-4 you_like_one">
                        <div class="thumbnail">
                            <a href="#" target="_blank" class="you_like_img">
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
                    <div class="col-xs-4 you_like_one">
                        <div class="thumbnail">
                            <a href="#" target="_blank" class="you_like_img">
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
<script src="/bootstrap/js/duang.js"></script>
<script src="/bootstrap/js/houseDetail.js"></script>
</body>
</html>