<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
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
caption{font-size:24px}
</style>
</head>
<body>
	<table class="layui-table">
		<caption>药库设置药品最低库存量</caption>
		<thead>
			<tr>
				<th>序号</th>
				<th>药品id</th>
				<th>药品名字</th>
				<th>大类别名字</th>
				<th>小类别名字</th>
				<th>规格</th>
				<th>价格</th>
				<th>最低库存量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.drugs }" var="drug" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr>
					<td>${st.count }</td>
					<td>${drug.drug_id }</td>
					<td>${drug.drug_name }</td>
					<td>${drug.bigtype_name }</td>
					<td>${drug.smalltype_name }</td>
					<td>${drug.drug_size }${drug.drug_unit}/${drug.spec==1?'盒':'瓶' }</td>
					<td>${drug.price }元/盒</td>
					<td>${drug.stock_min }${drug.spec==1?'盒':'瓶' }</td>
					<td><button class="layui-btn"  onclick="updateStockMinBefore(${drug.drug_id })"><i class="layui-icon ">&#xe642;</i>设置最低库存</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/drug/stock_min.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/drug/stock_min.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/drug/stock_min.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/drug/stock_min.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/drug/stock_min.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/drug/stock_min.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>

</body>
<script type="text/javascript">
function updateStockMinBefore(drug_id){
<%-- 	<%=basePath%>/drug/updateStockMinBefore.action?drug_id=drug_id --%>
	// var that = this; 
	//多窗口模式，层叠置顶
	layer.open({
		  type: 2 //此处以iframe举例
		  ,title: '设置药库低限'
		  ,area: ['600px', '450px']
		  ,shade: 0
		  ,maxmin: true
		  ,content:'<%=basePath%>/drug/updateStockMinBefore.action?drug_id='+drug_id
		});
	}
</script>
</html>