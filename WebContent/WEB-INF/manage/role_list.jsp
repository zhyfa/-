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
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<style>
ul li {
	list-style-type: none;
	margin: 8px 0;
}
a {
/* 	text-decoration:none; */
	font-size:16px;
}
#btn_add{margin_right:10%;margin-top:40px;float:right}
h2{margin-left:40%;margin-top:10px;}
</style>
<script>
$(document).ready(function(){
	
});

</script>
</head>

<body>
<div>
<div id="btn_add">
 	<button class="layui-btn " onclick="addNewRole()"><i class="layui-icon">&#xe608;</i>添加</button>
</div>
	<h2>系统角色列表</h2>
<table  class="layui-table" lay-even lay-skin="line ">
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
				<td>
				<button class="layui-btn layui-btn-xs" onclick='updateRole(${r.roleId})'><i class="layui-icon ">&#xe642;</i>修改</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
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

	</div>
 
 
 
</body>
<script>
//进入修改角色名页面
function updateRole(role_id){
	 var that = this; 
	    //多窗口模式，层叠置顶
	    layer.open({
	      type: 2 //此处以iframe举例
	      ,title: '修改角色'
	      ,area: ['600px', '400px']
	      ,shade: 0
	      ,maxmin: true
	      ,content: '<%=basePath%>/role/updateRoleBefore.action?roleId='+role_id
	    });
}

function addNewRole(){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2 //此处以iframe举例
      ,title: '新增角色'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/role/addRoleBefore.action'
    });
  }
</script>
</html>
