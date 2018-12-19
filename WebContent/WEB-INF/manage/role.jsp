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

<title>角色权限分配页</title>
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
$(document).ready(function(){
	//显示所有的角色
	show();
});

function  show() {
	$.ajax({
		url:"<%=basePath%>/role/queryAllRole.action",
		type: "POST",
		data:'{}',
		success : function(res){
			var str='';
			for(var i=0;i<res.length;i++){
				var r=res[i];
				str+="<li><input type='button' value='"+r.roleName+"' onclick='quaryByID("+r.roleId+")' /></li>"
			}
			$("#roles").html(str);
		}
	});
}
</script>
</head>

<body>
<div>
 <form id="commentForm">
	<div style="float:left" height="500px">
	<ul>
		<li>角色列表：</li>
		<li>
		<ul id="roles">
			
		</ul>
		</li>
	</ul>
	</div>
		<div class="treecontentpane" style="float:left">
     		<ul id="menuTree" class="ztree"></ul>
		</div>
		<div>
		<input type="button" value="确定" onClick="getNotes()">
		<input type="hidden" name="role_id" id="role_id">
		
		</div>
		</form>
 
 
 
</body>
<script>

	//显示选中角色的权限
	function  quaryByID(roleId){
		$("#role_id").val(roleId)
		
		$.ajax({
			url:"<%=basePath%>/roleAndMeun/quaryByID.action",
			type: "POST",
			data:{"roleId":roleId},
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

	function getNotes(){
	    var treeObj = $.fn.zTree.getZTreeObj("menuTree");
		var nodes = treeObj.getCheckedNodes(true);
		var str="";
		for(var i=0;i<nodes.length;i++){
			str+=nodes[i].MENU_ID+",";
		}
		$.ajax({
			url:"<%=basePath%>/roleAndMeun/changeRoleMenu.action",
			type: "POST",
			data:{"roleId":$("#role_id").val(),"menus":str},
			success:function(res){
				if(res=='0'){
					alert("修改成功");
				}else if(res=='1'){
					alert("修改失败");
				}else{
					alert("用户权限不能为空！");
				}
			}
		});
}
</script>
</html>
