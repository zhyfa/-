<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>智慧药房管理</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/>

<link rel="shortcut icon"
	href="<%=basePath%>/assets/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="<%=basePath%>/assets/css/font.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/css/xadmin.css">
<script type="text/javascript"
	src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script
	src="<%=basePath%>/assets/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<body>
<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
        <table style="text-align:left;"><tr><th>用户名：</th><td>${sessionScope.admin.admin_name}</td></tr>
        <tr ><th>账户状态：</th><td>使用中</td></tr>
        <tr><th>创建时间：</th><td>${sessionScope.admin.admin_cdate}</td></tr>
        </table></div>
</body>
</html>