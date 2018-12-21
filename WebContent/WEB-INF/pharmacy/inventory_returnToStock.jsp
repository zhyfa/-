<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=basePath %>/js/jquery.min.js"></script>
</head>
<body>
<button onclick="javascript:history.back(-1);">返回</button>
<table border="1">
	<caption></caption>
	<thead>
		<th>序号</th>
		<th>药房库存id</th>
		<th>药品id</th>
		<th>药品名字</th>
		<th>生产日期</th>
		<th>数量</th>
		<th>状态</th>
		<th>创建日期</th>
		<th>操作</th>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.inventorys }" var="inventory" varStatus="st">
			<tr>
				<td>${st.count }</td>
				<td>${inventory.inventory_id }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.production_date }</td>
				<td>${inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.parameter_name }</td>
				<td>${inventory.cdate }</td>
				<td>
					<button onclick="returnBackToStockRequest(${inventory.inventory_id },${inventory.drug_id })"  ${inventory.state!=1?'hidden':'' }>退库申请</button>
					<button onclick="createReturnBackForm()" ${inventory.state!=4?'hidden':'' }>生成水印单</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- ${requestScope.inventorys } --%>
</body>
<script type="text/javascript">
function returnBackToStockRequest(inventory_id,drug_id){
	alert(inventory_id);
	if(confirm("确认退库嘛？")){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/returnBackToStockRequest.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id},
			success : function(res) {
				alert(res);
				if(res==1){
					alert("申请成功");
					window.location.href="<%=basePath%>/daily/getInventorys.action?drug_id="+drug_id;
				}else{
					alert("申请失败");
				}
			}
		});
	}
}
function createReturnBackForm(){
	alert("111");
}
</script>
</html>