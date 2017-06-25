<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
table, th, td {
	border-collapse: collapse;
	border: 1px solid;
}
</style>
</head>

<body>
	<h1>欢迎来到图书馆后台管理系统</h1>
	<a href="/admin/index.jsp">返回后台主页</a>
	<br>
	<a href="/">返回首页</a>
	<h2>新增读者</h2>
	<form action="createUserSubmit.action" method="post">
		<table>
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th>真实姓名</th>
				<th>电话</th>
			</tr>
			<tr>
				<td><input type="text" name="username"></td>
				<td><input type="text" name="password"></td>
				<td><input type="text" name="realname"></td>
				<td><input type="text" name="phone"></td>
			</tr>
		</table>
		<input type="submit" value="提交">
	</form>
	<h2>${message }</h2>

</body>
</html>