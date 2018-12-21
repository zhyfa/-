<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>日志查看管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.min.js"></script>
<script
	src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/assets/bootstrap/css/bootstrap.css">
<link rel="shortcut icon"
	href="<%=basePath%>/assets/x-admin/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/font.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/xadmin.css">
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/xadmin.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/media/css/jquery.dataTables.css">
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="<%=basePath%>/media/js/jquery.js"></script>
<script type="text/javascript" charset="utf8"
	src="<%=basePath%>/media/js/jquery.dataTables.js"></script>

</head>


<body>
	<h1 style="text-align: center;">成员管理界面</h1>

	<a class="btn btn-primary" role="button"
		onclick="x_admin_show('添加新成员'  ,'${pageContext.request.contextPath }/admin/addadminbefore.action',600,400)"
		href="javascript:;"> <i class="layui-icon">&#xe642;</i>添加用户
	</a>
	<div style="padding: 100px 100px 10px;">
		<form id="queryadmin" class="navbar-form navbar-left">
			<div class="input-group">
				<label class="input-group ">请在下列输入（选择）查询条件</label> 
				<p>姓名 <input type="text" class="form-control" placeholder="请输入需要查询的姓名" name="admin_name" id="adminname"></p>
					<p>起始日期：<input  class="form-control" type="text" id="datepickerstart" name="startdata"></p>
					<p>结束日期：<input class="form-control" type="text" id="datepickerend" name="enddata"></p>
			</div>
			<input type="button" class="btn btn-primary" data-toggle="button"
				value="查询" onclick="queryadmin()">
		</form>
	</div >
	

			<table class="table table-hover"  style="border: 1px solid color:red">
					<thead>
						<tr>
							<th>序号</th>
							<th>操作人员姓名</th>
							<th>操作</th>
							<th>日期</th>
						</tr>
					</thead>
							<tbody>
							<c:forEach items="${page.queryList}" var="log" varStatus="st">
								<tr>
									<td>${st.count}</td>
									<td>${log.ADMIN_NAME}</td>
									<td>${log.LOG_OPERATION}</td>
									<td>${log.LOG_CDATE}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
	<ul class="pagination pagination-lg">
		<li><a onclick="up()">&laquo;</a></li>
		<c:forEach items="${page.pageShu}" var="pageshu">
			<li><a onclick="addTabs(this)">${pageshu}</a></li>
		</c:forEach>
		
		<li><a onclick="next()">&raquo;</a></li>
		<li>共${page.totalPage}页，当前第${page.page}页</li>
	</ul>
	
	<input type="hidden" name="pageTwo" value="${page.pageTwo}" id="pageT">
	<input type="hidden" value="${page.totalPageTwo}" id="totalPageTwo">

</body>
<script type="text/javascript">
      
       
   </script>
</html>