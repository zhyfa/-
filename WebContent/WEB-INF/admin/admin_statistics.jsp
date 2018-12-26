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
<script type="text/javascript">
	$(function() {
		var pv = [], ip = [], t,f,nm=[],n;
		for (var i = 0; i < ${requestScope.inList}.length; i++) {
			t=${inList}[i].INSUM;
			n=${inList}[i].DRUG_NAME;
			pv.push(t);
			nm.push(n);
		}
		for (var i = 0; i < ${requestScope.outList}.length; i++) {
			f=${outList}[i].OUTSUM;
			ip.push(f);
		}
		

		var data = [ {
			name : '入库数量',
			value : pv,
			color : '#0d8ecf',
			line_width : 2
		}, {
			name : '销售数量',
			value : ip,
			color : '#ef7707',
			line_width : 2
		} ];

		var labels = nm;
		var line = new iChart.LineBasic2D({
			render : 'canvasDiv',
			data : data,
			align : 'center',
			title : '药品出入数量对比',
			footnote : '数据来源：数据库',
			width : 800,
			height : 400,
			tip : {
				enable : true,
				shadow : true
			},
			legend : {
				enable : true,
				row : 1,//设置在一行上显示，与column配合使用
				column : 'max',
				valign : 'top',
				sign : 'bar',
				background_color : null,//设置透明背景
				offsetx : -80,//设置x轴偏移，满足位置需要
				border : true
			},
			crosshair : {
				enable : true,
				line_color : '#62bce9'
			},
			sub_option : {
				label : false,
				point_hollow : false
			},
			coordinate : {
				width : 640,
				height : 240,
				axis : {
					color : '#9f9f9f',
					width : [ 0, 0, 2, 2 ]
				},
				grids : {
					vertical : {
						way : 'share_alike',
						value : 5
					}
				},
				scale : [ {
					position : 'left',
					start_scale : 0,
					end_scale : 100,
					scale_space : 30,
					scale_size : 2,
					scale_color : '#9f9f9f'
				}, {
					position : 'bottom',
					labels : labels
				} ]
			}
		});

		//开始画图
		line.draw();
	});
</script>
</head>
<body>
	<h1>渠道量统计</h1>
	<p>查询条件：</p>
	<label for="from">统计时间</label>
	<form id="commentForm"
		action="<%=request.getContextPath()%>/report/outstock.action" method="post">
		<input type="text" id="from" name="from"
			value="${requestScope.startDate}" required> <label for="to">至</label>
		<input type="text" id="to" name="to" value="${requestScope.endDate}"
			required> <input type="submit" value="查询"> <input
			type="hidden" name="method" value="statByAdmin">
	</form>
	<div>
		<p>该段时间内总预约量为：${requestScope.totalCount.TOTAL}</p>
	</div>
	<div id='canvasDiv'></div>
</body>

</html>
