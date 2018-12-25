<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/jquery.form.js"></script>
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style>
	#upfile{width:250px;height:35px; border:0px; color:#008080}
	#con{margin-left:30%;margin-top:15%}
</style>
<body>
<div id="con">
	<form id="uploadForm" enctype="multipart/form-data" method="post"> 
		
		<input id="upfile" type="file" name="upfile">
		<button class="layui-btn" id="upLoad" name="btn"><i class="layui-icon">&#xe67c;</i>导入本地医保基表</button>
	</form>
</div>
</body>
<script type="text/javascript">
$('#upLoad').click(function(){
	var cacheVersion=$("#cacheVersion").val();
    if(checkData()){  
        $('#uploadForm').ajaxSubmit({    
            url:'<%=basePath%>/creditInfo/medical.action',
            data:{'cacheVersion':cacheVersion},
            dataType: 'text',
            success:function(data){
            	alert(data);
            	window.location.href="<%=basePath%>/creditInfo/medicalList.action?dqPage=1&pageTwo=1";
            }
        });   
    }  
});  
 
//JS校验form表单信息  
function checkData(){  
   var fileDir = $("#upfile").val();  
   var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
   if("" == fileDir){  
       alert("选择需要导入的Excel文件！");  
       return false;  
   }  
   if(".xls" != suffix && ".xlsx" != suffix ){  
       alert("选择Excel格式的文件导入！");  
       return false;  
   }  
   return true;  
}
</script>
</html>