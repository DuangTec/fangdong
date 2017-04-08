<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="com.fangdong.auth.model.FdUser"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit" /><!--国产浏览器高速渲染360-->
    <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" /><!--改变title图标：h5-->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!--禁止百度转码-->
    <title>用户充值-杜昂科技</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/duang.css" rel="stylesheet">
    <link href="bootstrap/css/login_regist.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.html">Duang房咚网</a>
        <ul class="city-log-reg">
           <li class="log-reg">
                <a href="/userinfo.do"><shiro:principal property="username" /></a>&nbsp;欢迎您
            <span>|</span>
            </li>
				<li class="log-reg"><a href="/logout.action">退出登录</a></li>
        </ul>
    </div>
</div>
<div class="login_regist container recharge_box">
    <div class="login_regist_box recharge">
        <h1>用户充值</h1>
        <form action="/rechargeSubmit.do?id=${user.id}" method="post" autocomplete="off">
            <ul>
                <li>
                    <span class="title">账户：</span>
                    <span class="money_user">
                        ${user.username}
                    </span>
                    <span class="money_able">
                        ( 可用余额 <span class="money_able_num"> ${user.balance} </span>元 )
                    </span>
                </li>
                <li>
                    <span class="title">请选择支付方式：</span>
                    <div class="recharge_bank">
                        <span class="bank_radio">
                            <input type="radio" name="bank" value="icbc1" class="1"/>
                            <img src="bootstrap/images/icbc.png">
                        </span>
                        <span class="bank_radio">
                            <input type="radio" name="bank" value="icbc2"/>
                            <img src="bootstrap/images/icbc.png">
                        </span>
                    </div>
                    <button type="button" class="btn btn-info btn-sm more_bank" data-toggle="modal" data-target="#myModal">
                        更多银行
                    </button>
                </li>
                <li class="recharge_money">
                    <span class="title">充值金额：</span>
                    <input type="text" name="money" id="money" value=""
                           placeholder="" class="form-control money"/>
                    <span class="yuan">元</span>
                </li>
                <li>
                    <span class="title"></span>
                    <input type="submit" value="确认充值" name="recharge"/>
                </li>
            </ul>
            <div class="modal fade more_bank_radio" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">更多银行选择</h4>
                        </div>
                        <div class="modal-body">
                            <span class="bank_radio">
                                <input type="radio" name="bank" value="icbc1"/>
                                <img src="bootstrap/images/icbc.png">
                            </span>
                            <span class="bank_radio">
                                <input type="radio" name="bank" value="icbc2"/>
                                <img src="bootstrap/images/icbc.png">
                            </span>
                            <span class="bank_radio">
                                <input type="radio" name="bank" value="icbc3"/>
                                <img src="bootstrap/images/icbc.png">
                            </span>
                            <span class="bank_radio">
                                <input type="radio" name="bank" value="icbc4"/>
                                <img src="bootstrap/images/icbc.png">
                            </span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-info save_bank" data-dismiss="modal">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
<script src="bootstrap/js/jquery.validate-1.13.1.js"></script>
<script src="bootstrap/js/login_regist.js"></script>
<script src="bootstrap/js/recharge.js"></script>
</body>
</html>