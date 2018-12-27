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
				<th>药品id</th>
				<th>药品名字</th>
				<th>生产日期</th>
<!-- 				<th>保质期</th> -->
				<th style="color: red;">是否滞销</th>
			</tr>
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
<%-- 						<td>${inventory.irradiated }个月</td> --%>
						<td>${inventory.msg }</td>
					</tr>
			</c:forEach>
		</tbody>

	</table>


</body>
</html>