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
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>

<style type="text/css">
.info{margin-top:20px}
.info input{width:200px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;margin-top:5px}
.info .td{text-align:left;font-size:16px}
#btnSearch{width:70px;}
#addButton{width:90px;}
#page{font-size:16px}
caption{font-size:24px}
</style>
</head>
<body>
	<table class="layui-table">
		<caption>采购单明细</caption>
		
		<tr>
			<th>明细单编号</th>
			<td>${requestScope.purchase.AUDITSDETAIL_ID}</td>
			<th>申请人</th>
			<td>${requestScope.purchase.ADMIN_ID}</td>
			<th>申请日期</th>
			<td colspan="2">${requestScope.purchase.PURCHASE_DATE}</td>
		</tr>	
	</table>
	<table class="layui-table">
		<thead>
		<tr>
				<th>序号</th>
				<th>药品编号</th>
				<th>药品名称</th>
				<th>价格</th>
				<th>申购数量</th>
				<th>生产厂家</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.aditDeatilList }" var="auditDeatil" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="checkAudits">
					<td>${st.count }</td>
					<td>${auditDeatil.DRUG_ID}</td>
					<td>${auditDeatil.DRUG_NAME}</td>
					<td>${auditDeatil.PRICE}</td>
					<td>${auditDeatil.TOTAL}</td>
					<td>${auditDeatil.FACTORY}</td>
					<td>${auditDeatil.STAT}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/stock/PurchaseDetail.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/stock/PurchaseDetail.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/stock/PurchaseDetail.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/stock/PurchaseDetail.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/stock/PurchaseDetail.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/stock/PurchaseDetail.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div> 
	
	
</body>
<script type="text/javascript">

  
 
</script>
</html>