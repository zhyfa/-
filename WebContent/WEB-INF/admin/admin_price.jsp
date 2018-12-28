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
		var data=[${requestScope.outList}.length];
		var a="";
			for (var i = 0; i <${requestScope.outList}.length; i++){
				if(i==0){
					a='#8658a5';
				}else if(i==1){
					a='#4ac2db';
				}else if(i==2){
					a='#dd4b4b';
				}
			var t="{'name':'"+${requestScope.outList}[i].DRUG_NAME+"','value':'"+${requestScope.outList}[i].PRICE+"','color':'"+a+"'}"
			data[i]=eval("(" + t + ")");
			}
		
		//是否启用动画
		var animation = false;

		var chart = new iChart.Column2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '药品销售及占比分析',
				color : '#3e576f'
			},
			subtitle : {
				text : '销量前三统计',
				color : '#6d869f'
			},
			footnote : {
				text : '智慧药房',
				color : '#909090',
				fontsize : 11,
				padding : '0 38'
			},
			width : 900,
			height : 600,
			animation : animation,
			animation_duration : 600,
			shadow : true,
			shadow_blur : 2,
			shadow_color : '#aaaaaa',
			shadow_offsetx : 1,
			shadow_offsety : 0,
			column_width : 68,
			label : {
				color : '#4c4f48'
			},
			sub_option : {
				label : {
					//lable上方文字颜色
					color : '#aaaaaa'
				},
				listeners : {
					parseText : function(r, t) {
						//自定义柱形图上方label的格式。
						return '￥' + t + '元';
					}
				}
			},
			coordinate : {
				background_color : '#4a4b4f',
				grid_color : '#676a73',
				striped_factor : 0.06,
				height : '84%',
				width : '84%',
				scale : [ {
					position : 'left',
					start_scale : 0,
					scale_space : 10000,
					label : {
						color : '#4c4f48'
					},
					listeners : {
						parseText : function(t, x, y) {
							//自定义左侧坐标系刻度文本的格式。
							return {
								text : '￥' + t + '元'
							}
						}
					}
				} ]
			}
		});
		var pie = new iChart.Pie2D({
			data : data,
			label : {
				color : '#4c4f48'
			},
			sub_option : {
				mini_label_threshold_angle : 80,//迷你label的阀值,单位:角度
				mini_label : {//迷你label配置项
					fontsize : 15,
					fontweight : 500,
					color : '#ffffff'
				},
				label : {
					background_color : null,
					sign : false,//设置禁用label的小图标
					padding : '0 4',
					border : {
						enable : false,
						color : '#666666'
					},
					fontsize : 15,
					fontweight : 600,
					color : '#ffe383'
				},
				listeners : {
					parseText : function(d, t) {
						return d.get('value');//自定义label文本
					}
				}
			},
			text_space : 25,
			showpercent : true,
			decimalsnum : 1,
			align : 'left',
			offsetx : chart.coo.get('originx') + 10,
			offsety : -(chart.get('centery') - chart.coo.get('originy') - 90),
			animation : animation,
			radius : 60
		});

		chart.plugin(pie);

		//利用自定义组件构造左侧说明文本。
		chart
				.plugin(new iChart.Custom(
						{
							drawFn : function() {
								//计算位置
								var coo = chart.getCoordinate(), x = coo
										.get('originx'), y = coo.get('originy'), H = coo.height;
								//在左侧的位置，渲染说明文字。
								chart.target.textAlign('center').textBaseline(
										'middle').textFont('600 13px Verdana')
										.fillText('', x - 20,
												y + H / 2, false, '#6d869f',
												false, false, false, -90);

							}
						}));

		chart.draw();
	});
</script>
<style type="text/css">
input{width:200px;height:30px;border:0.5px solid #E6E6FA; border-radius: 3px 3px 3px 3px;}
</style>
</head>
<body>
	<h1>渠道量统计</h1>
	<p>查询条件：</p>
	<label for="from">统计时间</label>
	<form id="commentForm"
		action="<%=request.getContextPath()%>/report/instock.action" method="post">
		<input type="text" id="from" name="from"
			value="${requestScope.startDate}" required> <label for="to">至</label>
		<input type="text" id="to" name="to" value="${requestScope.endDate}"
			required> <input class="layui-btn" style="width:80px"  type="submit" value="查询" > <input
			type="hidden" name="method" value="statByAdmin">
	</form>
	<div id='canvasDiv'></div>
</body>

</html>
