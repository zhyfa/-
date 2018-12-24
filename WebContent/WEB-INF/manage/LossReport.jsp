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
<title>报损查看</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.min.js"></script>
<script
	src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/xadmin.js"></script>
<script type="text/javascript" charset="utf8"
	src="<%=basePath%>/media/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-ui.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/css/jquery-ui.css">
<link rel="stylesheet"
	href="<%=basePath%>/css/jquery-ui.theme.css">
<link rel="stylesheet"
	href="<%=basePath%>/css/style.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/bootstrap/css/bootstrap.css">
<link rel="shortcut icon"
	href="<%=basePath%>/assets/x-admin/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/font.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/xadmin.css">
</head>


<body>
	<h1 style="text-align: center;">报损查看界面</h1>
	<a onclick="a()">导出所有数据</a>
			<table class="table table-hover"  style="border: 1px solid color:red">
					<thead>
						<tr>
							<th>报损序号</th>
							<th>库存ID</th>
							<th>药品名称</th>
							<th>操作人员姓名</th>
							<th>报损数量</th>
							<th>报损说明</th>
							<th>药品状态</th>
							<th>日期</th>
						</tr>
					</thead>
							<tbody id="body">
							<c:forEach items="${page.queryList}" var="log" >
								<tr>
									<td>${log.REIMBURSE_ID}</td>
									<td>${log.INVENTORY_ID}</td>
									<td>${log.DRUG_NAME}</td>
									<td>${log.ADMIN_NAME}</td>
									<td>${log.REIMBURSE_NUM}</td>
									<td>${log.ILLUSTRATE}</td>
									<td>${log.PARAMETER_NAME}</td>
									<td>${log.CDATE}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
	<ul class="pagination pagination-lg" id="changepage">
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
function addTabs(obj) {
	   console.log(obj);
    var page = (Number)($(obj).text());
    var pageTwo=(Number)($("#pageT").attr("value"));
    console.log(page);
    console.log(pageTwo);
   window.location.href="<%=basePath%>roomReport/lossReport.action?dqPage="+page+"&pageTwo="+pageTwo
}

function next(){
	   var pageTwo=(Number)($("#pageT").attr("value"));
	   var totalPageTwo=(Number)($("#totalPageTwo").attr("value"));
	   if(pageTwo>=totalPageTwo){
		   alert("没有更多页了！");
	   }else{
		   pageTwo++;
		   var page=(pageTwo-1)*5+1;
		   alert(pageTwo);
		   window.location.href="<%=basePath%>roomReport/lossReport.action?dqPage="+page+"&pageTwo="+pageTwo	   }
	   
}

function up(){
	   var pageTwo=(Number)($("#pageT").attr("value"));
	   var totalPageTwo=(Number)($("#totalPageTwo").attr("value"));
	   if(pageTwo<=1){
		   alert("没有更多页了！");
	   }else{
		   pageTwo--;
		   var page=(pageTwo-1)*5+1;
		   alert(pageTwo);
		   window.location.href="<%=basePath%>roomReport/lossReport.action?dqPage="+page+"&pageTwo="+pageTwo	   }
	   
}

function a(){
	window.location.href="<%=basePath%>roomReport/toexls.action"
}
   </script>
   
</html>