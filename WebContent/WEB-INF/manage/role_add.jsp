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
<title>添加角色页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/><style>
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
	showMenu()
});

function  showMenu() {
	$.ajax({
		url:"<%=basePath%>/roleAndMeun/quaryAllMenu.action",
		type: "POST",
		data:{},
		success : function(res){
			var setting={
					check:{
						enable:true
					},
					data:{
						key:{
							name:"MENU_NAME",
							checked:"MENU_STATUS"
						},
						simpleData:{
							idKey:'MENU_ID',
							pIdKey:'F_MENU_ID',
							enable:true,
							rootPId:0
						}
					}
			}

			$.fn.zTree.init($("#menuTree"), setting, res);
		}
		
	});
}
</script>
</head>

<body>
<div>
 <form id="commentForm">
	<div style="float:left" height="500px">
	角色名：<input type="text" name="roleName" id="roleName" >
	
	</div>
		<div class="treecontentpane" style="float:left">
     		<ul id="menuTree" class="ztree"></ul>
		</div>
		<div>
		<input type="button" value="确定" onClick="getNotes()">
		</div>
		</form>
 
 
 
</body>
<script>

	function getNotes(){
		if($("#roleName").val()==""){
			alert("用户名不得为空！");
			return false;
		}
	    var treeObj = $.fn.zTree.getZTreeObj("menuTree");
		var nodes = treeObj.getCheckedNodes(true);
		var str="";
		for(var i=0;i<nodes.length;i++){
			str+=nodes[i].MENU_ID+",";
		}
		$.ajax({
			url:"<%=basePath%>/role/addRole.action",
			type: "POST",
			data:{"roleName":$("#roleName").val(),"menus":str},
			success:function(res){
				if(res=='0'){
					alert("新增成功");
					window.location.href="<%=basePath%>/role/toJSP.action";
				}else if(res=='1'){
					alert("新增失败");
					window.location.href="<%=basePath%>/role/toJSP.action";
				}else{
					alert("用户权限不能为空！");
				}
			}
		});
}
</script>
</html>
