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
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style type="text/css">
caption{font-size:24px}
#td1{text-align:left;font-size:24px}
#td2{text-align:right;padding-right:30px}
</style>
<body>
	<table style="width:100%; margin-top:50px">
	<tr>
		<td id="td1">审核退库</td>
		<td id="td2"><button class="layui-btn" onclick="createReturnBackForm()" ${inventory.state!=4?'hidden':'' }><i class="layui-icon">&#xe609;</i>导出</button>
		</td>
	</tr>
	</table>
<table class="layui-table">
	
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
				<tr class="active">
					<td>${st.count }</td>
					<td>${inventory.inventory_id}</td>
					<td>${inventory.drug_id}</td>
					<td>${inventory.drug_name}</td>
					<td>${inventory.production_date}</td>
					<td>${inventory.inventory_number}${inventory.spec==1?'盒':'瓶'}</td>
					<td>${inventory.parameter_name}</td>
					<td>${inventory.cdate }</td>
					<td>
						<button class="layui-btn layui-btn-xs" onclick="returnBackToStockPass(${inventory.inventory_id },${inventory.drug_id },${inventory.admin_id },${inventory.inventory_number },'${inventory.production_date }')" ${inventory.state!=3?'hidden':''}><i class="layui-icon">&#xe605;</i>通过</button>
						<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="returnBackToStockNotPass(${inventory.inventory_id })"  ${inventory.state!=3?'hidden':'' }><i class="layui-icon">&#x1006;</i>驳回</button>

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