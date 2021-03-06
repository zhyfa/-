<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
caption{font-size:24px}
#title{font-size:26px;text-align:left}
#btnImport{text-align:right;padding-right:30px}
</style>
<body>
<table width="100%" style="margin-top:40px">
	<tr>
	<td id="title">审核报损</td>
	<td id="btnImport">
	<button class="layui-btn " onclick="createReturnBackForm()" ${inventory.state!=7?'hidden':'' }><i class="layui-icon ">&#xe609;</i>导出</button>
	</td>
	</tr>
</table>
<table class="layui-table">
	
	<thead>
		<th>序号</th>
		<th>报损id</th>
		<th>药房库存id</th>
		<th>药品名字</th>
		<th>报损说明</th>
		<th>报损数量</th>
		<th>创建日期</th>
		<th>状态</th>
		<th>操作</th>
	</thead>
	<tbody>
			<c:forEach items="${requestScope.reimburses }" var="reimburse" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="success">
					<td>${st.count }</td>
					<td>${reimburse.reimburse_id }</td>
					<td>${reimburse.inventory_id }</td>
					<td>${reimburse.drug_name }</td>
					<td>${reimburse.illustrate }</td>
					<td>${reimburse.reimburse_num }</td>
					<td>${reimburse.cdate }</td>
					<td>${reimburse.parameter_name }</td>
					<td>
						<input type="button" value="同意" class="layui-btn layui-btn-xs" onclick="badDrugPass(${reimburse.reimburse_id },${reimburse.inventory_id },${reimburse.reimburse_num })" ${reimburse.state!=1?'hidden':'' } >
						<input type="button" value="驳回" class="layui-btn layui-btn-xs layui-btn-danger" onclick="badDrugNotPass(${reimburse.reimburse_id },${reimburse.inventory_id },${reimburse.reimburse_num })"  ${reimburse.state!=1?'hidden':''} >
					</td>
				</tr>
			</c:forEach>
		</tbody>
		
</table>
<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/daily/badDrugCheck.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/daily/badDrugCheck.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/daily/badDrugCheck.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/daily/badDrugCheck.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/daily/badDrugCheck.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a href="<%=basePath%>/daily/badDrugCheck.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
<%-- ${requestScope.inventorys } --%>
<%-- ${requestScope.page } --%>
</body>
<script type="text/javascript">
function badDrugPass(reimburse_id,inventory_id,reimburse_num){
	if(confirm("确认同意报损嘛？")){
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/badDrugPass.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id,"reimburse_id":reimburse_id,"reimburse_num":reimburse_num},
			success : function(res) {
				if(res==1){
					alert("通过报损");
					window.location.href="<%=basePath%>/daily/badDrugCheck.action";
				}else{
					alert("通过报损失败");
				}
			}
		});
	}
	
}
function badDrugNotPass(reimburse_id,inventory_id,reimburse_num){
	if(confirm("确认驳回申请嘛？")){
		$.ajax({
			type: "post",
			url : "<%=basePath%>/daily/badDrugNotPass.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id,"reimburse_id":reimburse_id,"reimburse_num":reimburse_num},
			success : function(res) {
				if(res==1){
					alert("驳回成功");
					window.location.href="<%=basePath%>/daily/badDrugCheck.action";
				}else{
					alert("驳回失败");
				}
			}
		});
	}
}

</script>
</html>