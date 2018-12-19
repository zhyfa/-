<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
</head>
<style>
#updateParameterForm{
margin-top: 100px;
}
</style>
<body>
<form id="updateParameterForm"  class="form-horizontal" role="form">
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">参数id:</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.parameter.parameter_id }" name="parameter_id" id="parameter_id" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">参数名字:</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.parameter.parameter_name }" name="parameter_name" id="parameter_name">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">参数类型:</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.parameter.parameter_type }" name="parameter_type" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">参数值:</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.parameter.parameter_value }" name="parameter_value" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-default" onclick="updateParameter()">修改</button>
			<button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">返回</button>
		</div>
	</div>
</form>

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
				window.location.href="<%=basePath%>/parameter/parameterList.action"
			}
			if(data=="2"){
				alert("修改失败");
			}
		}
	});
}

</script>
</html>