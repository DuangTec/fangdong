<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房屋页面</title>
</head>
<body>
	<h2>房屋列表</h2>
	<table>
		<tr>
			<th>户主</th>
			<th>地址</th>
			<th>户型</th>
		</tr>
	<c:forEach var="house" items="${houseList }">
		<tr>
		<td> ${house.owner } </td>
			<td>${house.address }</td>
			<td>${house.room }室${house.hall }厅</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>