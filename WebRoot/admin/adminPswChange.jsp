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
</head>

<body>
	<h1>欢迎来到图书馆后台管理系统</h1>
	<a href="/admin/index.jsp">返回后台主页</a>
	<br>
	<a href="/">返回首页</a>
	<form action="/admin/adminPswChangeSubmit.action" method="post">
		请输入旧密码：<input name="oldpsw" type="password"><br> 请输入新密码：<input
			name="newpsw" type="password"><br> <input type="submit"
			value="提交">
	</form>
	<h2>${message }</h2>
</body>
</html>