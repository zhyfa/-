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

<style type="text/css">

</style>
</head>
<body>
<form id="applyInfo">
	<table class="layui-table">
		<caption>入库单明细</caption>
			<tbody>
			<tr>
				<th>入库单编号</th>
				<td><input type="hidden" id="storge_id" name="storge_id" value="${requestScope.storgeApply.STORGE_ID}" >${requestScope.storgeApply.STORGE_ID}</td>
				<th>申请人</th>
				<td>${requestScope.storgeApply.ADMIN_ID}</td>
				<th>提交时间</th>
				<td>${requestScope.storgeApply.SUBMIT_DATE}</td>
			</tr>
			<tr>
				<th>待入库药品种类</th>
				<td>${requestScope.storgeApply.TYPE_TOTAL}</td>
				<th>待入库数量</th>
				<td>${requestScope.storgeApply.STORGE_TOTAL}</td>
			</tr>
			<tr>
				<th>实入库药品种类</th>
				<td><input type="hidden" id="real_storgetype" value="${requestScope.storgeApply.REAL_STORGETYPE}">${requestScope.storgeApply.REAL_STORGETYPE}</td>
				<th>实入库总量</th>
				<td><input type="hidden" id="real_storgetotal" value="${requestScope.storgeApply.REAL_STORGETOTAL}">${requestScope.storgeApply.REAL_STORGETOTAL}</td>
			</tr>
			</tbody>
		</table>
	</form>
		<table class="layui-table">
			<thead>
				<tr>
					<th>序号</th>
					<th>药品编号</th>
					<th>药品名称</th>
					<th>生产产家</th>
					<th>生产批号</th>
					<th>生产日期</th>
					<th>采购单编号</th>
					<th>采购数量</th>
					<th>待入库数量</th>
					<th>实入库数量</th>
					<th>状态</th>
					<th>数量不同原因</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.detailList }" var="detail" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="active">
					<td>${st.count }</td>
					<input type="hidden" name="storgedetail_id" id="storgedetail_id" value="${detail.STORGEDETAIL_ID}">
					<td>${detail.DRUG_ID}</td>
					<input type="hidden" name="drug_id" id="drug_name" value="${detail.DRUG_ID}">
					<td>${detail.DRUG_NAME}</td>
					<input type="hidden" name="drug_name" id="drug_name" value="${detail.DRUG_NAME}">
					<td>${detail.FACTORY_NAME}</td>
					<input type="hidden" name="factory_name" id="factory_name" value="${detail.FACTORY_NAME}">
					<td>${detail.PRODUCTION_ID}</td>
					<input type="hidden" name="production_id" id="production_id" value="${detail.PRODUCTION_ID}">
					<td>${detail.PRODUCTION_DATE}</td>
					<input type="hidden" name="production_date" id="production_date" value="${detail.PRODUCTION_DATE}">
					<td>${detail.AUDITSDETAIL_ID}</td>
					<input type="hidden" name="auditsdetail_id" id="auditsdetail_id" value="${detail.AUDITSDETAIL_ID}">
					<td>${detail.PLANTOBUY_NUMBER}</td>
					<input type="hidden" name="plantobuy_number" id="plantobuy_number" value="${detail.PLANTOBUY_NUMBER}">
					<td><input type="hidden" id="storge_number" value="${detail.STORGE_NUMBER}">${detail.STORGE_NUMBER}</td>
					<c:if test="${detail.STAT==2}">
						<td><input type="text" name="real_storgeno" id="real_storgeno" style="width:50px;border:0px" onblur="storgeIn(${detail.STORGEDETAIL_ID})"></td>
						<td>${detail.PARAMETER_NAME}</td>
						<td><textarea cols="10" style="border:0px" type="text" name="reasonfor_varity" id="reasonfor_varity"></textarea></td>
						<td><textarea cols="10" style="border:0px" type="text" name="notes" id="notes"></textarea></td>
						<%-- <td>	
								<input type="button" value="入库" onclick="storgeIn(${detail.STORGEDETAIL_ID})" >
								<input type="button" value="驳回" onclick="storgeReturn(${detail.STORGEDETAIL_ID})" >
						</td> --%>
					</c:if>
					<c:if test="${detail.STAT!=2}">
						<td>${detail.REAL_STORGENO}</td>
						<td>${detail.PARAMETER_NAME}</td>
						<td>${detail.REASONFOR_VARITY}</td>
						<td>${detail.NOTES}</td>
						<td></td>
					</c:if>
				</tr>
			</c:forEach>
			<tr><button class="layui-btn" onclick="submitStock(${requestScope.storgeApply.STORGE_ID})">入库完成</button></tr>
			</tbody>
	</table>
	</form>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/storge/storgeApplyDetail.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/storge/storgeApplyDetail.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/storge/storgeApplyDetail.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/storge/storgeApplyDetail.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/storge/storgeApplyDetail.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/storge/storgeApplyDetail.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
	
</body>
<script type="text/javascript">
function storgeIn(storgedetail_id){
	
	/* var real_storgetype = $("#real_storgetype").val();
	var real_storgetotal = $("#real_storgetotal").val(); */
	
	$.ajax({
		url:"<%=basePath%>/storge/checkAndStorge.action",
		type: "POST",
		data:{
			"storgedetail_id":storgedetail_id,
			"real_storgeno":$("#real_storgeno").val(),
			"reasonfor_varity":$("#reasonfor_varity").val(),
			"notes":$("#notes").val(),
			"real_storgetype":$("#real_storgetype").val(),
			"real_storgetotal":$("#real_storgetotal").val(),
			},
			success : function(res){
			if(res=='0'){
				alert("入库成功");
			}else{
				alert("入库失败");
			}
			<%-- var storge_id = $("#storge_id").val();
			window.location.href="<%=basePath%>/storge/storgeApplyDetail.action?storge_id="+storge_id --%>
				
		}
	});
}
 function submitStock(storge_id){
	 $.ajax({
			url:"<%=basePath%>/storge/submitStock.action",
			type: "POST",
			data:{
				"storge_id":storge_id,
				},
				success : function(res){
				if(res=='0'){
					alert("提交成功");
				}else{
					alert("提交失败");
				}
				var storge_id = $("#storge_id").val();
				window.location.href="<%=basePath%>/storge/drugStorge.action"
			}
		});
 }

</script>
</html>