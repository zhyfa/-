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
</style>
<body>

	<table class="layui-table">
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
				<tr class="active">
					<td >${st.count }</td>
					<td >${drug.drug_id }</td>
					<td >${drug.drug_name }</td>
					<td >${drug.stock_number==null?0:drug.stock_number }${drug.spec==1?'盒':'瓶' }</td>
					<td >
						<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="returnGood(${drug.drug_id })"><i class="layui-icon">&#xe66c;</i>退还厂家</button>
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