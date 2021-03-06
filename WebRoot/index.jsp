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

<script src="js/hotBook.js"></script>
<script src="js/index.js"></script>
<style type="text/css">
	.book{
	text-align:center;
	}
	.bookPic{
	height:200px;
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
		<div class="col-md-3">
			<div class="list-group bookInfo">
				<a href="#" class="list-group-item active">全部</a>
				<a href="#" class="list-group-item">图书</a>
				<a href="#" class="list-group-item">期刊杂志</a>
				<a href="#" class="list-group-item">学术论文</a>
				<a href="#" class="list-group-item">文献</a>
			</div>
		</div>
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
		<div class="col-md-7">
		<div class="row bookInfoList">
		</div>
			<!-- <table class="table">
				<thead>
					<tr>
						<th>图书</th>
						<th>图书</th>
						<th>图书</th>
						<th>图书</th>
						<th>图书</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
					</tr>
					<tr>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
					</tr>
					<tr>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
						<td>java核心技术</td>
					</tr>
				</tbody>
			</table> -->
			<!-- 分页 -->
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
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