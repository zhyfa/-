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
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style>
.info{margin-top:20px}
.info input{width:200px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;margin-top:5px}
.info .td{text-align:left;font-size:16px}
#btnSearch{width:70px;}
#addButton{width:90px;}
#page{font-size:16px}
caption{font-size:24px}
</style>
<body>
	<form id="serach" action="<%=basePath%>/parameter/parameterList.action" method="post" onsubmit="return checkForm()">
		<table class="info">
			<tr>
				<td calss="td">参数名字：</td>
				<td><input type="text" name="parameter_name" value="${param.parameter_name}"> 
				</td>
				<td calss="td">参数类型：</td>
				<td><input type="text" name="parameter_type" value="${param.parameter_type}"> 
				</td>
				<td calss="td">参数值：</td>
				<td colspan="2"><input type="text" name="parameter_value" id="parameter_value" value="${param.parameter_value}"> 
					<input type="submit" value="搜索" class="layui-btn" id="btnSearch"> 
					<input type="button" id="addButton"  class="layui-btn" onclick="parameterAdd()" value="新增参数"> 
				</td>
			</tr>
		</table>
	</form>
	<table class="layui-table" >
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
					<td >${st.count }</td>
					<td >${parameter.parameter_id }</td>
					<td >${parameter.parameter_name }</td>
					<td >${parameter.parameter_type }</td>
					<td >${parameter.parameter_value }</td>
					<td >
						<button href="#" class="layui-btn layui-btn-xs" onclick="updateParatemerBefore(${parameter.parameter_id })"><i class="layui-icon">&#xe642;</i>修改</button>
						<button href="#" class="layui-btn layui-btn-danger layui-btn-xs" onclick="delParameter(${parameter.parameter_id })"><i class="layui-icon">&#xe640;</i>删除</button>
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
<%-- function parameterAdd(){
	window.location.href="<%=basePath%>/parameter/intoAddjsp.action";
} --%>

function parameterAdd(){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2 //此处以iframe举例
      ,title: '新增参数'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/parameter/intoAddjsp.action'
    });
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
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2 //此处以iframe举例
      ,title: '修改参数'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/parameter/updateParatemerBefore.action?parameter_id='+parameter_id
    });
  }
<%-- function updateParatemerBefore(parameter_id){
	window.location.href="<%=basePath%>/parameter/updateParatemerBefore.action?parameter_id="+parameter_id;
} --%>
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