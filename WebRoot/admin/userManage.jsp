<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>
	<h1>用户管理</h1><br>
	<h3>欢迎您，管理员 <b>${verifiedUser.username }</b></h3>
	<table>
		<tr><th>序号</th><th>用户名</th><th>密码</th><th>真实姓名</th><th>权限</th></tr>
		<c:forEach items="${userList}" var="user" varStatus="status">
		<tr>
		<td>${status.index +1}</td>
		<td>${user.username }</td>
		<td>${user.password }</td>
		<td>${user.name }</td>
		<td>${user.authority }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>