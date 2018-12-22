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
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<button onclick="javascript:history.back(-1);">返回</button>
<table border="1" class="table">
	<caption>报损</caption>
	<thead>
		<th>序号</th>
		<th>药房库存id</th>
		<th>药品id</th>
		<th>药品名字</th>
		<th>生产日期</th>
		<th>数量</th>
		<th>状态</th>
<!-- 		<th>创建日期</th> -->
		<th>操作</th>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.inventorys }" var="inventory" varStatus="st">
			<!-- var demo = {"active","success","warning","danger"}; -->
			<tr class="danger">
				<td>${st.count }</td>
				<td>${inventory.inventory_id }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.production_date }</td>
				<td>${inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.parameter_name }</td>
<%-- 				<td>${inventory.cdate }</td> --%>
				<td>
					<button onclick="returnBackToStockRequest(${inventory.inventory_id },${inventory.drug_id })"  ${inventory.state!=1?'hidden':'' }>报损申请</button>
					<button onclick="createReturnBackForm()" ${inventory.state!=7?'hidden':'' }>生成报损水印单</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- ${requestScope.inventorys } --%>
</body>
<script type="text/javascript">
function returnBackToStockRequest(inventory_id,drug_id){
	
	if(confirm("确认报损嘛？")){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/badDrugRequest.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id},
			success : function(res) {
				alert(res);
				if(res==1){
					alert("报损成功");
					window.location.href="<%=basePath%>/daily/badDrugRequestBefore.action?drug_id="+drug_id;
				}else{
					alert("报损失败");
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