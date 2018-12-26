<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/js/jqueryUI/jquery-ui.min.css">
<script type="text/javascript"
	src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
</head>
<style>
#con{margin-top:30px;margin-left:100px}
#tb1 input{width:200px;height:35px}
</style>
<script type="text/javascript">
function aaa(){
	console.log("1111");
}
$(document).ready(function(){
//选 药品 显示信息
	$("#drug_id").blur(function(){
		alert($("#drug_id").val());
		$.ajax({
    		type:"post",
    		url:"<%=basePath%>/daily/getInventoryByIdForSold.action",
			data : {"drug_id" : $("#drug_id").val()},
			dataType : "json",
			success : function(res) {
			var msg = "";
			for (var i = 0; i < res.length; i++) {
				var inventory = res[i];
				msg += "库存id:<input name='inventory_id' value='"+inventory.inventory_id+"' readonly='readonly'>";
				msg += "数量：<input name='inventory_id' value='"+inventory.inventory_number+"' readonly='readonly'>";
				msg += "销售数量：<input name='number' value=''>";
				msg += "<td><button id='submit"+i+" 'onclick='aaa()'>出药</button><td><br>";
			}
			$("#saleForm").append(msg);
			}
		});
	});

});
	
</script>
<body>
	<div id="con">
	<table id="tb1">
		<tr>
			<td>药品:</td>
			<td>
				<select id="drug_id" name="drug_id">
					<option value="">请选择药品</option>
					<c:forEach items="${requestScope.inventoryss}" var="inventory">
						<option value="${inventory.drug_id}">${inventory.drug_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<form name="saleForm" id="saleForm">
	</form>
</div>
</body>

</html>