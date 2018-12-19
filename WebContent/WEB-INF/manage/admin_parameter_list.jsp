<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
</head>
<style>
body {
	margin-top: 20px;}
#addButton {
	position: absolute;
	left: 950px;}
#serach {
	position: absolute;
	left: 30px;}
.table {
	position: absolute;
	top: 50px;
	width: 900px;
	left: 100px;}
#page {
	position: absolute;
	top: 400px;
	left: 300px;}
</style>
<body>
	<form id="serach" action="<%=basePath%>/parameter/parameterList.action" method="post" onsubmit="return checkForm()">
		参数名字：
		<input type="text" name="parameter_name" value="${param.parameter_name}"> 
		参数类型：
		<input type="text" name="parameter_type" value="${param.parameter_type}"> 
		参数值：
		<input type="text" name="parameter_value" id="parameter_value" value="${param.parameter_value}"> 
		<input type="submit" value="搜索">
		<input type="button" id="addButton" onclick="parameterAdd()" value="新增参数">
	</form>
	<table border="1" width="80%" class="table">
		<caption>参数列表</caption>
		<thead>
			<th>序号</th>
			<th>参数id</th>
			<th>参数名字</th>
			<th>参数类型</th>
			<th>参数值</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.parameters }" var="parameter" varStatus="st">
			<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="success">
					<td width="50">${st.count }</td>
					<td width="70">${parameter.parameter_id }</td>
					<td>${parameter.parameter_name }</td>
					<td width="150">${parameter.parameter_type }</td>
					<td width="70">${parameter.parameter_value }</td>
					<td width="200">
						<button href="#" onclick="updateParatemerBefore(${parameter.parameter_id })">修改</button>
						<button href="#" onclick="delParameter(${parameter.parameter_id })">删除</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/parameter/parameterList.action?pageIndex=1&parameter_name=${param.parameter_name}&parameter_type=${param.parameter_type}&parameter_value=${param.parameter_value}">首页</a>&nbsp;
		<a href="<%=basePath%>/parameter/parameterList.action?pageIndex=${requestScope.page.pre }&parameter_name=${param.parameter_name}&parameter_type=${param.parameter_type}&parameter_value=${param.parameter_value}">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/parameter/parameterList.action?pageIndex=${prePage }&parameter_name=${param.parameter_name}&parameter_type=${param.parameter_type}&parameter_value=${param.parameter_value}">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/parameter/parameterList.action?pageIndex=${nextPage }&parameter_name=${param.parameter_name}&parameter_type=${param.parameter_type}&parameter_value=${param.parameter_value}">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/parameter/parameterList.action?pageIndex=${requestScope.page.next }&parameter_name=${param.parameter_name}&parameter_type=${param.parameter_type}&parameter_value=${param.parameter_value}">下一页</a>&nbsp;
		<a href="<%=basePath%>/parameter/parameterList.action?pageIndex=${requestScope.page.all }&parameter_name=${param.parameter_name}&parameter_type=${param.parameter_type}&parameter_value=${param.parameter_value}">末页</a>&nbsp;
	</div>
</body>

<script type="text/javascript">
function parameterAdd(){
	window.location.href="<%=basePath%>/parameter/intoAddjsp.action";
}
function delParameter(parameter_id){
	if(confirm('确定要删除吗')){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/parameter/delParameter.action?parameter_id="+parameter_id,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			data:'{}',
			success : function(data) {
				if(data==1){
					alert("删除成功");
					window.location.href="<%=basePath%>/parameter/parameterList.action"
				}
				if(data==2){
					alert("删除失败");
				}
			}
		});
	}
}
function updateParatemerBefore(parameter_id){
	window.location.href="<%=basePath%>/parameter/updateParatemerBefore.action?parameter_id="+parameter_id;
}
function checkForm(){
	var parameter_name = document.getElementById("parameter_name").value.trim();
	var parameter_type = document.getElementById("parameter_type").value.trim();
	var parameter_value = document.getElementById("parameter_value").value.trim();
	var reg = /^[0-9]*$/;
	if(!reg.test(parameter_value)){
		alert("参数值请输入数字");
		return false;
	}
	
}
</script>
</html>