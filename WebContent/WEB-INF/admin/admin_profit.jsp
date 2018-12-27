<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<title></title>

<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ichart.1.2.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.css">
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#from").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			onClose : function(selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#to").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 3,
			onClose : function(selectedDate) {
				$("#from").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
<script>
	$(function() {
		var data=[${requestScope.priceList}.length];
		var a="";
			for (var i = 0; i < ${requestScope.priceList}.length; i++) {
				if(i==0){
					a='#8658a5';
				}else if(i==1){
					a='#4ac2db';
				}else if(i==2){
					a='#dd4b4b';
				}
			var t="{'name':'"+${requestScope.priceList}[i].DRUG_NAME+"','value':'"+${requestScope.priceList}[i].PRICE+"','color':'"+a+"'}"
			data[i]=eval("(" + t + ")");
			}
			var pv = [],t;
			for (var i = 0; i < ${requestScope.profitList}.length; i++) {
				t=${requestScope.profitList}[i].PROFIT;
				pv.push(t);
			}
			var data1 = [
	        	{
	        		name : '',
	        		value:pv,
	        		color:'#34a1d9',
	        		line_width:5
	        	}
	       ];
			var chart = new iChart.Column2D({
				render : 'canvasDiv',
				data : data,
				title:{
					text:'智慧药房利润分析',
					color:'#4572a7',
					textAlign:'left',
					padding:'0 40',
					border:{
						enable:true,
						width:[0,0,4,0],
						color:'#4572a7'
					},
					height:40
				},
				footnote : {
					text : '传一科技：智慧药房',
					height:30,
					color:'#c52120',
					fontweight : 600,
					padding : '0 40'
				},
				width : 800,
				height : 400,
				padding:0,
				label : {
					fontsize:11,
					fontweight:600,
					color : '#666666'
				},
				shadow : true,
				shadow_blur : 2,
				shadow_color : '#aaaaaa',
				shadow_offsetx : 1,
				shadow_offsety : 0,
				background_color : '#f7f7f7',
				column_width : 62,
				sub_option : {
					label : false,
					border : {
						width : 2,
						radius : '5 5 0 0',//上圆角设置
						color : '#ffffff'
					}
				},
				coordinate : {
					background_color : null,
					grid_color : '#c0c0c0',
					width : 680,
					height:220,
					axis : {
						color : '#c0d0e0',
						width : [0, 0, 1, 0]
					},
					scale : [{
						position : 'left',
						start_scale : 0,
						end_scale : 10000,
						scale_space : 5000,
						scale_enable : false,
						label : {
							fontsize:11,	
							fontweight:600,
							color : '#666666'
						}
					},{
						 position:'right',	
						 start_scale:0,
						 scale_space:10000,
						 end_scale:2000,
						 scale_enable : false,
						 scaleAlign:'right',
						 label:{
							fontsize:11,
							fontweight:600,
							color:'#666666'
						 }
					}]
				}
			});
			//构造折线图
			var line = new iChart.LineBasic2D({
				z_index:1000,
				data: data1,
				label:{
					color:'#4c4f48'
				},
				point_space:chart.get('column_width')+chart.get('column_space'),
				scaleAlign : 'right',
				sub_option : {
					label:false,
					point_size:22
				},
				coordinate:chart.coo//共用坐标系
			});
			
			chart.plugin(line);
			
			
			//利用自定义组件构造左侧说明文本
			chart.plugin(new iChart.Custom({
					drawFn:function(){
						//计算位置
						var coo = chart.getCoordinate(),
							x = coo.get('originx'),
							y = coo.get('originy');
						//在左上侧的位置，渲染一个单位的文字
						chart.target.textAlign('start')
						.textBaseline('bottom')
						.textFont('600 16px Verdana')
						.fillText('销售总额',x-20,y-25,false,'#c52120')
						.textFont('600 11px Verdana')
						.fillText('Total',x-20,y-10,false,'#c52120');

						//在右上侧的位置，渲染一个单位的文字
						chart.target.textAlign('end')
						.textBaseline('bottom')
						.textFont('600 16px Verdana')
						.fillText('利润总额',x+20+coo.width,y-25,false,'#34a1d9')
						.textFont('600 11px Verdana')
						.fillText('Total',x+20+coo.width,y-10,false,'#34a1d9');
						
					}
			}));

		chart.draw();
	});
</script>
</head>
<style type="text/css">
input{width:200px;height:30px;border:0.5px solid #E6E6FA; border-radius: 3px 3px 3px 3px;}
</style>
<body>
	<h1>利润分析</h1>
	<label for="from">统计时间</label>
	<form id="commentForm"
		action="<%=request.getContextPath()%>/report/opurchase.action" method="post">
		<input type="text" id="from" name="from"
			value="${requestScope.startDate}" required> <label for="to">至</label>
		<input type="text" id="to" name="to" value="${requestScope.endDate}"
			required> <input style="width:80px" type="submit" value="查询"> <input
			type="hidden" name="method" value="statByAdmin">
	</form>
	<div id='canvasDiv'></div>
</body>

</html>
