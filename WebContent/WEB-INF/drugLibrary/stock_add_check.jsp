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
<input type="button" id="storgeApply" name="storgeApply" value="创建入库申请表" onclick="toNewApply()">
<body>
	<table border="1" width="80%" align="center" class="table">
		<caption>入库审核列表</caption>
		<thead>
			<tr>
				<th>序号</th>
				<th>入库单编号</th>
				<th>申请人</th>
				<th>药品种类</th>
				<th>入库数量</th>
				<th>提交时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.StorgeApplyList }" var="storgeApply" varStatus="st">
				<!-- var demo = {"active","success","warning","danger"}; -->
				<tr class="active">
					<td>${st.count }</td>
					<td>${storgeApply.STORGE_ID}</td>
					<td>${storgeApply.ADMIN_ID}</td>
					<td>${storgeApply.TYPE_TOTAL}</td>
					<td>${storgeApply.STORGE_TOTAL}</td>
					<td>${storgeApply.SUBMIT_DATE}</td>
					<td>${storgeApply.PARAMETER_NAME}</td>
					<td>
						<c:if test="${storgeApply.STAT==6}">
						<input type="button" value="删除" onclick="deleteStorgeApply(${storgeApply.STORGE_ID})" >
						</c:if>
						<c:if test="${storgeApply.STAT==6}">
						<input type="button" value="删除" onclick="deleteStorgeApply(${storgeApply.STORGE_ID})" >
						</c:if>
						<c:if test="${storgeApply.STAT==2}">
						<input type="button" value="查看详情" onclick="storgeApplyDetail(${storgeApply.STORGE_ID})" >
						</c:if>
						<c:if test="${storgeApply.STAT==3}">
						<input type="button" value="查看详情" onclick="storgeApplyDetail(${storgeApply.STORGE_ID})" >
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
		一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/storge/drugStorge.action?pageIndex=1">首页</a>&nbsp;
		<a
			href="<%=basePath%>/storge/drugStorge.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/storge/drugStorge.action?pageIndex=${prePage }">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page }</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages }" var="nextPage">
			<a href="<%=basePath%>/storge/drugStorge.action?pageIndex=${nextPage }">${nextPage }</a>&nbsp;
		</c:forEach>
		<a
			href="<%=basePath%>/storge/drugStorge.action?pageIndex=${requestScope.page.next }">下一页</a>&nbsp;
		<a
			href="<%=basePath%>/storge/drugStorge.action?pageIndex=${requestScope.page.all }">末页</a>&nbsp;
	</div>
	
</body>
<script type="text/javascript">
function storgeApplyDetail(storge_id){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2
      ,title: '查看入库单详情'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      ,content: '<%=basePath%>/storge/storgeApplyDetail.action?storge_id='+storge_id
     
    });
  }
  
  function toNewApply(){
		     var that = this; 
		     //多窗口模式，层叠置顶
		     layer.open({
		       type: 2 //此处以iframe举例
		       ,title: '新建入库表'
		       ,area: ['600px', '400px']
		       ,shade: 0
		       ,maxmin: true
		       ,content: '<%=basePath%>/storge/storgeApply.action'
		      
		     });
		   }
  
</script>
</html>