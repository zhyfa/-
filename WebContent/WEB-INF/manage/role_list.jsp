<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<style>
ul li {
	list-style-type: none;
	margin: 8px 0;
}
a {
	text-decoration:none;
}
</style>
<script>
$(document).ready(function(){
	//显示所有的角色
	//show();
});

// function  show() {
// 	$.ajax({
<%-- 		url:"<%=basePath%>/role/queryAllRole.action", --%>
// 		type: "POST",
// 		data:'{}',
// 		success : function(res){
// 			var str='';
// 			for(var i=0;i<res.length;i++){
// 				var r=res[i];
// 				str+="<tr><td>"+r.roleId+"</td><td>"+r.roleName+"</td><td><input type='button' value='修改' onclick='updateRole("+r.roleId+")'></td></tr>";
// 			}
// 			$("#roleTable").html(str);
// 		}
// 	});
// }
</script>
</head>

<body>
</form>
 	<form action="<%=basePath%>/role/addRoleBefore.action" method="post" >
   	<input type="submit" value="新增角色" />
</form>
<table class="table table-bordered">
	<caption>系统角色列表</caption>
	<thead>
		<th>用户ID</th>
		<th>用户名</th>
		<th>操作</th>
	</thead>
	<tbody id="roleTable">
		<c:forEach items="${requestScope.roles}" var="r">
			<tr>
				<td>${r.roleId}</td>
				<td>${r.roleName}</td>
				<td><input type='button' value='修改' onclick='updateRole(${r.roleId})'></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/role/toJSP.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/role/toJSP.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/role/toJSP.action?pageIndex=${prePage}">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page}</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages}" var="nextPage">
			<a href="<%=basePath%>/role/toJSP.action?pageIndex=${nextPage }&">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/role/toJSP.action?pageIndex=${requestScope.page.next}">下一页</a>&nbsp;
		<a href="<%=basePath%>/role/toJSP.action?pageIndex=${requestScope.page.all}">末页</a>&nbsp;


<%-- 		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- 		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- 		<a href="<%=basePath%>/role/toJSP.action?pageIndex=1&roleName=${requestScope.roleName}">首页</a>&nbsp; --%>
<%-- 		<a href="<%=basePath%>/role/toJSP.action?pageIndex=${requestScope.page.pre }&roleName=${requestScope.roleName}">上一页</a>&nbsp; --%>
<%-- 		<c:forEach items="${requestScope.page.prePages }" var="prePage"> --%>
<%-- 			<a href="<%=basePath%>/role/toJSP.action?pageIndex=${prePage}&roleName=${requestScope.roleName}">${prePage }</a>&nbsp; --%>
<%-- 		</c:forEach> --%>
<%-- 		<a style="color: black;">${requestScope.page.page }</a>&nbsp; --%>
<%-- 		<c:forEach items="${requestScope.page.nextPages }" var="nextPage"> --%>
<%-- 			<a href="<%=basePath%>/role/toJSP.action?pageIndex=${nextPage }&">${nextPage }</a>&nbsp; --%>
<%-- 		</c:forEach> --%>
<%-- 		<a href="<%=basePath%>/role/toJSP.action?pageIndex=${requestScope.page.next }&roleName=${requestScope.roleName}">下一页</a>&nbsp; --%>
<%-- 		<a href="<%=basePath%>/role/toJSP.action?pageIndex=${requestScope.page.all }&roleName=${requestScope.roleName}">末页</a>&nbsp; --%>
	</div>
 
 
 
</body>
<script>
//进入修改角色名页面
function updateRole(role_id){
	window.location.href="<%=basePath%>/role/updateRoleBefore.action?roleId="+role_id;
}

</script>
</html>
