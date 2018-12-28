<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">

<title>添加药品页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>/js/messages_zh.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<link href="<%=basePath%>/assets/alert/css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/assets/alert/js/ui.js"></script>
<style>

#myForm input{width:200px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;margin-top:10px}
#myForm select{width:200px;height:35px;border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;margin-top:10px}
caption{font-size:24px}
#tb1{margin-top:30px;}
#tb1 th{text-align:right}
#con{margin-left:10%}
</style>

<script>
$(document).ready(function(){
	$.validator.setDefaults({
	    submitHandler: function() {
	    	submitForm();
	    }
	});
	
	
	
	$("#myForm").validate({
	    rules: {
	      drug_name: {
	        required: true,
	        minlength: 1
	      },
	      drug_size: {
	        required: true,
	        digits:true,
	        minlength: 1
	      },
	      price: {
	        required: true,
	        number:true
	      },
	      discount: {
	    	  required: true,
		      digits:true,
		      max:100
	      },
	      use_method: {
	    	  required: true,
	    	  minlength:5
	      },
	      illustrate: {
	    	  required: true,
	    	  minlength:5
	      },
	      irradiated: {
	    	  required: true,
		      digits:true,
		      max:100
	      }
	    },
	    messages: {
	       drug_name: {
	        required: "请输入药品名字",
	        minlength: "药品至少有一个字"
	      },
	      drug_size: {
	        required: "请输入规格大小",
	        digits:"只能是正整数",
	        minlength: "规格至少是个一位数"
	      },
	      price: {
		        required: "请输入价格",
		        number:"价格是个数字"
		      },
		      discount: {
		    	  required: "请输入折扣",
			      digits:"折扣是个正整数",
			      max:"折扣最大值不超过100"
		      },
		      use_method: {
		    	  required: "请输入用量",
		    	  minlength:"至少5个字母"
		      },
		      illustrate: {
		    	  required: "请输入症状描述",
		    	  minlength:"至少5个字母"
		      },
		      irradiated: {
		    	  required: "请输入保质期",
			      digits:"保质期是个正整数"
		      }
	    }
	  })
});


</script>
</head>

<body>
<div id="con">
<form id="myForm">
	<table id="tb1">
		<caption>修改药品信息</caption>
		<tr>
			<th>药品名称： </th>
			<td><input type="text" name="drug_name" id="drug_name"><span id="showMeg"></span></td>
			<th>药品所属类别：</th>
			<td>
				<select name="smalltype_id">
					<c:forEach items="${requestScope.secondType}" var="s">
						<option value="${s.SMALLTYPE_ID}">${s.SMALLTYPE_NAME}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>规格：</th>
			<td>
				<select name="spec">
					<option value="1">瓶</option>
					<option value="2">盒</option>		
				</select>
			</td>
			<th>单位：</th>
			<td><select name="drug_unit">
					<option value="颗">颗</option>
					<option value="包">包</option>
					<option value="付">付</option>
					<option value="毫升">毫升</option>		
				</select>
			</td>
		</tr>
		<tr>
			<th>总量：</th>
			<td><input type="text" name="drug_size" id="drug_size" placeholder="请输入药品的总数量"></td>
			<th>单价（元）：</th>
			<td><input type="text" name="price" id="price" placeholder="单价"></td>
		</tr>
		<tr>
			<th>折扣（100%）：</th>
			<td><input type="text" name="discount" id="discount" placeholder="请输入打折的百分比（整数）"></td>
			<th>是否特殊药：</th>
			<td>
				<select name="psychotropics">
					<option value="是特殊药">是特殊药</option>
					<option value="不是特殊药">不是特殊药</option>		
				</select>
			</td>
		</tr>
		<tr>
			<th>用量：</th>
			<td><input type="text" name="use_method" id="use_method" placeholder="如：一天三次，每次一颗"></td>
			<th>药的别名：</th>
			<td><input type="text" name="drug_alias" id="drug_alias"></td>
		</tr>
		<tr>
			<th>症状：</th>
			<td><input type="text" name="illustrate" id="illustrate" placeholder="如：治疗头痛脑热"></td>
			
			<th>保质期（月）：</th>
			<td><input type="text" name="irradiated" id="irradiated" placeholder="请输入整数"></td>
		</tr>
		<tr>
			<th></th>
			<td>
				<input type="submit" class="layui-btn" style="width:80px;">
				<input type="button" onclick="javascript:history.back(-1);" value="返回" class="layui-btn" style="width:80px;">
			</td>
		</tr>
		</table>
	</form>
	</div>
</body>
<script>

//检查该药品名是否可用
$("#drug_name").blur(function drug_name(){
	$.ajax({
		url:"<%=basePath%>/drug/checkDrugName.action",
		type: "POST",
		data:{"drug_name":$("#drug_name").val()},
		success : function(res){
			if(res=='0'){
				$("#showMeg").text("该名字可用");
			}else{
				$("#showMeg").text("该名字不可用");
			}
		}
	});
});

function submitForm(){
		$.ajax({
			url : "<%=basePath%>/drug/addDrug.action",
			type: "POST",
			data:JSON.stringify($("#myForm").serializeJSON()),
			contentType:"application/json",
			dataType:"json",
			success : function(res) {
				if(res==0){
					/* alert("添加成功"); */
					mizhu.alert('提示', '添加成功！','alert_green');
					//添加成功或是失败都需要跳回列表页
					parent.window.location.href="<%=basePath%>/drug/toDrugJSP.action";
				}
				if(res==1){
					/* alert("添加失败"); */
					mizhu.alert('提示', '添加失败！','alert_red');
				}
			}
		});
	}


</script>
</html>
