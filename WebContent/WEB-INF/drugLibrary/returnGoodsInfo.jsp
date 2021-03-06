<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
<style type="text/css">
caption{font-size:24px};
</style>
<body>
<!--  -->
<a href="<%=basePath%>/stock/return.action">返回</a>
	<table class="layui-table">
	<caption>药库退药详情</caption>
		<thead>
			<tr>
				<th>序号</th>
				<td>药库库存id</td>
				<td>药品名字</td>
				<td>退货数量</td>
				<td>退货日期</td>
				<td>供应商</td>
				<td>状态</td>
				<td>操作</td>
			<tr></tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.returnGoods }" var="returnGood" varStatus="st">
				<tr class="active">
					<td >${st.count }</td>
					<td >${returnGood.stock_id }</td>
					<td >${returnGood.drug_name }</td>
					<td >${returnGood.stock_number }</td>
					<td >${returnGood.return_date }</td>
					<td >${returnGood.factory_name }</td>
					<td >${returnGood.parameter_name }</td>
					<td >
						<input type="button" value="撤回" onclick="revokeReturnGood(${returnGood.stock_id })">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/stock/returnGoodsInfo.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/stock/returnGoodsInfo.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/stock/returnGoodsInfo.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/stock/returnGoodsInfo.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/stock/returnGoodsInfo.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a href="<%=basePath%>/stock/returnGoodsInfo.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
<%-- ${requestScope.returnGoods } --%>
</body>
<script type="text/javascript">
function revokeReturnGood(stock_id){
	if(confirm("确认撤销退货嘛？")){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/stock/revokeReturnGood.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"stock_id":stock_id},
			success : function(res) {
				if(res==1){
					alert("撤销成功");
					window.location.href="<%=basePath%>/stock/returnGoodsInfo.action";
				}else{
					alert("撤销失败");
				}
			}
		});
	}
}
</script>
</html>