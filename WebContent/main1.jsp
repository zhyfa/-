<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$.ajax({
		type : "post",
		url : "<%=basePath%>/stock/stockList.action",
		dataType : "JSON",
		async: false,
		success : function(data) {
			if(data.stocks!=null){
				var str = "";
				for(var i=0;i<data.stocks.length;i++){
					var stock = data.stocks[i];
					if(stock.msg!=null){
						str+="<a href='<c:if test='${sessionScope.admin.role_id==2 }'><%=basePath%>/stock/purchase.action</c:if><c:if test='${sessionScope.admin.role_id==3 }'><%=basePath%>/pharmacyApply/toPharmacyApplyJSP.action</c:if>' class='tagc2'>"+stock.drug_name+":"+stock.msg+"</a>"
					}
				}
				$("#hovertreetags").append(str);
			}
			if(data.unsalables!=null){
				var str = "";
				for(var i=0;i<data.unsalables.length;i++){
					var unsalable = data.unsalables[i];
					if(unsalable.msg!=null){
						str+="<a href='<%=basePath%>/daily/returnBack.action' class='tagc1'>"+unsalable.inventory_id+":"+unsalable.drug_name+":"+unsalable.msg+"</a>"
					}
				}
				$("#hovertreetags").append(str);
			}
			if(data.overdues!=null){
				var str = "";
				for(var i=0;i<data.overdues.length;i++){
					var overdue = data.overdues[i];
					if(overdue.msg!=null){
						str+="<a href='<%=basePath%>/daily/returnBack.action' class='tagc5'>"+overdue.inventory_id+":"+overdue.drug_name+":"+overdue.msg+"</a>"
					}
				}
				$("#hovertreetags").append(str);
			}
		}
	});
 });
</script>
<script src='<%=basePath%>/js/hovertreetags.js' type="text/javascript"></script>
<link href="<%=basePath%>/css/hovertreetags.css" rel="stylesheet" type="text/css" />
</head>
<style>
#hovertreetags{
position: absolute;
left: 10px;
top:10px;
width: 1000px;}
#color1{
position: absolute;
top:300px;
left:20px;
width: 10px;
height: 10px;
background: #F16E50;}
#color2{
position: absolute;
top:300px;
left:100px;
width: 10px;
height: 10px;
background: #666;}
#color3{
position: absolute;
top:300px;
left:210px;
width: 10px;
height: 10px;
background: #006633;}
#text1{
position: absolute;
top:290px;
left:30px;
font-size: 10px;}
#text2{
position: absolute;
top:290px;
left:110px;
font-size: 10px;}
#text3{
position: absolute;
top:290px;
left:220px;
font-size: 10px;}
</style>
<body>
<div id="hovertreetags"></div>
<div id="color1"></div><p id="text1">药量不足提示</p> <div id="color2"></div><p id="text2">药房药品滞销提示</p> <div id="color3"></div><p id="text3">药房药品过期提示</p> 

</body>

</html>