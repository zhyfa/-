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
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<style>
#tb1{width:95%;}
.td1{text-align:left; font-size:24px;}
.td2{text-align:right; padding-right:15px;}
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
	<table id="tb1" style="margin-top:50px">
		<tr>
			<td class="td1">药品种类列表</td>
			<td class="td2">
			<button class="layui-btn" onclick="addFirstTypeBefor()"><i class="layui-icon">&#xe608;</i>新增一级药品种类</button>
			<button class="layui-btn  layui-btn-normal" onclick="addSecondTypeBefor()"><i class="layui-icon">&#xe61f;</i>新增二级药品种类</button></td>
		</tr>
	</table>
<table class="layui-table">
	<thead>
		<th>药品种类ID</th>
		<th>药品类名</th>
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
					<button class="layui-btn layui-btn-xs"  onclick='updateSmallType(${s.SMALLTYPE_ID})'><i class="layui-icon">&#xe642;</i>修改</button>
					<button class="layui-btn layui-btn-xs  layui-btn-danger"  onclick='delSmallType(${s.SMALLTYPE_ID})'><i class="layui-icon">&#xe640;</i>删除</button>
				</td>
			</tr>
		</c:forEach>
			
	</tbody>
</table>

一共有：${requestScope.page.count }条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${requestScope.page.page }/${requestScope.page.all }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=basePath%>/drugType/toJSP.action?pageIndex=1">首页</a>&nbsp;
		<a href="<%=basePath%>/drugType/toJSP.action?pageIndex=${requestScope.page.pre }">上一页</a>&nbsp;
		<c:forEach items="${requestScope.page.prePages }" var="prePage">
			<a href="<%=basePath%>/drugType/toJSP.action?pageIndex=${prePage}">${prePage }</a>&nbsp;
		</c:forEach>
		<a style="color: black;">${requestScope.page.page}</a>&nbsp;
		<c:forEach items="${requestScope.page.nextPages}" var="nextPage">
			<a href="<%=basePath%>/drugType/toJSP.action?pageIndex=${nextPage }&">${nextPage }</a>&nbsp;
		</c:forEach>
		<a href="<%=basePath%>/drugType/toJSP.action?pageIndex=${requestScope.page.next}">下一页</a>&nbsp;
		<a href="<%=basePath%>/drugType/toJSP.action?pageIndex=${requestScope.page.all}">末页</a>&nbsp;



<button class="layui-btn layui-btn-xs" onclick="javascript:history.back(-1);">返回</button>

 
</body>
<script>
function addFirstTypeBefor(){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2 //此处以iframe举例
      ,title: '增加一级药品'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      
      ,content: '<%=basePath%>/drugType/addFirstTypeBefor.action'
     
    });
  }
function addSecondTypeBefor(){
    var that = this; 
    //多窗口模式，层叠置顶
    layer.open({
      type: 2 //此处以iframe举例
      ,title: '增加二级药品'
      ,area: ['600px', '400px']
      ,shade: 0
      ,maxmin: true
      
      ,content: '<%=basePath%>/drugType/addSecondTypeBefor.action'
     
    });
  }
	<%-- function addFirstTypeBefor() {
		window.location.href="<%=basePath%>/drugType/addFirstTypeBefor.action";
	} --%>
	<%-- function addSecondTypeBefor() {
		window.location.href="<%=basePath%>/drugType/addSecondTypeBefor.action";
	} --%>
	function updateSmallType(smallTypeId){
	    var that = this; 
	    //多窗口模式，层叠置顶
	    layer.open({
	      type: 2 //此处以iframe举例
	      ,title: '更新二级药品'
	      ,area: ['600px', '400px']
	      ,shade: 0
	      ,maxmin: true
	      ,content: '<%=basePath%>/drugType/updateJsp.action?smallTypeId='+smallTypeId
	     
	    });
	  }
	
	<%-- //更新一个二级类别
	function updateSmallType(smallTypeId){
		window.location.href="<%=basePath%>/drugType/updateJsp.action?smallTypeId="+smallTypeId;
	} --%>
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
					window.location.href="<%=basePath%>/drugType/toJSP.action";
				}
			});
		}	
	}
	

</script>
</html>
