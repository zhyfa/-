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
	$(function(){
		//得到今天的日期
		var date_now=new Date();
		//得到该日期所在年份
		var year=date_now.getFullYear();
		var month = date_now.getMonth()+1 < 10 ? "0"+(date_now.getMonth()+1) : (date_now.getMonth()+1);
		var date = date_now.getDate() < 10 ? "0"+date_now.getDate() : date_now.getDate();
		$("#start").attr("max",year+"-"+month+"-"+date);
		$("#end").attr("max",year+"-"+month+"-"+date);
	});
	
	getHalfYear();//默认显示这半年的采购记录表
	
	$("#week").click(function(){
		getWeek();
	});
	$("#month").click(function(){
		getMonth();
	});
	$("#halfYear").click(function(){
		getHalfYear();
	});
});
function getHalfYear(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>/stock/getHalfYear.action",
		data:{"method":"getQuarterStatistics"},
		success:function(data){
		var datalist=[];
		var total=0;
		for(var i=0;i<data.length;i++){
			total+=data[i].COUNT;
			datalist[i]={
			name:data[i].DRUG_NAME,
			value:data[i].COUNT,
			color:'#a5c2d5',
			};	
		}
		var title="近半年的药品采购"+total;
		importStatistics(datalist,title,total);
		}
	});
}
function getMonth(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>/stock/getMonth.action",
		data:{"method":"getQuarterStatistics"},
		success:function(data){
		var datalist=[];
		var total=0;
		for(var i=0;i<data.length;i++){
			total+=data[i].COUNT;
			datalist[i]={
			name:data[i].DRUG_NAME,
			value:data[i].COUNT,
			color:'#a5c2d5',
			};	
		}
		var title="近一个月的药品采购"+total;
		importStatistics(datalist,title,total);
		}
	});
}
function getWeek(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>/stock/getWeek.action",
		data:{"method":"getQuarterStatistics"},
		success:function(data){
		var datalist=[];
		var total=0;
		for(var i=0;i<data.length;i++){
			total+=data[i].COUNT;
			datalist[i]={
			name:data[i].DRUG_NAME,
			value:data[i].COUNT,
			color:'#a5c2d5',
			};	
		}
		var title="近一周的药品采购"+total;
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
						decimalsnum:200,
						width : 800,
						height : 400,
						coordinate:{
							background_color:'#fefefe',
							scale:[{
								 position:'left',	
								 start_scale:0,
								 end_scale:total,
								 scale_space:500,
								 listeners:{
									parseText:function(t,x,y){
										return {text:t+""}
									}
								}
							}]
						}
					}).draw();
	
}

</script>
</head>
<body>
起始时间：<input type="date" id="start" name="start">&nbsp;&nbsp;
终止时间：<input type="date" id="end" name="end">&nbsp;&nbsp;
<input type="button" id="search" name="search" value="搜索" onclick="search()"><br />

<input type="button" id="week" value="本周">
<input type="button" id="month" value="本月">
<input type="button" id="halfYear" value="近半年">



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
$("#end").blur(function () {
    if($("#start").val()!=""){
    	var startTime=$("#start").val();
    	var start=new Date(startTime.replace("-", "/").replace("-", "/"));
    	var endTime=$("#end").val();
    	var end=new Date(endTime.replace("-", "/").replace("-", "/"));
    	if(end<start){
    		alert("终止时间应该在开始时间之后");
    		$("#end").val("");
    	}
    }

});
	
	function search(){
		if($("#start").val()=="" || $("#end").val()==""){
			alert("请确定要搜索的时间段");
			return;
		}
		$.ajax({
			url:"<%=basePath%>/stock/getOrdersByTime.action",
			type: "POST",
			data:{"start":$("#start").val(),"end":$("#end").val()},
			success : function(data){
				if(data==''){
					alert("该时间段没有任何采购记录！");
				}
				var datalist=[];
				var total=0;
				for(var i=0;i<data.length;i++){
					total+=data[i].COUNT;
					datalist[i]={
					name:data[i].DRUG_NAME,
					value:data[i].COUNT,
					color:'#a5c2d5',
					};	
				}
				var title="该时间段内的药品采购"+total;
				importStatistics(datalist,title,total);
				}
			
		});
	}


</script>
</html>