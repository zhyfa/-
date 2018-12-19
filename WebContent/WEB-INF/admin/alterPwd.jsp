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
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<title>修改密码</title>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/x-admin/js/jquery.md5.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/messages_zh.min.js"></script>
</head>
<style>

 table { width: 500px;  padding:15px; font-size: 14px; } 
 th{width:150px; text-align:right; font-family:"微软雅黑"} 
 td{text-align:left; }
 input{width:300px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;}
 caption{padding-left:15%}
 button{background-color:#339999; width:160px; height:35px; margin-left:15%}
 span{color:red}
 #TableNew{margin-top:-38px;margin-left:15px}
</style>
<body>
	 <form id="alterPwdForm" action="<%=basePath%>/admin/alterPwd.action" method="post" onsubmit="return checkForm()"> 
			<table cellspacing="12px" >
				<caption ><h2>修改密码</h2></caption>
			<tbody>
			<tr>
				<th>原密码：</th>
				<td><input type="password" name="pwdOld" id="pwdOld" placeholder="请输入原密码"
				onblur="checkPwd()"><br> 
				<input type="hidden"name="mPwdOld" id="mPwdOld"><span id="checkPwd" ></span></td>
			</tr>
			
			<tr>
				<th>新密码：</th>
				<td>
				<input type="password" name="pwdNew" id="pwdNew" placeholder="请输入密码"
					onblur="mdPwdNew()"> 
				<input type="hidden" name="admin_pwd" id="admin_pwd"></td>
			</tr>
			<tr>
				<th>确认新密码：</th>
				<td>
				<input type="password" name="pwd2" id="pwd2" placeholder="请再次输入新密码" >
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
				<input type="submit" id="alter" name="alter" value="确认提交" 
				style="background-color:#339999; width:160px; height:35px; margin-left:15%"
				> 
				
				<td>
			</tr>
			</tbody>
		</table>
	</form>
	
</body>
<script type="text/javascript">
	function mdPwdNew(){
		var pwdNew = $("#pwdNew").val();
		var md5pwdNew = $.md5(pwdNew);
		$("#admin_pwd").val(md5pwdNew);
	}
	function checkPwd() {
		var pwdOld =$("#pwdOld").val();
		var md5PwdOld=$.md5(pwdOld);
		$("#mPwdOld").val(md5PwdOld);
		$.ajax({
			type:"post",
			url:"<%=basePath%>/admin/checkPwd.action",
			//contentType : "application/json;charset=utf-8",
			dataType:"JSON",
			data:{"mPwdOld":md5PwdOld},
			success : function(data) {
				if (data == '1') {
					$("#checkPwd").text("√")
				}
				if (data == '2') {
					$("#checkPwd").text("×")
				}
				
			}
		});
	}
	$(document).ready(function () {
		$("#alterPwdForm").validate({
			errorPlacement: function(error, element) {
				if (element.is(":checkbox")||element.is(":radio")){
					error.appendTo(element.parent());
				}else {					
					error.insertAfter(element);
				}
			},

			rules:{
				pwdOld:{
					required:true,
					/* minlength:6 */
				},
				pwdNew:{
					required:true,
					/* minlength:6, */
					
				},
				pwd2:{
					required:true,
					equalTo:"#pwdNew"
				}
			},
			
		});
	});
	function checkForm(){
		var checkPwd = document.getElementById("checkPwd").innerText;
		console.log(checkPwd);
		if(checkPwd=="×"){
			alert("请输入正确的原密码，如忘记密码请联系管理员修改密码");
			return false;
		}
		
		
	}
</script>
</html>