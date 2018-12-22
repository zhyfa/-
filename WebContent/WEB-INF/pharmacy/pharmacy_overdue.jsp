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
<style>
#page {
	position: absolute;
	left: 200px;
	top: 350px;
}
</style>
<body>
	<table border="1" class="table">
		<caption>过期</caption>
		<thead>
			<tr>
				<th>序号</th>
				<th>药房库存id</th>
				<th>药品名字</th>
				<th>药品名字</th>
				<th>生产日期</th>
				<th>保质期</th>
				<th style="color: red;">是否过期</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.overdues }" var="overdue"
				varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<c:if test="${!empty overdue.msg }">
					<tr class="danger">
						<td>${st.count }</td>
						<td>${overdue.inventory_id }</td>
						<td>${overdue.drug_id }</td>
						<td>${overdue.drug_name }</td>
						<td>${overdue.production_date }</td>
						<td>${overdue.irradiated }个月</td>
						<td>${overdue.msg }</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>

	</table>
	<!-- 	<div id="page"> -->
	<%-- 		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
	<%-- 		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
	<%-- 		<a href="<%=basePath%>/earlyWaring/overdue.action?pageIndex=1">首页</a>&nbsp; --%>
	<!-- 		<a -->
	<%-- 			href="<%=basePath%>/earlyWaring/overdue.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp; --%>
	<%-- 		<c:forEach items="${requestScope.page.prePages }" var="prePage"> --%>
	<%-- 			<a href="<%=basePath%>/earlyWaring/overdue.action?pageIndex=${prePage }">${prePage }</a>&nbsp; --%>
	<%-- 		</c:forEach> --%>
	<%-- 		<a style="color: black;">${requestScope.page.page }</a>&nbsp; --%>
	<%-- 		<c:forEach items="${requestScope.page.nextPages }" var="nextPage"> --%>
	<%-- 			<a href="<%=basePath%>/earlyWaring/overdue.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp; --%>
	<%-- 		</c:forEach> --%>
	<!-- 		<a -->
	<%-- 			href="<%=basePath%>/earlyWaring/overdue.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp; --%>
	<!-- 		<a -->
	<%-- 			href="<%=basePath%>/earlyWaring/overdue.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp; --%>
	<!-- 	</div> -->
	<%-- 	${requestScope.overdues } --%>
</body>
</html>