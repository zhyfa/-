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
<title>药房特殊药品销售明细页面</title>
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
<form action="">

</form>
	<table class="table table-bordered">
	<caption>特殊药品销售明细表</caption>
	<thead>
		<tr>
			<th>序号</th>
			<th>购买者</th>
			<th>药品名称</th>
			<th>厂家</th>
			<th>数量</th>
			<th>生成日期</th>
			<th>用途</th>
			<th>经办者</th>
			<th>售价（/元）</th>
			<th>交易时间</th>
		</tr>
	</thead>
	<tbody id="specialDrugs">
		<c:forEach items="${requestScope.specialDruges}" var="s" varStatus="st">
			<tr>
					<td>${st.count}</td>
					<td>${s.PERSON}</td>
					<td>${s.DRUG_NAME}</td>
					<td>${s.FACTORY_NAME}</td>
					<td>${s.SOLD_NUM}</td>
					<td>${s.BIRTHDAY}</td>
					<td>${s.PURPOSE}</td>
					<td>${s.ADMIN_NAME}</td>
					<td>${s.PRICE}</td>
					<td>${s.CDATE}</td>
				</tr>
		</c:forEach>
			
	</tbody>
</table>
</body>
<script type="text/javascript">

</script>
</html>