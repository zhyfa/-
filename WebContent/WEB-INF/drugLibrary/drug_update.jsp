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

<title>修改药品信息页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
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
});


</script>
</head>

<body>
<form id="myForm">
<input type="hidden" name="drug_id" id="drug_id" value="${requestScope.drug.DRUG_ID}">
		药品名称： <input type="text" name="drug_name" id="drug_name" value="${requestScope.drug.DRUG_NAME}"><br>
		药品所属类别：<select name="smalltype_id">
						<c:forEach items="${requestScope.secondType}" var="s">
							<option value="${s.SMALLTYPE_ID}" <c:if test="${s.SMALLTYPE_ID==requestScope.drug.SMALLTYPE_ID}">selected='true'</c:if> >${s.SMALLTYPE_NAME}</option>
						</c:forEach>
				  </select><br>
		规格：<select name="spec">
				<option value="2" selected=${requestScope.drug.SPEC}==2?'true':'false'>瓶</option>
				<option value="1" selected=${requestScope.drug.SPEC}==1?'true':'false' >盒</option>		
			</select><br>
		单位：<select name="drug_unit">
				<option value="颗" ${requestScope.drug.DRUG_UNIT=='颗'?'selected':''}>颗</option>
				<option value="包" ${requestScope.drug.DRUG_UNIT=='包'?'selected':''}>包</option>
				<option value="付" ${requestScope.drug.DRUG_UNIT=='付'?'selected':''}>付</option>
				<option value="毫升" ${requestScope.drug.DRUG_UNIT=='毫升'?'selected':''}>毫升</option>		
			</select><br>
		总量：<input type="text" name="drug_size" id="drug_size" value="${requestScope.drug.DRUG_SIZE}"><br>
		单价（元）：<input type="text" name="price" id="price" value="${requestScope.drug.PRICE}"><br>
		折扣（100%）：<input type="text" name="discount" id="discount" value="${requestScope.drug.DISCOUNT}"><br>
		是否特殊药：<select name="psychotropics">
					<option value="是特殊药" selected=${requestScope.drug.PSYCHOTROPICS}==是特殊药?'true':'false'>是特殊药</option>
					<option value="不是特殊药" selected=${requestScope.drug.PSYCHOTROPICS}==不是特殊药?'true':'false'>不是特殊药</option>		
				</select><br>
		用量：<input type="text" name="use_method" id="use_method" value="${requestScope.drug.USE_METHOD}"><br>
		药的别名：<input type="text" name="drug_alias" id="drug_alias" value="${requestScope.drug.DRUG_ALIAS}"><br>
		症状：<input type="text" name="illustrate" id="illustrate" value="${requestScope.drug.ILLUSTRATE}"><br>
		保质期（月）：<input type="text" name="irradiated" id="irradiated" value="${requestScope.drug.IRRADIATED}"><br>
		<input type="button" value="确认修改" onclick="submitForm()">
		<input type="button" value="返回" onclick="javascript:history.back(-1);">
	</form>
</body>
<script>
function submitForm(){
	$.ajax({
		url : "<%=basePath%>/drug/updateDrug.action",
		type: "POST",
		data:JSON.stringify($("#myForm").serializeJSON()),
		contentType:"application/json",
		dataType:"json",
		success : function(res) {
			if(res==0){
				alert("修改成功");
			}
			if(res==1){
				alert("修改失败");
			}
			//添加成功或是失败都需要跳回列表页
			window.location.href="<%=basePath%>/drug/toDrugJSP.action";
		}
	});
}

</script>
</html>
