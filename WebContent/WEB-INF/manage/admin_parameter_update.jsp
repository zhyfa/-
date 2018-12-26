<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style>
.info{margin-top:20px}
.info input{width:200px;height:35px; border:0.5px solid #E6E6FA;
			border-radius: 3px 3px 3px 3px;margin-top:5px;}
.info .td{text-align:right;font-size:16px;padding-right:10px}
#btnSearch{width:70px;}
#addButton{width:90px;}
#page{font-size:16px}
caption{font-size:24px}
#con{margin-left:100px;}
</style>
<body>
<div id="con">
<form id="updateParameterForm"  >
		<table class="info">
			<tr>
				<td class="td">参数id:</td>
				<td><input type="text" value="${requestScope.parameter.parameter_id }" name="parameter_id" id="parameter_id" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="td">参数名字:</td>
				<td><input type="text" value="${requestScope.parameter.parameter_name }" name="parameter_name" id="parameter_name"></td>
			</tr>
			<tr>
				<td class="td">参数类型:</td>
				<td>
				<input type="text" value="${requestScope.parameter.parameter_type }" name="parameter_type" readonly="readonly">
			</td>
			</tr>
				<tr>
				<td class="td">参数值:</td>
				<td>
				<input type="text" value="${requestScope.parameter.parameter_value }" name="parameter_value" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="td"></td>
				<td colspan="2">
				<button type="button" class="layui-btn" onclick="updateParameter()"><i class="layui-icon ">&#xe642;</i>修改</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
function updateParameter(){
	var parameter_name = document.getElementById("parameter_name").value.trim();
	if(parameter_name=="" || parameter_name==undefined){
		alert("参数名不能为空");
		return false;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/parameter/updateParameter.action",
		//contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		data:$("#updateParameterForm").serialize(),
		success : function(data) {
			if(data=="1"){
				alert("修改成功");
				parent.window.location.href="<%=basePath%>/parameter/parameterList.action"
			}
			if(data=="2"){
				alert("修改失败");
			}
		}
	});
}

</script>
</html>