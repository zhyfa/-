<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function a(){
	window.location.href="<%=basePath%>/creditInfo/excel.action"
}
</script>
</head>
<body>

<a onclick="a()">导出</a>
</body>

</html>