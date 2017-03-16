<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<h1>后台管理</h1><br>
	<h3>欢迎您，管理员 <b>${verifiedUser.username }</b></h3>
	<p><a href="/admin/userManage">用户管理</a>&nbsp;<a href="/admin/regionManage">地区管理</a></p>
</body>
</html>