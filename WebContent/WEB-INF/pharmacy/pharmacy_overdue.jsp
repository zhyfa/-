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
<link rel="shortcut icon" href="<%=basePath%>/assets/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style>
caption{font-size:24px}
</style>
<body>
	<table class="layui-table">
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
						<td style="color: red;">${overdue.msg}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>