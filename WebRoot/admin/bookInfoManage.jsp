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
	<h2>书籍管理</h2>
	<a href="/admin/createBookInfo.jsp">新建</a>
	<table>
		<tr>
			<th>序号</th>
			<th>题目</th>
			<th>类型</th>
			<th>作者</th>
			<th>关键词</th>
			<th>语言</th>
			<th>发行时间</th>
			<th>借阅次数</th>
			<th>id</th>
			<th>操作</th>
		</tr>


		<c:forEach items="${bookInfoList }" var="bookInfo" varStatus="i">
			<tr>
				<td>${i.index+1}</td>
				<td>${bookInfo.title }</td>
				<td>${bookInfo.bookType }</td>
				<td>${bookInfo.author }</td>
				<td>${bookInfo.keyword }</td>
				<td>${bookInfo.language }</td>
				<td>${bookInfo.publishTime }</td>
				<td>${bookInfo.borrowTimes }</td>
				<td>${bookInfo.id }</td>
				<td><a href="/admin/delBookInfo.action?id=${bookInfo.id }">删除</a>&nbsp;<a
					href="/admin/editBookInfo.do?id=${bookInfo.id }">修改</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>