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
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<style>
#myForm input{width:200px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;}
#myForm select{width:200px;height:35px;border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;}
#tb1{width:100%;margin-top:30px}
#td1{text-align:left;font-size:26px}
#td2{text-align:right; padding-right:15px}
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
	<table id="tb1">
		<tr>
			<td id="td1">药品列表</td>
			<td id="td2"><button class="layui-btn" onclick="addDrugBefore()"><i class="layui-icon">&#xe608;</i>添加药品</button> </td>
		</tr>
	</table>
<!-- <button class="layui-btn" onclick="addDrugBefore()">添加药品</button> -->
<form id="myForm" action="<%=basePath%>/drug/toDrugJSP.action" method="post">
		药品名字：<input type="text" name="drug_name" id="drug_name" value='${requestScope.drug_name}'>&nbsp;
		药品列表：<select id="drugSecondType" name="smalltype_id" >
					<option value=''>请选择</option>
					<c:forEach items="${requestScope.secondType}" var="f">
						<option value="${f.SMALLTYPE_ID}" <c:if test="${f.SMALLTYPE_ID==requestScope.smalltype_id}">selected='true'</c:if> >${f.SMALLTYPE_NAME}</option>
					</c:forEach>
				</select>&nbsp;
		药品功能：<input type="text" name="illustrate" id="illustrate" value="${requestScope.illustrate}">&nbsp;
		<input class="layui-btn" type="submit" value="搜索" style="width:80px"><br />
</form>
	<table class="layui-table">
		<%-- <caption>药品列表</caption> --%>
		<thead>
			<th>序号</th>
			<th>药品名称</th>
			<th>药品所属类别</th>
			<th>规格（包装）</th>
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
					<td>${d.DRUG_SIZE}${d.DRUG_UNIT}/${d.SPEC==1?'盒':'瓶'}</td>
					<td>${d.PRICE}</td>
					<td>${d.DISCOUNT}</td>
					<td>${d.PSYCHOTROPICS}</td>
					<td>${d.USE_METHOD}</td>
					<td>${d.DRUG_ALIAS}</td>
					<td>${d.ILLUSTRATE}</td>
					<td >${d.IRRADIATED}</td>
					<td width="150px">
						<button class="layui-btn layui-btn-xs" onclick="toUpdateDrugJSP(${d.DRUG_ID})"><i class="layui-icon">&#xe642;</i>修改</button> 
						<button class="layui-btn layui-btn-xs layui-btn-danger" onclick="delDrug(${d.DRUG_ID})"><i class="layui-icon">&#xe640;</i>删除</button>
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
			<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${prePage}">${prePage}</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page}</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages}" var="nextPage">
			<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${nextPage}&">${nextPage}</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${requestScope.page.next}&drug_name=${requestScope.drug_name}&smalltype_id=${requestScope.smalltype_id}&illustrate=${requestScope.illustrate}">下一页</a>&nbsp;
		<a href="<%=basePath%>/drug/toDrugJSP.action?pageIndex=${requestScope.page.all}&drug_name=${requestScope.drug_name}&smalltype_id=${requestScope.smalltype_id}&illustrate=${requestScope.illustrate}">末页</a>&nbsp;
	
</body>
<script>
function addDrugBefore(auditsdetail_id){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2
      ,title: '增加药品'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/drug/toAddDrugJSP.action'
     
    });
  }
<%-- function addDrugBefore(){
	window.location.href="<%=basePath%>/drug/toAddDrugJSP.action";
} --%>

function toUpdateDrugJSP(drug_id){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2
      ,title: '更新药品信息'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/drug/toUpdateDrugJSP.action?drug_id='+drug_id
     
    });
  }
<%-- function toUpdateDrugJSP(drug_id){
	//alert(drug_id);
	window.location.href="<%=basePath%>/drug/toUpdateDrugJSP.action?drug_id="+drug_id;
	window.event.returnValue=false;
} --%>
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
