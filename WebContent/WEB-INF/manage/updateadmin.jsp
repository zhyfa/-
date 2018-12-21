<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>成员详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/assets/bootstrap/css/bootstrap.css">
<link rel="shortcut icon"
	href="<%=basePath%>/assets/x-admin/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>/assets/x-admin/css/font.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/xadmin.css">
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/xadmin.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/jquery.md5.js"></script>
	<script type="text/javascript">
	function aa(){
		console.log("111");
		var adminname = $("#adminname").val();
		var adminname1='${requestScope.admin.ADMIN_NAME}';
		if(adminname==""||adminname==null||adminname==adminname1){
		}else{
		$.ajax({
			type:"post",
			url:"<%=basePath%>/admin/checkname.action",
			//contentType : "application/json;charset=utf-8",
			dataType:"JSON",
			data:{"adminname":adminname},
			success : function(data) {
				if (data == '1') {
					$("#checkname").text("√")
				}
				if (data == '2') {
					$("#checkname").text("×")
				}
				
			}
		});
		
		}
	}
	
	</script>
</head>


<body>
	<img src="<%=basePath%>/image/doctor.png" alt="通用的占位符缩略图">
	<form action="#" id="updateminform">
		<input type="hidden" value="${admin.ADMIN_ID}" id="adminid"
			name="admin_id">
		<table class="table table-hover">
			<caption>添加成员界面</caption>
			<thead>
				<tr>
					<th>标签</th>
					<th>详情</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>姓名</td>
					<td><input class="form-control" value="${admin.ADMIN_NAME}"
						type="text" name="admin_name" id="adminname" onblur="aa()">
						<span id="checkname" > </span>
						</td>
	
				</tr>
				<tr>
					<td>职位</td>
					<td><select name="role_id">
							<c:forEach items="${requestScope.rolelist}" var="role"
								varStatus="sta">
								<option value="${role.roleId}"
									<c:if test="${admin.ROLE_ID==role.roleId}">selected='ture'</c:if>>${role.roleName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input class="form-control" value="${admin.ADMIN_PWD}"
						type="password" name="admin_pwd" id="adminpwd" readonly="readonly">
						<input class="btn btn-primary" type="button" value="重置密码"
						onclick="resetpwd()"></td>
				</tr>
				<tr>
					<td>状态</td>
					<td><select name="admin_state" class="form-control"
						id="stateid">
							<c:forEach items="${requestScope.parameterlist}" var="parameter"
								varStatus="sta">
								<option value="${parameter.PARAMETER_VALUE}"
									<c:if test="${admin.ADMIN_STATE==parameter.PARAMETER_VALUE}">selected='ture'</c:if>>${parameter.PARAMETER_NAME}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><input class="btn btn-primary" data-toggle="button"
						type="button" value="确认" onclick="updateadmin()"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script type="text/javascript">
function resetpwd(){
	$("#adminpwd").val(123456);
}

	

function updateadmin(){
	var adminid=$("#adminid").val();
	var adminname =$("#adminname").val();
	var checkname = document.getElementById("checkname").innerText;
	var pwd = $("#adminpwd").val();
	var password = $.md5(pwd);
	$("#adminpwd").val(password);
	
	console.log("adminname"+adminname);
	if(adminname==null|adminname==""){
		alert("请输入正确的名称");
		return;
	}
	console.log("checkname"+checkname);
	if(checkname=="×"){
		alert("该名称已存在");
		return;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/admin/updateadmin.action",
		dataType : "JSON",
		data : $("#updateminform").serialize(),
		success : function(data) {
			if (data == '1') {
				alert("更改成功");
				window.location.href = "<%=basePath%>/admin/updaadminbefore.action?adminid="+adminid;
							
			} else {
							alert("更改失败");
						}
					}
				});

	}
</script>
</html>