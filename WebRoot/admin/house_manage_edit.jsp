<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.fangdong.business.model.HouseVo" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <!DOCTYPE html>
                    <html>

                    <head lang="en">
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <meta name="renderer" content="webkit" />
                        <!--国产浏览器高速渲染360-->
                        <link rel="icon" type="image/png" href="bootstrap/i/Duang.jpg" />
                        <!--改变title图标：h5-->
                        <meta http-equiv="Cache-Control" content="no-siteapp" />
                        <!--禁止百度转码-->
                        <c:choose>
                            <c:when test="${type == 'create' }">
                                <title>新建房屋-杜昂科技房咚网</title>
                            </c:when>
                            <c:otherwise>
                                <title>房屋编辑-杜昂科技房咚网</title>
                            </c:otherwise>
                        </c:choose>
                        <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
                        <link href="/bootstrap/css/duang.css" rel="stylesheet">
                        <link href="/bootstrap/css/admin_edit_common.css" rel="stylesheet">
                    </head>

                    <body>
                        <div class="navbar navbar-fixed-top">
                            <div class="container">
                                <a class="navbar-brand" href="index.html">Duang房咚网</a>
                                <ul class="city-log-reg esc_login">
                                    <li class="log-reg">
                                        <a href="logOut.do">退出登录</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="edit_page_box">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <ol class="breadcrumb">
                                            <li><a href="admin.do">后台管理</a></li>
                                            <li><a href="house_manage.do">房屋管理</a></li>
                                            <c:choose>
                                                <c:when test="${type=='create'}">
                                                    <li class="active">创建房屋</li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="active">房屋编辑</li>
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
                                                        <form class="form-horizontal" action="/admin/editHouseSubmit.action?type=create" method="post">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form class="form-horizontal" action="/admin/editHouseSubmit.action" method="post">
                                                        <input type="hidden" name="id" value="${house.id}"/>
                                                            <div class="form-group">
                                                                <label for="input1" class="col-xs-2 control-label">创建时间</label>
                                                                <div class="col-xs-10">
                                                                    <input type="hidden" value="${house.createDate}" name="createDate" />
                                                                    <p class="form_control_p">
                                                                        <fmt:formatDate value='${house.createDate}' pattern='yyyy-MM-dd' />
                                                                    </p>
                                                                </div>
                                                            </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="form-group">
                                                    <label for="input2" class="col-xs-2 control-label">房东用户名</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="owner" name="owner" value='${house.owner}'>
                                                        <input type="hidden" name="ownerId" value="${house.ownerId}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input2" class="col-xs-2 control-label">房屋标题</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="input2" name="title" value='${house.title}'>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input3" class="col-xs-2 control-label">房屋大小</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="input3" name="size" value='${house.size}'>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input4" class="col-xs-2 control-label">房屋详情</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="input4" name="houseDetail" value='${house.houseDetail}'>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input4" class="col-xs-2 control-label">房屋地址</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="input5" name="address" value='${house.address}'>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input4" class="col-xs-2 control-label">产权年限</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="input6" name="propertyRights" value='${house.propertyRights}'>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input4" class="col-xs-2 control-label">租金</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control" id="input7" name="rentPrice" value='${house.rentPrice}'>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input3" class="col-xs-2 control-label">地区</label>
                                                    <div class="col-xs-10 edit_select">
                                                        <input type="text" class="form-control" id="regionName" value="${house.area}" readonly>
                                                        <input type="hidden" id="regionId" name="regionId" value="${house.regionId}" />
                                                        <span class="glyphicon glyphicon-chevron-down edit_select_icon"></span>
                                                        <ul class="edit-select_ul">
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input4" class="col-xs-2 control-label">房屋规格</label>
                                                    <div class="col-xs-10">
                                                        <input type="text" class="form-control housetype" id="input9" name="room" value='${house.room}'>室
                                                        <input type="text" class="form-control housetype" id="input10" name="hall" value='${house.hall}'>厅
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label">租赁类型</label>
                                                    <div class="col-xs-10">
                                                        <label class="checkbox-inline"><input type="radio" name="housetype" value="1" <c:if test="${house.houseType ==1 }">checked</c:if>>住房</label>
                                                        <label class="checkbox-inline"><input type="radio" name="housetype" value="2" <c:if test="${house.houseType ==2 }">checked</c:if>>商铺</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input4" class="col-xs-2 control-label">设施</label>
                                                    <div class="col-xs-10">
                                                        <label class="checkbox-inline"><input type="checkbox" value="床" name="facility" <c:if test="${fn:contains(house.facilities,'床')}">checked</c:if>>床</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="沙发" name="facility" <c:if test="${fn:contains(house.facilities,'沙发')}">checked</c:if>>沙发</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="桌子" name="facility" <c:if test="${fn:contains(house.facilities,'桌子')}">checked</c:if>>桌子</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="衣柜" name="facility" <c:if test="${fn:contains(house.facilities,'衣柜')}">checked</c:if>>衣柜</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="空调" name="facility" <c:if test="${fn:contains(house.facilities,'空调')}">checked</c:if>>空调</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="电视" name="facility" <c:if test="${fn:contains(house.facilities,'电视')}">checked</c:if>>电视</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="洗衣机" name="facility" <c:if test="${fn:contains(house.facilities,'洗衣机')}">checked</c:if>>洗衣机</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="热水器" name="facility" <c:if test="${fn:contains(house.facilities,'热水器床')}">checked</c:if>>热水器</label>
                                                        <label class="checkbox-inline"><input type="checkbox" value="水、电、气" name="facility" <c:if test="${fn:contains(house.facilities,'水、电、气')}">checked</c:if>>水、电、气</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-xs-offset-2 col-xs-2">
                                                        <input type="submit" class="edit_submit" value="保存">
                                                    </div>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer">
                            <div class="container">
                                <p>
                                    Copyright&copy;20170224<span></span>杜昂科技<br/> 重庆师范大学
                                    <span></span>安博教育集团<span></span>信息与计算科学(软件服务外包)
                                </p>
                                <a class="go-top">TOP</a>
                            </div>
                        </div>
                        <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
                        <script src="/bootstrap/js/jquery-1.12.1.min.js"></script>
                        <script src="/bootstrap/js/bootstrap.js"></script>
                        <script src="/bootstrap/js/jquery.validate-1.13.1.js"></script>
                        <script src="/bootstrap/js/admin_common.js"></script>
                        <script src="/bootstrap/js/admin_house_edit.js"></script>
                    </body>

                    </html>