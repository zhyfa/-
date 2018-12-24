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
	top: 400px;
}
</style>
</head>
<body>
	<table border="1" width="80%" align="center" class="table">
		<caption>采购单审核列表</caption>
		<thead>
			<tr>
				<th>序号</th>
				<th>审核单标号</th>
				<th>申请人</th>
				<th>申购数量</th>
				<th>总价</th>
				<th>提交时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.purchaseList }" var="purchase" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="checkAudits">
					<td>${st.count }</td>
					<td>${purchase.AUDITSDETAIL_ID}</td>
					<td>${purchase.ADMIN_NAME}</td>
					<td>${purchase.PHARMARY_NUMBER}</td>
					<td>${purchase.PHARMARY_TOTAL}</td>
					<td>${purchase.PURCHASE_DATE}</td>
					<td>${purchase.PARAMETER_NAME}</td>
					<td>
						<c:if test="${purchase.STAT==2}">
						<input type="button" value="同意" onclick="passPurchase(${purchase.AUDITSDETAIL_ID})" >
						<input type="button" value="驳回" onclick="returnPurchase(${purchase.AUDITSDETAIL_ID})" >
						</c:if>
						<input type="button" value="查看详情" onclick="PurchaseDetail(${purchase.AUDITSDETAIL_ID})" >
						<input type="button" value="删除" onclick="deletesPurchase(${purchase.AUDITSDETAIL_ID})" >
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/stock/apurchaseUpdate.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/stock/apurchaseUpdate.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/stock/apurchaseUpdate.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/stock/apurchaseUpdate.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/stock/apurchaseUpdate.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/stock/apurchaseUpdate.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
	<%-- 		${requestScope.drugs } --%>
	<%-- ${requestScope.page } --%>
</body>
<script type="text/javascript">
function PurchaseDetail(auditsdetail_id){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2
      ,title: '查看采购详情'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/stock/PurchaseDetail.action?auditsdetail_id='+auditsdetail_id
     
    });
  }
  function returnPurchase(auditsdetail_id){
	  if(confirm("是否驳回该采购申请？")){
	  $.ajax({
			url:"<%=basePath%>/stock/returnPurchase.action",
			type: "POST",
			data:{
				"auditsdetail_id":auditsdetail_id,
				},
				success : function(res){
				if(res=='0'){
					alert("驳回成功");
				}else{
					alert("驳回失败");
				}
				window.location.href="<%=basePath%>/stock/apurchaseUpdate.action"
			}
		});
	  }
  }
  function passPurchase(auditsdetail_id){
	  if(confirm("确认同意该采购申请吗？")){
	  $.ajax({
			url:"<%=basePath%>/stock/passPurchase.action",
			type: "POST",
			data:{
				"auditsdetail_id":auditsdetail_id,
				},
				success : function(res){
				if(res=='0'){
					alert("已同意该审批！");
				}else{
					alert("审批失败！");
				}
				window.location.href="<%=basePath%>/stock/apurchaseUpdate.action"
			}
		});
	  }
  }
</script>
</html>