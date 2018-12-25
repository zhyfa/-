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
<form id="submitForm" class="form-horizontal" role="form">
		<table class="info">
		<tr>
			<td class="td">
			<input type="text" value="${requestScope.drug.drug_id }" name="drug_id" hidden="hidden">
			药品名字：</td>
			<td>
				<input type="text" value="${requestScope.drug.drug_name }" name="drug_name" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="td">类别：</td>
			<td><input type="text" value="${requestScope.drug.smalltype_name }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="td">规格：</td>
			<td>
				<input type="text" value="${requestScope.drug.drug_size }${requestScope.drug.drug_unit }/${requestScope.drug.spec==1?'盒':'瓶' }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="td">药库最低量数：</td>
			<td>
			<input type="text" value="${requestScope.drug.stock_min }" name="stock_min" id="stock_min">${requestScope.drug.spec==1?'盒':'瓶' }
			</td>
		</tr>
		<tr>
			<td class="td"></td>
			<td>
				<button class="layui-btn"  onclick="updateStockMin()"><i class="layui-icon ">&#xe605;</i>设置药库最低限量</button>
			</td>
		</tr>
	</table>
</form>
</div>
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