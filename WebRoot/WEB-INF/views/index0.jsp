<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fangdong.auth.model.FdUser"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
	<h1>Hello World!</h1>
	<%
		FdUser loginUser = (FdUser) session.getAttribute("verifiedUser");
		if (loginUser != null) {
	%>
	<span>${verifiedUser.username }&nbsp;欢迎您！&nbsp;</span>
	<a href="/logout">退出登录</a>
	<%
		} else {
	%>
	<a href="/login">登录</a>&nbsp;
	<a href="/signup">注册</a>
	<%
		}
	%>


</body>
</html>