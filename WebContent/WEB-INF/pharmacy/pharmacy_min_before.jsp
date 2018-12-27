<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
#con{margin-left:100px;margin-top:30px}
th{text-align:right; margin-left:10px}

input{width:200px;height:30px;  border:0.5px solid #E6E6FA; border-radius: 3px 3px 3px 3px; margin-top:10px}
</style>
<body>
<div id="con">
<form id="submitForm" class="form-horizontal" role="form">
	<input type="text" value="${requestScope.drug.drug_id }" name="drug_id" hidden="hidden">
	<table id="tb1">
		<tr>
			<th>药品名字：</th>
			<td><input type="text" value="${requestScope.drug.drug_name }" name="drug_name" readonly="readonly"></td>
		</tr>
		<tr>
			<th>类别：</th>
			<td>
				<input type="text" value="${requestScope.drug.smalltype_name }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>规格：</th>
			<td>
				<input type="text" value="${requestScope.drug.drug_size }${requestScope.drug.drug_unit }/${requestScope.drug.spec==1?'盒':'瓶' }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>药房最低量数：</th>
			<td>
				<input type="text" value="${requestScope.drug.inventory_min }" name="inventory_min" id="inventory_min">${requestScope.drug.spec==1?'盒':'瓶' }
			</td>
		</tr>
		<tr>
		<th></th>
		<td><input class="layui-btn" type="submit" class="btn btn-default" value="设置药库最低限量" onclick="updateStockMin()"></td>
		</tr>
	</table>
</form>
</div>
</body>
<script type="text/javascript">
function updateStockMin(){
	var inventory_min = document.getElementById("inventory_min").value.trim();
	var reg = /^[0-9]*$/;
	if(!reg.test(inventory_min) || inventory_min==""){
		alert("最低量请输入数字");
		return false;
	}
	if(inventory_min.length>8){
		alert("数值最大为99999999");
		return false;
	}
	if(confirm('确定要设置最低量嘛吗')){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/earlyWaring/updatePharmaryMin.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data:$("#submitForm").serialize(),
			success : function(data) {
				if(data==1){
					alert("设置药库最低量成功");
					parent.window.location.href="<%=basePath%>/earlyWaring/min.action"
				}
				if(data==2){
					alert("设置药库最低量失败");
				}
			}
		});
	}
}
</script>
</html>