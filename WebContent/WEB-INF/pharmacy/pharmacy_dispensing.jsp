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
function aaa(inventory_id,inventory_number,numberid){
	
	var reg = /^[0-9]*$/;
	var saleNum = document.getElementById(numberid).value;
	if(!reg.test(saleNum) || saleNum=="" || saleNum==null){
		alert("请输入数字");
		return false;
	}
	if(inventory_number<saleNum){
		alert("数量太大！");
		return false;
	}
	$("tbody").append("<tr><td><input name='inventory_id' id='inventory_id' value='"+inventory_id+"'></td><td><input name='saleNum' id='saleNum' value='"+saleNum+"'></td></tr>");
	$.ajax({
		type:"post",
		url:"<%=basePath%>/daily/soldDrug.action",
		data : {"inventory_id":inventory_id,"saleNum":saleNum},
		dataType : "json",
		success : function(res) {
			alert(res);
		}
	});
	
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
				msg += "数量：<input name='inventory_number' id='"+i+1+"' value='"+inventory.inventory_number+"' readonly='readonly'>";
				msg += "销售数量：<input name='"+i+"' id='"+i+"' value=''>";
				msg += "<td><a href='#' id='submit"+i+"' onclick='aaa("+inventory.inventory_id+","+inventory.inventory_number+","+i+")'>出药</a><td><br>";
			}
			$("#saleForm").html(msg);
			}
		});
	});

});
	function submitOrder(){
// 		var inventory_id = document.getElementById("inventory_id").value; 
// 		var saleNum = document.getElementById("saleNum").value; 
		
		$.ajax({
			type:"post",
			url:"<%=basePath%>/daily/soldOrder.action",
			data : {},
			dataType : "json",
			success : function(res) {
				if(res==1){
					alert("出药成功");
				}else{
					alert("出药失败");
				}
			}
		});
	}
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
	<form id="myForm">
	<table>
		<caption>订单表</caption>
		
		<thead>
			<th>库存id</th>
			<th>销售数量</th>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	<a onclick="submitOrder()">提交订单</a>
	</form>
</body>

</html>