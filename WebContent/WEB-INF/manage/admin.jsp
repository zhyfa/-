<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>成员详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/bootstrap/css/bootstrap.css">
 <link rel="shortcut icon" href="<%=basePath%>/assets/x-admin/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/assets/x-admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/x-admin/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>/assets/x-admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/assets/x-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/assets/x-admin/js/xadmin.js"></script>
</head>


<body>
<img src="<%=basePath%>/image/doctor.png" alt="通用的占位符缩略图">
		<table class="table table-hover">
  <caption>成员详情界面</caption>
  <thead>
    <tr>
      <th>标签</th>
      <th>详情</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>姓名</td>
      <td>${admin.ADMIN_NAME}</td>
    </tr>
    <tr>
      <td>职位</td>
      <td>${admin.ROLE_NAME}</td>
    </tr>
    <tr>
      <td>密码</td>
      <td>${admin.ADMIN_PWD}</td>
    </tr>
     <tr>
      <td>状态</td>
	    <c:if test="${admin.ADMIN_STATE==1}">
	    <td>正常使用中</td> </c:if>
	    <c:if test="${admin.ADMIN_STATE==2}">
	    <td>停用状态</td></c:if>
    </tr>
     <tr>
      <td>日期</td>
      <td>${admin.ADMIN_CDATE}</td>
    </tr>
  </tbody>
</table>

</body>
</html>