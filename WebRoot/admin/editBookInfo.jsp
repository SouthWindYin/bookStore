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
	<h2>修改图书信息</h2>
	<form action="/admin/editBookInfoSubmit.action" method="post" enctype="multipart/form-data">
		<table>
			<tr>
			<th>题目</th>
			<th>类型</th>
			<th>作者</th>
			<th>关键词</th>
			<th>语言</th>
			<th>发行时间</th>
			<th>描述</th>
			<th>id</th>
	<!-- 		<th>封面图片</th> -->
			
			</tr>
			<tr>
				<td><input type="text" name="title" value="${book.title }"></td>
				<td><input type="text" name="booktype" value="${book.bookType }"></td>
				<td><input type="text" name="author" value="${book.author }"></td>
				<td><input type="text" name="keyword" value="${book.keyword }"></td>
				<td><input type="text" name="language" value="${book.language }"></td>
				<td><input type="date" name="publishtime" value="${book.publishTime }"></td>
				<td><textarea name="description">${book.description }</textarea>
				<td><input type="hidden" value="${book.id }" name="id"></td>
				
				<!-- <td><input type="file" name="bookpic" accept="image/jpg,image/jpeg,image/gif,image/png" ></td> -->
			</tr>
		</table>
		<input type="submit" value="提交">
	</form>
	<h2>${message }</h2>

</body>
</html>