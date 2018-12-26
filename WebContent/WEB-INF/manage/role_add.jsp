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
input{width:350px; height:35px; font-size:20px;}
.info{ position:absolute; left:50px; top:50px;}
#treecontentpane{position:absolute; left:50px; top:100px;}
ul{list-style-type:none;height:40px;margin-top:15px;padding:5px; } 
	ul>li>ul>li{display:inline;margin-left:20px}
	/* ul{display:inline;margin-left:20px} */
	input:hover{color:#3CB371}
	ul.ztree>li{height:45px;}
</style>
<script>
$(document).ready(function(){
	showMenu()
});
var treeObj="";
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

			treeObj= $.fn.zTree.init($("#menuTree"), setting, res);
			treeObj.expandAll(true); 
		}
		
	});
}
</script>
</head>

<body>
<div>
 <form id="commentForm">
	<div style="float:left" height="600px" class="info">
	角色名：<input type="text" name="roleName" id="roleName" >
	<span id="showMeg"></span>
	<button class="layui-btn" onclick='getNotes()'>确定</button>
	</div >
		<div id="treecontentpane" >
     		<ul id="menuTree" class="ztree"></ul>
		</div>
		<div>
		<!-- <input type="button" value="确定" onClick="getNotes()"> -->
		<!-- <button class="layui-btn" onclick='getNotes()'>确定</button> -->
		</div>
		</form>
 
 
 
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
