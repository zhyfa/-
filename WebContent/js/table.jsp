<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
</head>
<style>
.form-horizontal {
	position: absolute;
	width: 500px;
	height: 500px;
	left: 200px;
	top: 100px;
}
</style>
<body>
	<form class="form-horizontal" role="form"
		action="${pageContext.request.contextPath}/front1/userLoginAction!userLogin"
		method="post" onsubmit="return checkForm()">
		<h1>文档分享平台</h1>
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="user.userName"
					id="userName" placeholder="请输入用户名">
			</div>
		</div>
		<div class="form-group">
			<label for="lastname" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="user.pwd" id="pwd"
					placeholder="请输入密码">
			</div>
		</div>
		<div class="form-group">
			<label for="lastname" class="col-sm-2 control-label">验证码</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="code" id="code"
					placeholder="请输入验证码"> <br>
				<img alt="验证码图片"
					src="${pageContext.request.contextPath}/front1/createImage"
					id="imageCode" onclick="changeCode()"> <a href="#"
					onclick="changeCode()">点击刷新</a>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
					<label> <input type="checkbox">请记住我
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">登录</button>
				<button type="button" class="btn btn-default" onclick="back()">返回</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	function changeCode(){
		var imageCode = document.getElementById("imageCode");
		imageCode.src="${pageContext.request.contextPath}/front1/createImage?"+new Date();
	}
	function checkForm(){
		var userName = document.getElementById("userName").value.trim();
		var pwd = document.getElementById("pwd").value.trim();
		var code = document.getElementById("code").value.trim();
		if(userName=="" || userName==undefined){
			window.alert("请输入用户名");
			return false;
		}
		if(pwd=="" || pwd==undefined){
			window.alert("请输入密码");
			return false;
		}
		var reg =  /^[0-9a-zA-Z]*$/g;
		if(!reg.test(code)){
			window.alert("验证码输入非法！");
			return false;
		}
		if(code=="" || code==undefined){
			window.alert("请输入验证码");
			return false;
		}
	}
	function back(){
		window.location.href="${pageContext.request.contextPath}/front/login_before.jsp"
	}
</script>
</body>
</html>