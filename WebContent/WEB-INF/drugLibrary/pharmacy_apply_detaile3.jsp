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
<title>药房某次申请药品的最终详细页面</title>
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
<style>
.myResult{
	width:150px;
	height: 100px;
	border: 1px solid gray;
	float:left;
	margin:10px 10px;
	text-align: center;
}
</style>
</head>
	
<body>
	<br/>
	<button class="layui-btn" onclick="exportTable(${requestScope.ic})"><i class="layui-icon">&#xe609;</i>导出Excel表格</button>
	<table class="table table-bordered">
	<caption style="text-align:center"><h4>药房申请药品的已确认页面</h4></caption>
	<thead>
	<tr>
			<th>序号</th>
			<th>药品名称</th>
			<th>是否特殊药</th>
			<th>药品生产日期</th>
			<th>药品生产工厂</th>
			<th>数量</th>
			<th>确认时间</th>
			<th>申请者</th>
			<th>审批者</th>
			<th>意见</th>
		</tr>
	</thead>
	<tbody id="specialDrugs">
			<c:forEach items="${requestScope.applyList}" var="s" varStatus="st">
			<tr>
					<td>${st.count}</td>
					<td>${s.DRUG_NAME}</td>
					<td>${s.PSYCHOTROPICS}</td>
					<td>${s.BIRTHDAY}</td>
					<td>${s.FACTORY_NAME}</td>
					<td>${s.DRUG_NUMBER}</td>
					<td>${s.CDATE}</td>
					<td>${s.ADMIN_NAME1}</td>
					<td>${s.ADMIN_NAME2}</td>
					<td>${s.MEG}</td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<input type="button" onclick="javascript:history.back(-1);" value="返回" class="layui-btn" style="width:80px;">
</body>
<script type="text/javascript">
	function exportTable(ic) {
		console.log("ic3:"+ic)
		window.location.href="<%=basePath%>/Printing/detaile3.action?ic="+ic
	}
	
</script>
</html>