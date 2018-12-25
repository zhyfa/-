<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">

<title>修改角色名称页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<style>
ul li {
	list-style-type: none;
	margin: 8px 0;
}
a {
	text-decoration:none;
}
input{width:350px; height:35px}
#info{ position:absolute; left:100px; top:100px;}
</style>
</head>

<body>
<div id="info">
	<input type="text" value="${requestScope.roleName}" id="roleName" name="roleName">
	<span id="showMeg"></span>
	<input type="hidden" value="${requestScope.roleId}" id="roleId" name="roleId">
	<button class="layui-btn" onclick='update()'>确定</button>
	</div>
</body>
<script>

//检查角色名是否可用
$("#roleName").blur(function checkRoleName(){
	$.ajax({
		url:"<%=basePath%>/role/checkRoleName.action",
		type: "POST",
		data:{"roleName":$("#roleName").val()},
		success : function(res){
			if(res=='0'){
				$("#showMeg").text("该名字可用");
			}else{
				$("#showMeg").text("该名字不可用");
			}
		}
	});
});

	function update() {
		if($("#roleName").val()==""){
			alert("角色名不得为空！");
			return;
		}
		if($("#roleName").val()=="${requestScope.roleName}"){
			alert("角色名和之前的一样");
			return;
		}
		if(window.confirm("确定将角色名改为"+$("#roleName").val())){
			//window.location.href="<%=request.getContextPath()%>/role/updateRole.action?role_id="+$("#roleName").val()+"&roleName="+$("#roleName").val();
			$.ajax({
				url:"<%=basePath%>/role/updateRole.action",
				type: "POST",
				data:{"roleId":$("#roleId").val(),"roleName":$("#roleName").val()},
				success : function(res){
					if(res=='0'){
						alert("修改成功");
						//重新跳转至用户列表页
						window.location.href="<%=request.getContextPath()%>/role/toJSP.action";
					}else{
						alert("修改失败");
					}
				}
			});
		}
	}
	
</script>
</html>
