<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<table border="1">
	<caption>药房退库</caption>
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
			<tr>
				<td>${st.count }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.drug_size }${inventory.drug_unit }/${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.inventory_number==null?0:inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>
					<button onclick="returnBack(${inventory.drug_id })">退库</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/daily/returnBack.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/daily/returnBack.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/daily/returnBack.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/daily/returnBack.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/daily/returnBack.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a href="<%=basePath%>/daily/returnBack.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
<%-- ${requestScope.inventorys } --%>
</body>
<script type="text/javascript">
	function returnBack(drug_id){
		window.location.href="<%=basePath%>/daily/getInventorys.action?drug_id="+drug_id;
	}
</script>
</html>