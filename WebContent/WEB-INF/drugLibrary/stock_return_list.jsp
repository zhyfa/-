<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
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
	<caption>药库库存详情</caption>
		<thead>
			<tr>
				<th>序号</th>
				<td>药品id</td>
				<td>药品名字</td>
				<td>药库库存数量</td>
				<td>操作</td>
			<tr></tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.page.list }" var="drug" varStatus="st">
			<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="active">
					<td width="50">${st.count }</td>
					<td width="100">${drug.drug_id }</td>
					<td>${drug.drug_name }</td>
					<td width="150">${drug.stock_number==null?0:drug.stock_number }${drug.spec==1?'盒':'瓶' }</td>
					<td width="100">
						<input type="button" onclick="returnGood(${drug.drug_id })" value="退还厂家">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/stock/return.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/stock/return.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/stock/return.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/stock/return.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/stock/return.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a href="<%=basePath%>/stock/return.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>

</body>
<script type="text/javascript">
	function returnGood(drug_id) {
		window.location.href="<%=basePath%>/stock/returnGoodsBefore.action?drug_id="+drug_id;
	}
</script>
</html>