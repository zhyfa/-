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
caption{font-size:24px}
#td1{text-align:left;font-size:24px}
#td2{text-align:right;padding-right:30px}
</style>
</head>
		<table style="width:100%; margin-top:50px">
	<tr>
		<td id="td1">审核入库</td>
		<td id="td2"><button class="layui-btn" id="storgeApply" onclick="toNewApply()"><i class="layui-icon">&#xe608;</i>新建入库申请表</button>
		</td>
	</tr>
	</table>
<!-- <input type="button" id="storgeApply" name="storgeApply" value="创建入库申请表" onclick="toNewApply()"> -->
<body>
	<table class="layui-table">
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
					<button class="layui-btn layui-btn-xs" onclick="storgeApplyDetail(${storgeApply.STORGE_ID})"><i class="layui-icon">&#xe63c;</i>详情</button>
						<c:if test="${storgeApply.STAT==1}">
						<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="deleteStorgeApply(${storgeApply.STORGE_ID})"><i class="layui-icon">&#xe640;</i>删除</button>
						</c:if>
						<c:if test="${storgeApply.STAT==6}">
						<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="deleteStorgeApply(${storgeApply.STORGE_ID})"><i class="layui-icon">&#xe640;</i>删除</button>
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
   
      window.location.href="<%=basePath%>/storge/storgeApplyDetail.action?storge_id="+storge_id;
     
   
  }
  
  function toNewApply(){
		     
	  window.location.href="<%=basePath%>/storge/storgeApply.action";
		      
		   }
  
</script>
</html>