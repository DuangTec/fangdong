<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地区管理</title>
</head>
<body>
	<h1>地区管理</h1>
	<br>
	<h3>
		欢迎您，管理员 <b>${verifiedUser.username }</b>
	</h3>
	<table>
		<tr>
			<th>序号</th>
			<th>地区名</th>
			<th>父级地区</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${regionList}" var="region" varStatus="status">
			<tr>
				<td>${status.index +1}</td>
				<td>${region.regionName }</td>
				<td>${region.parentRegName }</td>
				<td><a href="/admin/deleteRegion.action?id=${region.id }">删除</a>
			</tr>
		</c:forEach>
	</table>
</body>
</html>