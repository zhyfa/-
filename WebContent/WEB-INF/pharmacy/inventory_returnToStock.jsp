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

<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="shortcut icon" href="<%=basePath%>/assets/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<body>
<button class="layui-btn" onclick="javascript:history.back(-1);"><i class="layui-icon">&#xe65c;</i>返回</button>
<table class="layui-table">
	<caption></caption>
	<thead>
		<th>序号</th>
		<th>药房库存id</th>
		<th>药品id</th>
		<th>药品名字</th>
		<th>生产日期</th>
		<th>数量</th>
		<th>状态</th>
		<th>创建日期</th>
		<th>操作</th>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.inventorys }" var="inventory" varStatus="st">
			<!-- var demo = {"active","success","warning","danger"}; -->
			<tr class="active">
				<td>${st.count }</td>
				<td>${inventory.inventory_id }</td>
				<td>${inventory.drug_id }</td>
				<td>${inventory.drug_name }</td>
				<td>${inventory.production_date }</td>
				<td>${inventory.inventory_number }${inventory.spec==1?'盒':'瓶' }</td>
				<td>${inventory.parameter_name }</td>
				<td>${inventory.cdate }</td>
				<td>
					<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="returnBackToStockRequest(${inventory.inventory_id },${inventory.drug_id },${inventory.inventory_number },'${inventory.production_date }')"  ${inventory.state!=1?'hidden':'' }><i class="layui-icon">&#xe66c;</i>退库</button>
					<button class="layui-btn layui-btn-xs" onclick="createReturnBackForm()" ${inventory.state!=4?'hidden':'' }><i class="layui-icon">&#xe609;</i>导出</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%-- ${requestScope.inventorys } --%>
</body>
<script type="text/javascript">
function returnBackToStockRequest(inventory_id,drug_id,inventory_number,production_date){
	var drug_number = prompt('输入退库数量：', 1);
	var reg = /^[0-9]*$/;
	if(drug_number==null){
		return false;
	}
	if(drug_number>inventory_number){
		alert("大于剩余库存");
		return false;
	}
	if(drug_number.length>20 || drug_number=="" || drug_number==0){
		alert("输入错误,请输入数字");
		return false;
	}
	if(!reg.test(drug_number)){
		alert("请输入数字");
		return false;
	}
	var illustrate = prompt('输入退库说明：', '卖不出去');
	if(illustrate==null){
		return false;
	}
		$.ajax({
			type : "post",
			url : "<%=basePath%>/daily/returnBackToStockRequest.action",
			//contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			data : {"inventory_id":inventory_id,"drug_id":drug_id,"drug_number":drug_number,"birthday":production_date,"illustrate":illustrate},
			success : function(res) {
				if(res==1){
					alert("申请成功");
					window.location.href="<%=basePath%>/daily/getInventorys.action?drug_id="+drug_id;
				}else{
					alert("申请失败");
				}
			}
		});
	
}
function createReturnBackForm(){
	alert("111");
}
</script>
</html>