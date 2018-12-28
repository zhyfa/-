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
<link rel="shortcut icon" href="<%=basePath%>/assets/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style>
#tb1{margin-top:30px;width:100%}
#td1{text-align:left;font-size:24px}
#td2{text-align:right;padding-right:15px}
</style>
<body>
<table id="tb1">
	<tr>
		<td id="td1">药品报损</td>
		<td id="td2"><button class="layui-btn" onclick="javascript:history.back(-1);"> <i class="layui-icon">&#xe65c;</i>返回</button></td>
	</tr>
</table>

<table  class="layui-table">
	<%-- <caption>报损</caption> --%>
	<thead>
		<th>序号</th>
		<th>药房库存id</th>
		<th>药品id</th>
		<th>药品名字</th>
		<th>生产日期</th>
		<th>数量</th>
		<th>状态</th>
<!-- 		<th>创建日期</th> -->
		<th>操作</th>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.inventorys }" var="inventory" varStatus="st">
			<!-- var demo = {"active","success","warning","danger"}; -->
			<tr class="danger">
				<td>${st.count }</td>
				<td>${inventory.inventory_id }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.production_date }</td>
				<td>${inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.parameter_name }</td>
<%-- 				<td>${inventory.cdate }</td> --%>
				<td>
					<button class="layui-btn layui-btn-xs layui-btn-danger" onclick="returnBackToStockRequest(${inventory.inventory_id },${inventory.drug_id },${inventory.inventory_number })"  ${inventory.state!=1?'hidden':'' }> <i class="layui-icon">&#xe69c;</i>报损</button>
					<button class="layui-btn layui-btn-xs" onclick="createReturnBackForm()" ${inventory.state!=7?'hidden':'' }> <i class="layui-icon">&#xe609;</i>导出</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- ${requestScope.inventorys } --%>
</body>
<script type="text/javascript">
function returnBackToStockRequest(inventory_id,drug_id,inventory_number){
	var reimburse_num = prompt('输入报损数量：', 1);
	if(reimburse_num==null){
		return false;
	}
	var reg = /^[0-9]*$/;
	if(!reg.test(reimburse_num) ){
		alert("请输入数字");
		return false;
	}
	if(reimburse_num.length>20 || reimburse_num=="" || reimburse_num==undefined || reimburse_num==0){
		alert("输入错误，请重新输入");
		return false;
	}
	if(reimburse_num>inventory_number){
		alert("大于剩余值");
		return false;
	}
	var illustrate = prompt('输入报损说明：', '损坏');
	if(illustrate==null){
		return false;
	}
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/badDrugRequest.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id,"reimburse_num":reimburse_num,"illustrate":illustrate,"drug_id":drug_id},
			success : function(res) {
				alert(res);
				if(res==1){
					alert("报损成功");
					window.location.href="<%=basePath%>/daily/badDrugRequestBefore.action?drug_id="+drug_id;
				}else{
					alert("报损失败");
				}
			}
		});
	
}
function createReturnBackForm(){
	alert("111");
}
</script>
</html>