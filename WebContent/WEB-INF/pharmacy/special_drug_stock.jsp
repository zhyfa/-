<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>药房特殊药品库存页面</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
</head>
<style>

</style>
<body>
<br />
<form id="myForm" action="<%=basePath%>/specialDrugs/inventory.action" method="post">
药品名字：<input type="text" name="drug_name" id="drug_name" value='${requestScope.drug_name}'>&nbsp;
<input type="submit" value="搜索"><br />
</form>
<table class="table table-bordered">
<caption>特殊药品库存表</caption>
	<thead>
		<tr>
			<th>序号</th>
			<th>药品名称</th>
			<th>数量</th>
			<th>药品厂家</th>
			<th>药品生产日期</th>
		</tr>
	</thead>
	<tbody id="specialDrugs">
		<c:forEach items="${requestScope.specialDruges}" var="s" varStatus="st">
			<tr>
					<td>${st.count}</td>
					<td>${s.DRUG_NAME}</td>
					<td>${s.INVENTORY_NUMBER}</td>
					<td>${s.FACTORY_NAME}</td>
					<td>${s.BIRTHDAY}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
一共有：${requestScope.page.count}条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/specialDrugs/inventory.action?pageIndex=1&drug_name=${requestScope.drug_name}">首页</a>&nbsp;
		<a href="<%=basePath%>/specialDrugs/inventory.action?pageIndex=${requestScope.page.pre}&drug_name=${requestScope.drug_name}">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages}" var="prePage">
			<a href="<%=basePath%>/specialDrugs/inventory.action?pageIndex=${prePage}">${prePage}</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page}</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages}" var="nextPage">
			<a href="<%=basePath%>/specialDrugs/inventory.action?pageIndex=${nextPage}&">${nextPage}</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/specialDrugs/inventory.action?pageIndex=${requestScope.page.next}&drug_name=${requestScope.drug_name}">下一页</a>&nbsp;
		<a href="<%=basePath%>/specialDrugs/inventory.action?pageIndex=${requestScope.page.all}&drug_name=${requestScope.drug_name}">末页</a>&nbsp;

</body>
<script type="text/javascript">

</script>
</html>