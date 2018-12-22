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
<style type="text/css">
#page {
	position: absolute;
	left: 200px;
	top: 350px;
}
</style>
<body>
<table border="1" class="table">
	<caption>审核退库</caption>
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
			<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="active">
					<td>${st.count }</td>
					<td>${inventory.inventory_id }</td>
					<td>${inventory.drug_id }</td>
					<td>${inventory.drug_name }</td>
					<td>${inventory.production_date }</td>
					<td>${inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
					<td>${inventory.parameter_name }</td>
					<td>${inventory.cdate }</td>
					<td>
						<button onclick="returnBackToStockPass(${inventory.inventory_id },${inventory.drug_id },${inventory.admin_id },${inventory.inventory_number },'${inventory.production_date }')" ${inventory.state!=3?'hidden':'' }>审核通过</button>
						<button onclick="returnBackToStockNotPass(${inventory.inventory_id })"  ${inventory.state!=3?'hidden':'' }>审核不通过</button>
						<button onclick="createReturnBackForm()" ${inventory.state!=4?'hidden':'' }>生成水印单</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
</table>
<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/daily/returnStockReviewList.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/daily/returnStockReviewList.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/daily/returnStockReviewList.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/daily/returnStockReviewList.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/daily/returnStockReviewList.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a href="<%=basePath%>/daily/returnStockReviewList.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
<%-- ${requestScope.inventorys } --%>
<%-- ${requestScope.page } --%>
</body>
<script type="text/javascript">
function returnBackToStockPass(inventory_id,drug_id,admin_id,inventory_number,production_date){
	if(confirm("确认审核通过嘛？")){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/returnBackToStockPass.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id,"drug_id":drug_id,"admin_id":admin_id,"inventory_number":inventory_number,"production_date":production_date},
			success : function(res) {
				if(res==1){
					alert("通过成功");
					window.location.href="<%=basePath%>/daily/returnStockReviewList.action";
				}else{
					alert("通过失败");
				}
			}
		});
	}
	
}
function returnBackToStockNotPass(inventory_id){
	if(confirm("确认驳回申请嘛？")){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/returnBackToStockNotPass.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id},
			success : function(res) {
				if(res==1){
					alert("驳回成功");
					window.location.href="<%=basePath%>/daily/returnStockReviewList.action";
				}else{
					alert("驳回失败");
				}
			}
		});
	}
}

</script>
</html>