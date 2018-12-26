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
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<style>
.info{margin-top:20px}
.info input{width:200px;height:35px; border:0.5px solid #E6E6FA;
			border-radius: 3px 3px 3px 3px;margin-top:5px;}
.info .td{text-align:right;font-size:16px;padding-right:10px}
select{width:200px;height:35px; border:0.5px solid #E6E6FA;
			border-radius: 3px 3px 3px 3px;margin-top:5px;}
</style>
<script>

</script>
</head>

<body>
	<div id="con">
		<table class="info">
			<tr>
			<td class="td">一级类别名称：<input type="text" id="bigTypeName" name="bigTypeName">
			<span id="showMeg"></span>
			<button class="layui-btn" onclick="add()" value="确定"><i class="layui-icon ">&#xe605;</i>确定</button>
			<button class="layui-btn" onclick="javascript:history.back(-1);"><i class="layui-icon ">&#xe65c;</i>返回</button>
			</td>
			</tr>
		</table>
	</div>
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
					parent.window.location.href="<%=basePath%>/drugType/toJSP.action";
				}else{
					alert("添加失败");
				}
			}
		});
}
	
</script>
</html>
