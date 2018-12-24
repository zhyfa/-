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
	药品:
	<select id="drug_id" name="drug_id">
		<option value="">请选择药品</option>
		<c:forEach items="${requestScope.inventoryss}" var="inventory">
			<option value="${inventory.drug_id}">${inventory.drug_name}</option>
		</c:forEach>
	</select>
	<form name="saleForm" id="saleForm">
	</form>
<!-- 	<div> -->
<!-- 		<input type="button" onclick="DelRow();" value="删除"> <input -->
<!-- 			type="button" onclick="AddRow();" value="添加"> <input -->
<!-- 			type="button" value="提交" onclick="submitForm()"> <input -->
<!-- 			type="button" value="生成入库单" onclick="submitTable()"> -->
<!-- 	</div> -->
<!-- 	<div class=""> -->
<!-- 		<input type="hidden" id="hid" name="hid" /> -->
<!-- 		<table id="tab1" class="detailList" border="1"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>序号</th> -->
<!-- 					<th>采购单编号</th> -->
<!-- 					<th>药品编号</th> -->
<!-- 					<th>药品名称</th> -->
<!-- 					<th>生产厂家</th> -->
<!-- 					<th>生产日期</th> -->
<!-- 					<th>生产批号</th> -->
<!-- 					<th>入库数量</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody id="tbody"></tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
	<%-- 	${requestScope.inventoryss } --%>
</body>

</html>