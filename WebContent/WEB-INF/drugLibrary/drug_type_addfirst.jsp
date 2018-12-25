<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">

<title>添加一级类别页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/>
<style>
ul li {
	list-style-type: none;
	margin: 8px 0;
}
a {
	text-decoration:none;
}
</style>
<script>

</script>
</head>

<body>
<div>

	
	一级类别名称：<input type="text" id="bigTypeName" name="bigTypeName">
	<span id="showMeg"></span>
	<br />
	<input type="button" onclick="add()" value="确定">
	<input type="button" value="返回" onclick="javascript:history.back(-1);">
</body>
<script>

//检查该一级类别名是否可用
$("#bigTypeName").blur(function checkBigTypeName(){
	$.ajax({
		url:"<%=basePath%>/drugType/checkBigTypeName.action",
		type: "POST",
		data:{"bigTypeName":$("#bigTypeName").val()},
		success : function(res){
			if(res=='0'){
				$("#showMeg").text("该名字可用");
			}else{
				$("#showMeg").text("该名字不可用");
			}
		}
	});
});
function add() {
	$.ajax({
			url:"<%=basePath%>/drugType/addFirstType.action",
			type: "POST",
			data:{"bigTypeName":$("#bigTypeName").val()},
			success : function(res){
				if(res=='0'){
					alert("添加一级类别名成功");
					//跳回药品种类列表页
					window.location.href="<%=basePath%>/drugType/toOtherJsp.action";
				}else{
					alert("添加失败");
				}
			}
		});
}
	
</script>
</html>
