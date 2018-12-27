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

<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="shortcut icon" href="<%=basePath%>/assets/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>

<style type="text/css">
#tb1{margin-top:30px;width:100%}
#td1{text-align:left;font-size:24px}
#td2{text-align:right;padding-right:15px}
</style>
</head>
<body>
<table id="tb1">
	<tr>
		<td id="td1">药房退库</td>
		<td id="td2"><a class="layui-btn" href="<%=basePath%>/daily/returnBackList.action"><i class="layui-icon">&#xe63c;</i>退库申请详情</a></td>
	</tr>
</table>
<table  class="layui-table">
	<%-- <caption>药房退库</caption> --%>
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
			<tr class="active">
				<td>${st.count }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.drug_size }${inventory.drug_unit }/${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.inventory_number==null?0:inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>
					<button class="layui-btn layui-btn-xs layui-btn-danger" onclick="returnBack(${inventory.drug_id })"><i class="layui-icon">&#xe66c;</i>退库</button>
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