<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/hotBook.js"></script>
<style type="text/css">
	.bookPic{
	width:100%;
	}
</style>
</head>

<body>
	<div class="container header">
		<div class="row">
			<div class="col-md-12">
				<div class="login-btn">
					<shiro:authenticated>
						<a><shiro:principal property="userName" /></a>&nbsp;欢迎您
                        <span>|</span>
						<a href="/admin/index.jsp">进入后台</a>
						<span>|</span>
						<a href="/logout.action">注销</a>
					</shiro:authenticated>
					<shiro:guest>
						<a href="login.html">管理员登录</a>
					</shiro:guest>
				</div>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<a href="/"> <img src="img/title.png" />
			</a>
		</div>
	</div>
	<div class="container">
<!-- 		<div class="col-md-3">
			<div class="list-group">
				<a href="#" class="list-group-item">全部</a>
				<a href="#" class="list-group-item">图书</a>
				<a href="#" class="list-group-item">期刊杂志</a>
				<a href="#" class="list-group-item">学术论文</a>
				<a href="#" class="list-group-item">文献</a>
			</div>
		</div> -->
		<!-- <div class="col-md-7 sidebar2">
			<div id="myCarousel" class="carousel slide">
				轮播（Carousel）指标
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
				</ol>
				轮播（Carousel）项目
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/img1.jpg" alt="First slide">
					</div>
					<div class="item">
						<img src="img/img2.jpg" alt="Second slide">
					</div>
				</div>
				轮播（Carousel）导航
				<a class="carousel-control left" href="#myCarousel"
					data-slide="prev">&lsaquo; </a> <a class="carousel-control right"
					href="#myCarousel" data-slide="next">&rsaquo; </a>
			</div>
		</div> -->
		<div class="col-md-10">
			
			<div class="row">
				<div class="col-md-4">
				<c:choose>
				<c:when test="${!empty book.pictureUrl }">
				<img src="${book.pictureUrl }" class="img-thumbnail bookPic">
				</c:when>
				<c:otherwise>
				<img src="img/unknow.jpg" class="img-thumbnail bookPic">
				</c:otherwise>
				</c:choose>
				</div>
				<div class="col-md-8">
					<h1>${book.title }</h1>
					<h4><small>${book.description }</small></h4>
					<table class="table">
					<tr><td>作者：${book.author }</td></tr>
					<tr><td>语言：${book.language }</td></tr>
					<tr><td>出版时间：<fmt:formatDate value="${book.publishTime }" pattern="yyyy年MM月"/> </td></tr>
					<tr><td>关键字：${book.keyword }</td></tr>
					<tr><td>书籍类型：${book.bookType }</td></tr>
					<tr><td>馆藏书籍：${book.borrowTimes }</td></tr>
					</table>
				</div>
			</div>
		</div>

		<div class="col-md-2 hotBook">
		<h3>热门借阅</h3>
			<ol>
				<li>aaaa</li>
				<li>aaaa</li>
			</ol>
		</div>
	</div>

</body>

</html>