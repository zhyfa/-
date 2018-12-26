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
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>

<style type="text/css">

</style>
</head>
<body>
<body>
	<table class="layui-table">
		<caption>药房设置药品最低存量</caption>
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
				<tr class="warning">
					<td>${st.count }</td>
					<td>${drug.drug_id }</td>
					<td>${drug.drug_name }</td>
					<td>${drug.bigtype_name }</td>
					<td>${drug.smalltype_name }</td>
					<td>${drug.drug_size }${drug.drug_unit}/${drug.spec==1?'盒':'瓶' }</td>
					<td>${drug.price }元/盒</td>
					<td>${drug.inventory_min }${drug.spec==1?'盒':'瓶' }</td>
					<td><button onclick="updateStockMinBefore(${drug.drug_id })">设置最低库存</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/earlyWaring/min.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/earlyWaring/min.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/earlyWaring/min.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/earlyWaring/min.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/earlyWaring/min.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/earlyWaring/min.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
</body>
<script type="text/javascript">
function updateStockMinBefore(drug_id){
<%-- 	<%=basePath%>/drug/updateStockMinBefore.action?drug_id=drug_id --%>
// var that = this; 
//多窗口模式，层叠置顶
layer.open({
  type: 2 //此处以iframe举例
  ,title: '设置药房最底限'
  ,area: ['600px', '450px']
  ,shade: 0
  ,maxmin: true
  
  ,content: '<%=basePath%>/earlyWaring/updatePharmacyMinBefore.action?drug_id='+drug_id
 /*  ,btn: ['关闭本页'] 
  ,btn2: function(){
    layer.closeAll();
  } */
  
  /* ,zIndex: layer.zIndex //重点1
  ,success: function(layero){
    layer.setTop(layero); //重点2
  } */
});
}
</script>
</html>