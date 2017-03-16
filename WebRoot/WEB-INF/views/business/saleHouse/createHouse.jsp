<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增房屋</title>
</head>
<body>
<h1>新增房屋</h1>
<form action="/createHouseSubmit.action" method="post">
房屋类型：<label><input type="radio" name="house_type" value="1"/>民用</label>
<label><input type="radio" name="house_type" value="2"/>商用</label><br>
房屋大小：<input type="text" name="size"/>m<sup>2</sup><br>
户型：<select name="layout_room">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
</select>室 <select name="layout_hall">
	<option>1</option>
	<option>2</option>
	<option>3</option>
</select>厅<br>
地址：<input type="text" name="address"/><br>
产权：<input type="number" name="right"/>年<br>
房屋描述：<textarea rows="6" name="description"></textarea><br>

<input type="submit" value="提交"/>
</form>
</body>
</html>