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
</head>
<body>
<form id="uploadForm" enctype="multipart/form-data" method="post"> 
	<input id="upfile" type="file" name="upfile">
	<input type="button" value="导入本地医保基表" id="upLoad" name="btn">
</form>
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