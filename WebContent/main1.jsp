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
</head>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : "post",
		url : "<%=basePath%>/stock/stockList.action",
		//contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		//data : $("#loginForm").serialize(),
		success : function(data) {
			var str = "<p style='color: red;'>";
			for(var i=0;i<data.length;i++){
				var stock = data[i];
				if(stock.msg!=null){
					str+=stock.drug_name+":"+stock.msg+"<br>";
				}
			}
			str+="</p>";
			$("#checkStock").append(str);
		}
	});
});
</script>
<body>
${sessionScope.admin.role_name }
<div id="checkStock">
<p style="color: red;">
</div>
</body>
</html>