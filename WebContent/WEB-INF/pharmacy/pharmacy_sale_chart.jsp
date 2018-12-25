<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/ichart.1.2.min.js"></script>

<script>

$(document).ready(function(){
	getWeekMoney();//默认显示这周的营业数据
	$("#week").click(function(){
		getWeekMoney();
	});
	$("#month").click(function(){
		getMonthMoney();
	});
	
});

function getMonthMoney(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>/sale/getMonthMoney.action",
		data:'{}',
		success:function(data){
		var datalist=[];
		var total=0;
		for(var i=0;i<data.length;i++){
			total+=data[i].COUNT;
			datalist[i]={
			name:data[i].NAME,
			value:data[i].ALLPRICE,
			color:'#a5c2d5',
			};	
		}
		var title="本月的营业额";
		importStatistics(datalist,title,total);
		}
	});
}
function getWeekMoney(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>/sale/getWeekMoney.action",
		data:'{}',
		success:function(data){
		var datalist=[];
		var total=0;
		for(var i=0;i<data.length;i++){
			total+=data[i].COUNT;
			datalist[i]={
			name:data[i].NAME,
			value:data[i].ALLPRICE,
			color:'#a5c2d5',
			};	
		}
		var title="本周的营业额";
		importStatistics(datalist,title,total);
		}
	});
}
function importStatistics(data,title,total){
					new iChart.Column2D({
						render : 'canvasDiv',
						data: data,
						title : title,
						showpercent:false,
						decimalsnum:100,
						width : 800,
						height : 400,
						coordinate:{
							background_color:'#fefefe',
							scale:[{
								 position:'left',	
								 start_scale:0,
								 end_scale:total+500,
								 scale_space:500,
								 listeners:{
									parseText:function(t,x,y){
										return {text:t+"/元"}
									}
								}
							}]
						}
					}).draw();
	
}

</script>
</head>
<body>


<input type="button" id="week" value="本周">
<input type="button" id="month" value="本月">



	<div id='canvasDiv'></div>
		<div class='ichartjs_info'>
			<div class='ichartjs_sm'></div>
				<div class='ichartjs_details'>
				</div>
				<span class='ichartjs_sm'></span>
				<span class='ichartjs_details'>
				</span>
	</div>


</body>
<script>


</script>
</html>