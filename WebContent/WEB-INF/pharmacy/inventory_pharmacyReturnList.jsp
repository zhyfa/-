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

<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>

<style type="text/css">
#page {
	position: absolute;
	left: 200px;
	top: 350px;
}
</style>
</head>
<body>

<a href="<%=basePath%>/daily/returnBack.action">返回</a>
	<table border="1" width="80%" align="center" class="table">
		<caption>报损详情</caption>
		<thead>
			<tr>
				<th>序号</th>
				<th>药房退药id</th>
				<th>药库库存id</th>
				<th>药名</th>
				<th>退库人</th>
				<th>退库数量</th>
				<th>退库说明</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.pharmacyReturns }" var="pharmacyReturn" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr>
					<td>${st.count }</td>
					<td>${pharmacyReturn.pharmacy_return_id }</td>
					<td>${pharmacyReturn.inventory_id }</td>
					<td>${pharmacyReturn.drug_name }</td>
					<td>${pharmacyReturn.admin_name }</td>
					<td>${pharmacyReturn.drug_number }</td>
					<td>${pharmacyReturn.illustrate }</td>
					<td>${pharmacyReturn.parameter_name }</td>
					<td>
						<button onclick="revokeRequest(${pharmacyReturn.pharmacy_return_id },${pharmacyReturn.inventory_id },${pharmacyReturn.drug_number })" ${pharmacyReturn.state!=1?'hidden':'' }>撤回申请</button>
						<button onclick="createReturnBackForm()" ${pharmacyReturn.state==1?'hidden':'' }>生成水印单</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/daily/returnBackList.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/daily/returnBackList.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/daily/returnBackList.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/daily/returnBackList.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/daily/returnBackList.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/daily/returnBackList.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
	
<%-- 	${requestScope.pharmacyReturns } --%>
</body>
<script type="text/javascript">
function revokeRequest(pharmacy_return_id,inventory_id,drug_number){
	var result = confirm('是否撤销？');
	if(result==false){
		return false;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/daily/revokeRequestReturnBack.action",
		//contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		data : {"pharmacy_return_id":pharmacy_return_id,"inventory_id":inventory_id,"drug_number":drug_number},
		success : function(res) {
			if(res==1){
				alert("撤销成功");
				window.location.href="<%=basePath%>/daily/returnBackList.action";
			}else{
				alert("撤销失败");
			}
		}
	});
}
</script>
</html>