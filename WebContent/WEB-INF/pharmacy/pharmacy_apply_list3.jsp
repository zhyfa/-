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
<title>药房申请药品页面</title>
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
	<c:forEach items="${requestScope.applyList}" var="r" varStatus="st">
		<div class="myResult"><br/>
			<span id="cdate">${r.CDATE}</span><br >
			<a href="#" onclick="seeDetaile(${r.IC})"><h3>申请编号${r.IC}</h3></a>
		</div>
	</c:forEach>
</body>
<script type="text/javascript">
//进入该IC编号的具体申请明细
function seeDetaile(ic) {
	window.location.href="<%=basePath%>/pharmacyApply/pharmacy_apply_detaile3.action?ic="+ic;
	window.event.returnValue=false;
}
</script>
</html>