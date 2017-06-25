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
    <a href="/">返回首页</a>
    <ul>
        <li>
            <a href="/admin/userManage.do">读者管理</a>
        </li>
        <li>
            <a href="/admin/bookInfoManage.do">图书信息管理</a>
        </li>
        <li>
        	<a href="/admin/adminPswChange.jsp">管理员密码修改</a>
        </li>
        
    </ul>
</body>
</html>