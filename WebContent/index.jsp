<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<title>登录</title>
<link href="${pageContext.request.contextPath}/assets/css/login.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/x-admin/js/jquery.md5.js"></script>
</head>
<body>
	<div class="login">
		<div class="message">智慧药房管理登录</div>
		<div id="darkbannerwrap"></div>
		<form id="loginForm">
			<input type="text" name="admin_name" id="admin_name"
				placeholder="用户名"><br>
			<hr class="hr15">
			<input type="password" name="pwd" id="pwd" placeholder="密码"
				onblur="mdjia()"><br> <input type="hidden"
				name="admin_pwd" id="admin_pwd">
			<hr class="hr15">
			<input type="text" name="code" id="code" placeholder="验证码">
			<hr class="hr15">
			<img alt="验证码图片" src="image/createImage.action" id="imgCode"
				onclick="changeImage()"> <a href="#" onclick="changeImage()">看不清</a><br>
			<input type="button" value="登录" onclick="login()">
			<hr class="hr20">
			帮助 <a onClick="alert('请联系管理员')">忘记密码</a>
		</form>
	</div>
</body>
<script type="text/javascript">
	function mdjia() {
		var pwd = $("#pwd").val();
		var password = $.md5(pwd);
		//alert(password);
		$("#admin_pwd").val(password);
		console.log(password);
	}
	function login() {
		var adminName = document.getElementById("admin_name").value.trim();
		var pwd = document.getElementById("pwd").value.trim();
		var code = document.getElementById("code").value.trim();
		if (adminName == "" || adminName == undefined) {
			window.alert("请输入用户名");
			return false;
		}
		if (pwd == "" || pwd == undefined) {
			window.alert("请输入密码");
			return false;
		}
		if (code == "" || code == undefined) {
			window.alert("请输入验证码");
			return false;
		}
		$.ajax({
					type : "post",
					url : "<%=basePath%>/admin/login.action",
					//contentType : "application/json;charset=utf-8",
					dataType : "JSON",
					data : $("#loginForm").serialize(),
					success : function(data) {
						if (data == '1') {
							window.location.href = "<%=basePath%>/main.jsp";
						}
						if (data == '2') {
							window.alert("验证码错误");
						}
						if (data == '3') {
							window.alert("用户名或密码错误");
						}
						if (data == '4') {
							alert("该用户已删除，请联系管理员");
						}
					}
				});
	}

	function changeImage() {
		var imgCode = document.getElementById("imgCode");
		imgCode.src = "<%=basePath%>/image/createImage.action?" + new Date();
	}
</script>
</html>