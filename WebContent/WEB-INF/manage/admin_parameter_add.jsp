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
.info input{width:200px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;margin-top:5px}
.info .td{text-align:left;font-size:16px}
#btnSearch{width:70px;}
#addButton{width:90px;}
#page{font-size:16px}
caption{font-size:24px}
#con{margin-left:100px}
</style>
<body>
<div id="con">
	<form id="parameterAddForm">
		<table class="info">
			<tr>
			<td calss="td">参数名字：</td>
			<td>
				 <input type="text" name="parameter_name" id="parameter_name" placeholder="请输入参数名字">
			</td>
		</tr>
		<tr>
			<td calss="td">参数类型：</td>
			<td>
				<input type="text" name="parameter_type" id="parameter_type" placeholder="请输入参数类型">
			</td>
		</tr>
		<tr>
			<td calss="td">参数值：</td>
			<td>
				<input type="text" name="parameter_value" id="parameter_value" placeholder="请输入参数值">
			</td>
		</tr>
		<tr>
			<td calss="td" ></td>
			<td>
				<button type="button" class="layui-btn" onclick="submitForm()"><i class="layui-icon">&#xe608;</i>新增参数</button>
			<!-- 	<button type="button" class="layui-btn" onclick="javascript:history.back(-1);">返回</button> -->
			</td>
		</tr>
		</table>
	</form>
</div>
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