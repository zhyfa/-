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
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
</head>
<style>
#submitForm{
margin-left: 200px;
}
</style>
<body>
<form id="submitForm" class="form-horizontal" role="form">
	<div class="form-group">
<!-- 		<label for="lastname" class="col-sm-2 control-label">药品id:</label> -->
		<div class="col-sm-10">
			<input type="text" value="${requestScope.drug.drug_id }" name="drug_id" hidden="hidden">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">药品名字：</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.drug.drug_name }" name="drug_name" readonly="readonly">
		</div>
	</div>
<%-- 	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">大类别：</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.drug.bigtype_name }" readonly="readonly">
		</div>
	</div> --%>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">类别：</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.drug.smalltype_name }" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">规格：</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.drug.drug_size }${requestScope.drug.drug_unit }/${requestScope.drug.spec==1?'盒':'瓶' }" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">药库最低量数：</label>
		<div class="col-sm-10">
			<input type="text" value="${requestScope.drug.stock_min }" name="stock_min" id="stock_min">${requestScope.drug.spec==1?'盒':'瓶' }
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<input type="submit" class="btn btn-default" value="设置药库最低限量" onclick="updateStockMin()">
		</div>
	</div>
</form>
<%-- ${requestScope.drug } --%>
</body>
<script type="text/javascript">
function updateStockMin(){
	var stock_min = document.getElementById("stock_min").value.trim();
	var reg = /^[0-9]*$/;
	if(!reg.test(stock_min) || stock_min==""){
		alert("最低量请输入数字");
		return false;
	}
	if(stock_min.length>8){
		alert("数值最大为99999999");
		return false;
	}
	if(confirm('确定要设置最低量嘛吗')){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/drug/updateStockMin.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data:$("#submitForm").serialize(),
			success : function(data) {
				if(data==1){
					alert("设置药库最低量成功");
					parent.window.location.href="<%=basePath%>/drug/stock_min.action"
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