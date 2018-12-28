<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<body>
<button onclick="javascript:history.back(-1);">返回</button>
	<table border="1" class="table">
		<caption>退货</caption>
		<thead>
		<tr>
			<th>序号</th>
			<th>药品id</th>
			<th>药品名称</th>
			<th>数量</th>
			<th>生产日期</th>
			<th>采购人</th>
			<th>供应商</th>
			<th>状态</th>
			<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.stocks }" var="stock" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="active">
					<td>${st.count }</td>
					<td>${stock.drug_id }</td>
					<td>${stock.drug_name }</td>
					<td>${stock.stock_number }</td>
					<td>${stock.cdate }</td>
					<td>${stock.admin_name }</td>
					<td>${stock.factory_name }</td>
					<td>${stock.parameter_name }</td>
					<td width="150">
						<button onclick="returnGood(${stock.stock_id },${stock.drug_id },${stock.stock_number })" ${stock.state!=1?'hidden':'' }>退货</button>
						<button onclick="returnGoodForm(${stock.stock_id })" ${stock.state!=3?'hidden':'' }>生成退货单</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
<%-- 	${requestScope.stocks } --%>
</body>
<script type="text/javascript">
	function returnGood(stock_id,drug_id,stock_number) {
		if(confirm("确认退货嘛？")){
			$.ajax({
				type : "post",
				url : "<%=basePath%>/stock/returnGood.action",
				//contentType : "application/json;charset=utf-8",
				dataType : "JSON",
				data : {"stock_id":stock_id,"drug_id":drug_id,"stock_number":stock_number},
				success : function(res) {
					if(res==1){
						alert("退货成功");
						window.location.href="<%=basePath%>/stock/returnGoodsBefore.action?drug_id="+drug_id;
					}
				}
			});
		}
	}
	
	function returnGoodForm(stock_id) {
		alert(stock_id);
		window.location.href="<%=basePath%>/Printing/returnGoodForm.action?stock_id="+stock_id;
		
	}
</script>
</html>