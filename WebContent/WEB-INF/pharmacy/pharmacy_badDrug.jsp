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
<a href="<%=basePath%>/daily/badDrugList.action">报损详情</a>
<table border="1" class="table">
	<caption>药房报损</caption>
	<thead>
		<tr>
			<th>序号</th>
			<th>药品id</th>
			<th>药品名字</th>
			<th>规格</th>
			<th>药品数量</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.inventorys }" var="inventory" varStatus="st">
			<!-- var demo = {"active","success","warning","danger"}; -->
			<tr class="danger">
				<td>${st.count }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.drug_size }${inventory.drug_unit }/${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.inventory_number==null?0:inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>
					<button onclick="returnBack(${inventory.drug_id })">报损</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/daily/badDrug.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/daily/badDrug.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/daily/badDrug.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/daily/badDrug.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/daily/badDrug.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a href="<%=basePath%>/daily/badDrug.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
<%-- ${requestScope.inventorys } --%>
</body>
<script type="text/javascript">
	function returnBack(drug_id){
		window.location.href="<%=basePath%>/daily/badDrugRequestBefore.action?drug_id="+drug_id;
	}
</script>
</html>