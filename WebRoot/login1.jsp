<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="org.apache.shiro.subject.Subject"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<h2>用户登录</h2><br>
<form action="/userLogin.action" method="post">
<input type="hidden" name="next" value="${next}">
	用户名：<input type="text" name="username"/><br>
	密码：<input type="password" name="password"/><br>
	<input type="submit" value="提交"/> <a href="/signup.jsp">注册</a>
</form>
	
</body>
</html>