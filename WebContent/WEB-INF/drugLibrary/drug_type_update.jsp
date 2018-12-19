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

<title>修改药品类别页面</title>
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
	margin: 8px 0;
}
a {
	text-decoration:none;
}
</style>
<script>

</script>
</head>

<body>
<div>
	ID:<input type="text" value="${requestScope.drugType.SMALLTYPE_ID}" id="sId" name="sId" readonly="readonly">
	<br />
	名称：<input type="text" value="${requestScope.drugType.SMALLTYPE_NAME}" id="sName" name="sName">
	<br />
<!-- 		下拉框的默认显示值是该药品的所属类别 -->
	所属类别:<select id="bId" name="bId">
				<c:forEach items="${requestScope.firstMenu}" var="f">
					<option value="${f.BIGTYPE_ID}" <c:if test="${f.BIGTYPE_ID==requestScope.drugType.FATHER_ID}">selected='true'</c:if>
					>${f.BIGTYPE_NAME}</option>
				</c:forEach>
			</select>
	<br />
	<input type="button" onclick="update()" value="确定">
	<input type="button" value="返回" onclick="javascript:history.back(-1);">
</body>
<script>
function update() {
	$.ajax({
			url:"<%=basePath%>/drugType/updateSecondDrugType.action",
			type: "POST",
			data:{"smalltypeName":$("#sName").val(),"fatherId":$("#bId").val(),"samlltypeId":$("#sId").val()},
			success : function(res){
				if(res=='0'){
					alert("修改成功");
				}else{
					alert("修改失败");
				}
				//跳回药品种类列表页
				window.location.href="<%=basePath%>/drugType/toOtherJsp.action";
			}
		});
}
	
</script>
</html>
