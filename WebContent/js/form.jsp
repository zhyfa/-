<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的文档</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/jqueryUI/jquery-ui.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jqueryUI/jquery-ui.min.js"></script>
<script>
  $(function() {
    $( "#startDate" ).datepicker();
    $( "#startDate" ).datepicker("option", "dateFormat","yy-mm-dd");
    $( "#endDate" ).datepicker();
    $( "#endDate" ).datepicker("option", "dateFormat","yy-mm-dd");
    
  });
 
</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/front/main.jsp">文档分享平台</a>
			</div>
		</div>
	</nav>
	<form>
		上传日期：<input type="text" id="startDate">-<input type="text"
			id="endDate"><br> 文档类型：
		
		审核状态：
		
	</form>
	<table class="table">
		<caption>我的文档</caption>
		<thead>
			<tr>
				<th>序号</th>
				<th>文档标题</th>
				<th>上传时间</th>
				<th>下载积分</th>
				<th>文档类型</th>
				<th>审核状态</th>
				<th>真实路径</th>
			</tr>
		</thead>
		<tbody>
			
				<tr class="success">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
				</tr>
				<tr class="success">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
				</tr>
				<tr class="success">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
				</tr>
				<tr class="success">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
				</tr>
			
		</tbody>
	</table>
	总记录数：
	<s:property value="pageInfo.count" />
	&nbsp&nbsp&nbsp 当前页数:
	<s:property value="pageInfo.page" />
	/
	<s:property value="pageInfo.pageNum" />
	&nbsp&nbsp&nbsp
	<a
		href="">上一页</a>
	<a
		href="">下一页</a>
</body>
</html>