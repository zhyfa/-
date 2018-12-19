<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript"src="<%=basePath%>/assets/x-admin/js/jquery.md5.js"></script>
</head>


<body>
<img src="<%=basePath%>/image/doctor.png" alt="通用的占位符缩略图">
<form action="#" id="addminform">
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
      <td><input class="form-control" placeholder="请输入姓名" type="text" name="admin_name" id="adminname" onblur="checkname()">
      <span id="checkname" > </span></td>
      
    </tr>
    <tr>
      <td>职位</td>
      <td><select name="role_id" >
      <c:forEach items="${requestScope.rolelist}" var="role" varStatus="sta">
		<option value="${role.roleId}">${role.roleName}</option></c:forEach></select></td>
    </tr>
    <tr>
      <td>密码</td>
      <td><input class="form-control" placeholder="请输入密码" type="password" name="admin_pwd" id="adminpwd"></td>
    </tr>
     <tr>
      <td>状态</td>
      <td>
	     <select name="admin_state" class="form-control" id="stateid" >
					<option value=0>"未选择查询的状态"</option>
					<option value=1>"正常使用的用户"</option>
					<option value=2>"已禁用的用户"</option></select></td>
    </tr>
     <tr>
     <td><input class="btn btn-primary" data-toggle="button" type="button" value="确认"  onclick="addadmin()"></td>
    </tr>
  </tbody>
</table>
</form>
</body>
<script type="text/javascript">
function checkname(){
	var adminname = $("#adminname").val();
	if(adminname==""|adminname==null){
		return;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/admin/checkname.action",
		dataType : "JSON",
		data : {'adminname':adminname},
		success : function(data) {
			if(data=='1'){
				$("#checkname").text("√");
			}else(data=='2'){
				$("#checkname").text("×");
			}
			
		}
	});
	
}


function addadmin(){
	var adminname =$("#adminname").val;
	var pwd = $("#adminpwd").val();
	var password = $.md5(pwd);
	$("#adminpwd").val(password);
	console.log(password);
	var stateid =$("#stateid").val;
	if(adminname==null|adminname==""){
		alert("请输入注册名称");
		return;
	}
	if(adminpwd==null|adminpwd==""){
		alert("请输入密码");
		return;
	}
	if(stateid==0){
		alert("请选择状态");
		return;
	}
	
	if(checkname=="×"){
		alert("请输入正确的姓名");
		return;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/admin/addadmin.action",
		dataType : "JSON",
		data : $("#addminform").serialize(),
		success : function(data) {
			if (data == '1') {
				alert("添加成功");
				//window.opener=null;
				//window.open('','_self');
				window.close();
				//window.opener.parent.location
				parent.window.location.href = "<%=basePath%>/admin/adminList.action?dqPage=1&pageTwo=1";
				}else{
					alert("添加失败");
					}
				}
	});
	
}
</script>
</html>