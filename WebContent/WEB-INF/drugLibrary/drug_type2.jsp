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

<title>药品类别页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
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
$(document).ready(function(){
	//secondType();
});
//二级目录
function  secondType(bigtype_id){
	$.ajax({
		url:"<%=basePath%>/drugType/secondType.action",
		type: "POST",
		data:{},
		success : function(res){
			var str='';
			for(var i=0;i<res.length;i++){
				var r=res[i];
				str+="<tr><td>"+r.SMALLTYPE_ID+"</td><td>"+r.SMALLTYPE_NAME+"</td><td>"+r.BIGTYPE_NAME+"</td><td><input type='button' value='修改' onclick='updateSmallType("+r.SMALLTYPE_ID+")'><input type='button' value='删除' onclick='delSmallType("+r.SMALLTYPE_ID+")'></td></tr>";
			}
			$("#secondType").html(str);
			
		}
		
	});
}


</script>
</head>

<body>
<input type="button" value="新增一级药品种类" onclick="addFirstTypeBefor()">
<input type="button" value="新增二级药品种类" onclick="addSecondTypeBefor()">
<table class="table table-bordered">
	<caption>药品种类列表</caption>
	<thead>
		<th>药品二级种类ID</th>
		<th>药品二级类名</th>
		<th>药品所属父类名称</th>
		<th>操作</th>
	</thead>
	<tbody id="secondType">
		<c:forEach items="${requestScope.secondType}" var="s">
			<tr>
				<td>${s.SMALLTYPE_ID}</td>
				<td>${s.SMALLTYPE_NAME}</td>
				<td>${s.BIGTYPE_NAME}</td>
				<td>
					<input type='button' value='修改' onclick='updateSmallType(${s.SMALLTYPE_ID})'>
					<input type='button' value='删除'  onclick='delSmallType(${s.SMALLTYPE_ID})'>
				</td>
			</tr>
		</c:forEach>
			
	</tbody>
</table>

一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/drugType/toOtherJsp.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/drugType/toOtherJsp.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/drugType/toOtherJsp.action?pageIndex=${prePage}">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page}</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages}" var="nextPage">
			<a href="<%=basePath%>/drugType/toOtherJsp.action?pageIndex=${nextPage }&">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/drugType/toOtherJsp.action?pageIndex=${requestScope.page.next}">下一页</a>&nbsp;
		<a href="<%=basePath%>/drugType/toOtherJsp.action?pageIndex=${requestScope.page.all}">末页</a>&nbsp;



<input type="button" value="返回" onclick="javascript:history.back(-1);">

 
</body>
<script>
	function addFirstTypeBefor() {
		window.location.href="<%=basePath%>/drugType/addFirstTypeBefor.action";
	}
	function addSecondTypeBefor() {
		window.location.href="<%=basePath%>/drugType/addSecondTypeBefor.action";
	}
	
	
	//更新一个二级类别
	function updateSmallType(smallTypeId){
		window.location.href="<%=basePath%>/drugType/updateJsp.action?smallTypeId="+smallTypeId;
	}
	//删除一个二级类别
	function delSmallType(smallTypeId){
		if(window.confirm("确定删除该行信息？")){
			$.ajax({
				url:"<%=basePath%>/drugType/delSecondTypeById.action",
				type: "POST",
				data:{"smallTypeId":smallTypeId},
				success : function(res){
					if(res=='0'){
						alert("删除成功");
					}else{
						alert("删除失败");
					}
					//跳回药品种类列表页
					window.location.href="<%=basePath%>/drugType/toOtherJsp.action";
				}
			});
		}	
	}
	

</script>
</html>
