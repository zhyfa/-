<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
</head>
<style>
#parameterAddForm{
margin-top:50px;}

</style>
<body>
	<form id="parameterAddForm" class="form-horizontal" role="form">
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">参数名字：</label>
			<div class="col-sm-10">
				 <input type="text" name="parameter_name" id="parameter_name" placeholder="请输入参数名字">
			</div>
		</div>
		<div class="form-group">
			<label for="lastname" class="col-sm-2 control-label">参数类型：</label>
			<div class="col-sm-10">
				<input type="text" name="parameter_type" id="parameter_type" placeholder="请输入参数类型">
			</div>
		</div>
		<div class="form-group">
			<label for="lastname" class="col-sm-2 control-label">参数值：</label>
			<div class="col-sm-10">
				<input type="text" name="parameter_value" id="parameter_value" placeholder="请输入参数值">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" class="btn btn-default" onclick="submitForm()">新增参数</button>
				<button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">返回</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	function submitForm() {
		var parameter_name = document.getElementById("parameter_name").value.trim();
		if(parameter_name=="" || parameter_name==undefined){
			alert("请输入参数名字");
			return;
		}
		var parameter_type = document.getElementById("parameter_type").value.trim();
		if(parameter_type=="" || parameter_type==undefined){
			alert("请输入参数类型");
			return;
		}
		var parameter_value = document.getElementById("parameter_value").value.trim();
		var reg = /^[0-9]*$/;
		if (!reg.test(parameter_value ||parameter_value=="" || parameter_value==undefined)) {
			alert("参数值请输入数字");
			return;
		}
		$.ajax({
					type : "post",
					url : "<%=basePath%>/parameter/parameterAdd.action",
					//contentType : "application/json;charset=utf-8",
					dataType : "JSON",
					data : $("#parameterAddForm").serialize(),
					success : function(data) {
						if (data == "1") {
							alert("增加参数成功");
							window.location.href = "<%=basePath%>/parameter/parameterList.action"
						}
						if (data == "2") {
							alert("增加参数失败");
						}
						if (data == "3") {
							alert("该参数值已存在");
						}
					}
				});

	}
</script>
</html>