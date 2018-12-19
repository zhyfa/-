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

<title>药品类别页面</title>
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
	//显示所有的一级类别
	show();
});

function  show() {
	$.ajax({
		url:"<%=basePath%>/drugType/firstType.action",
		type: "POST",
		data:'{}',
		success : function(res){
			var str='';
			for(var i=0;i<res.length;i++){
				var r=res[i];
				str+="<li><input type='button' value='"+r.BIGTYPE_NAME+"' onclick='secondTypeById("+r.BIGTYPE_ID+")' /></li>"
			}
			$("#firstType").append(str);
		}
	});
}
</script>
</head>

<body>
<div>
<a href="<%=basePath %>/drugType/toOtherJsp.action">前往下一个页面</a>
 <form id="commentForm">
	<div style="float:left" height="500px" id="first">
	<ul id="firstType">
		<li>药品大类：</li>
	</ul>
	</div>
	<div id="second">
		<ul id="secondType">
			
		</ul>
	</div>	
		</form>
 
 
 
</body>
<script>

	//显示选中一级类别下的子类别
	function  secondTypeById(bigtype_id){
		$("#secondType").html("");
		$.ajax({
			url:"<%=basePath%>/drugType/secondTypeById.action",
			type: "POST",
			data:{"father_id":bigtype_id},
			success : function(res){
				var str='<li>药品小类：</li>';
				for(var i=0;i<res.length;i++){
					var r=res[i];
					str+="<li><input type='button' value='"+r.SMALLTYPE_NAME+"' onclick='typeById("+r.SMALLTYPE_ID+")' /></li>"
				}
				$("#secondType").append(str);
			}
			
		});
	}
	
	function  typeById(smallTypeId){
		alert(smallTypeId);
		$.ajax({
			url:"<%=basePath%>/drugType/secondTypeById.action",
			type: "POST",
			data:{"father_id":bigtype_id},
			success : function(res){
				var str='<li>药品小类：</li>';
				for(var i=0;i<res.length;i++){
					var r=res[i];
					str+="<li><input type='button' value='"+r.SMALLTYPE_NAME+"' onclick='typeById("+r.SMALLTYPE_ID+")' /></li>"
				}
				$("#secondType").append(str);
			}
			
		});
	}

	

</script>
</html>
