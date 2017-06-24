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
<link href="css/index.css" rel="stylesheet" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
</head>

<body>
	<div class="container header">
		<div class="row">
			<div class="col-md-12">
				<div class="login-btn">
					<shiro:authenticated>
						<a><shiro:principal property="userName" /></a>&nbsp;欢迎您
                        <span>|</span>
						<a href="#">进入后台</a>
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
			<img src="img/title.png" />
		</div>
	</div>
	<div class="container">
		<div class="col-md-3 sidebar1">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="#">Overview <span
						class="sr-only">(current)</span></a></li>
				<li><a href="#">Reports</a></li>
				<li><a href="#">Analytics</a></li>
				<li><a href="#">Export</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Nav item</a></li>
				<li><a href="">Nav item again</a></li>
				<li><a href="">One more nav</a></li>
				<li><a href="">Another nav item</a></li>
				<li><a href="">More navigation</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Nav item again</a></li>
				<li><a href="">One more nav</a></li>
				<li><a href="">Another nav item</a></li>
			</ul>
		</div>
		<div class="col-md-7 sidebar2">
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/img1.jpg" alt="First slide">
					</div>
					<div class="item">
						<img src="img/img2.jpg" alt="Second slide">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="carousel-control left" href="#myCarousel"
					data-slide="prev">&lsaquo; </a> <a class="carousel-control right"
					href="#myCarousel" data-slide="next">&rsaquo; </a>
			</div>
		</div>
		<div class="col-md-2 hotBook">
			<ul>
				<li>aaaa</li>
				<li>aaaa</li>
			</ul>
		</div>
</body>

</html>