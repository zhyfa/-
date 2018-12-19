<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">

<title>药品列表页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/>
<style>
ul li {
	list-style-type: none;
	margin: 8px 20px;
}
a {
	text-decoration:none;
}
#first{
float:left;
}
#second{
float:left;
}
</style>
<script>
$(document).ready(function(){
	//搜索药品的二级种类
	//secondType();
});
function secondType() {
	$.ajax({
		url:"<%=basePath%>/drugType/secondType.action",
		type: "POST",
		data:{},
		success : function(res){
			var str="<option value='0'>请选择</option>";
			for(var i=0;i<res.length;i++){
				var r=res[i];
				str+="<option value='"+r.SMALLTYPE_ID+"'>"+r.SMALLTYPE_NAME+"</option>";
			}
			$("#drugSecondType").html(str);
			
		}
		
	});
}

</script>
</head>

<body>
<button onclick="addDrugBefore()">添加药品</button>
<form id="myForm" action="<%=basePath%>/drug/toDrugJSP.action" method="post">
		药品名字：<input type="text" name="drug_name" id="drug_name" value='${requestScope.drug_name}'>&nbsp;
		药品列表：<select id="drugSecondType" name="smalltype_id" >
					<option value=''>请选择</option>
					<c:forEach items="${requestScope.secondType}" var="f">
						<option value="${f.SMALLTYPE_ID}" <c:if test="${f.SMALLTYPE_ID==requestScope.smalltype_id}">selected='true'</c:if> >${f.SMALLTYPE_NAME}</option>
					</c:forEach>
				</select>&nbsp;
		药品功能：<input type="text" name="illustrate" id="illustrate" value="${requestScope.illustrate}">&nbsp;
		<input type="submit" value="搜索"><br />
</form>
	<table border="1" width="80%">
		<caption>药品列表</caption>
		<thead>
			<th>序号</th>
			<th>药品名称</th>
			<th>药品所属类别</th>
			<th>规格（包装）</th>
			<th>单位</th>
			<th>总量</th>
			<th>单价（元）</th>
			<th>折扣（100%）</th>
			<th>是否特殊药</th>
			<th>用量</th>
			<th>药的别名</th>
			<th>症状</th>
			<th>保质期（月）</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.druges}" var="d" varStatus="st">
				<tr>
					<td>${st.count }</td>
					<td>${d.DRUG_NAME }</td>
					<td>${d.SMALLTYPE_NAME }</td>
					<td>
						${d.SPEC==1?'盒':'瓶'}
					</td>
					<td>${d.DRUG_UNIT}</td>
					<td>${d.DRUG_SIZE}</td>
					<td>${d.PRICE}</td>
					<td>${d.DISCOUNT}</td>
					<td>${d.PSYCHOTROPICS}</td>
					<td>${d.USE_METHOD}</td>
					<td>${d.DRUG_ALIAS}</td>
					<td>${d.ILLUSTRATE}</td>
					<td>${d.IRRADIATED}</td>
					<td>
						<a href="#" onclick="toUpdateDrugJSP(${d.DRUG_ID})">修改</a> 
						<a href="#" onclick="delDrug(${d.DRUG_ID})">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		一共有：${requestScope.page.count}条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=1&drug_name=${requestScope.drug_name}&smalltype_id=${requestScope.smalltype_id}&illustrate=${requestScope.illustrate}">首页</a>&nbsp;
		<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${requestScope.page.pre}&drug_name=${requestScope.drug_name}&smalltype_id=${requestScope.smalltype_id}&illustrate=${requestScope.illustrate}">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages}" var="prePage">
			<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${prePage}&roleName=${requestScope.roleName}">${prePage}</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page}</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages}" var="nextPage">
			<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${nextPage}&">${nextPage}</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${requestScope.page.next}&drug_name=${requestScope.drug_name}&smalltype_id=${requestScope.smalltype_id}&illustrate=${requestScope.illustrate}">下一页</a>&nbsp;
		<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${requestScope.page.all}&drug_name=${requestScope.drug_name}&smalltype_id=${requestScope.smalltype_id}&illustrate=${requestScope.illustrate}">末页</a>&nbsp;
	
</body>
<script>
function addDrugBefore(){
	window.location.href="<%=basePath%>/drug/toAddDrugJSP.action";
}
function toUpdateDrugJSP(drug_id){
	//alert(drug_id);
	window.location.href="<%=basePath%>/drug/toUpdateDrugJSP.action?drug_id="+drug_id;
	window.event.returnValue=false;
}
function delDrug(drug_id){
	if(window.confirm('确定要删除吗')){
			$.ajax({
				url:"<%=basePath%>/drug/delDrug.action",
				type: "POST",
				data:{"drug_id":drug_id},
				async:false,
				success : function(res){
					if(res=='0'){
						alert("删除成功");
					}else{
						alert("删除失败");
					}
					//跳回药品种类列表页
					window.location.href="<%=basePath%>/drug/toDrugJSP.action";
				}
			});
	}
}


</script>
</html>
