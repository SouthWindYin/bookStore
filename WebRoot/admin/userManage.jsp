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
table,th, td {
	border-collapse: collapse;
	border: 1px solid;
}
</style>
</head>

<body>
	<h1>欢迎来到图书馆后台管理系统</h1>
    <a href="/admin/index.jsp">返回后台主页</a><br>
	<a href="/">返回首页</a>
	<h2>读者管理</h2>
	<a href="/admin/createUser.jsp">新建</a>
	<table>
		<tr>
			<th>序号</th>
			<th>用户名</th>
			<th>密码</th>
			<th>真实姓名</th>
			<th>电话</th>
			<th>id</th>
			<th>操作</th>
		</tr>


		<c:forEach items="${readerList }" var="reader" varStatus="i">
			<tr>
				<td>${i.index+1 }</td>
				<td>${reader.userName }</td>
				<td>${reader.passWord }</td>
				<td>${reader.realname }</td>
				<td>${reader.phone }</td>
				<td>${reader.id }</td>
				<td><a href="/admin/delUser.action?id=${reader.id }">删除</a>&nbsp;<a
					href="/admin/editUser.do?id=${reader.id }">修改</a>&nbsp;
					<c:choose>
					<c:when test="${reader.authority==2 }">
					<a href="/admin/banUser.action?id=${reader.id }">禁用</a>
					</c:when>
					<c:when test="${reader.authority==3 }">
					<a href="/admin/launchUser.action?id=${reader.id }">启用</a>
					</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<h2>${message }</h2>
</body>
</html>