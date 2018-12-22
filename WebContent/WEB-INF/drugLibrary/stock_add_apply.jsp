<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入库申请单</title>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/jqueryUI/jquery-ui.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
</head>
<script>
 $(function() {
	    $( "#production_date" ).datepicker({ 
	    	onClose:function(){
	    		var productionDate=$("#production_date").val();
	    		console.log(productionDate);
	    		}
	    	});
	  });
  </script>
<style>
 .infoTb table { white-space: nowrap; width: 90%;font-size: 14px; 
} 
  th{ text-align:left; font-family:"微软雅黑"; border:0.5px solid #E6E6FA;} 
  td{text-align:left; border:0.5px solid #E6E6FA;}
 .infoTb select{border:10px}
 input{width:120px;height:30px; border:0px ;border-radius: 3px 3px 3px 3px;}
 caption{padding-left:15%}
 button{border:0px solid #dae6f0; width:80px; height:35px; margin-left:15%}
 span{color:red}
 .btn_opt{border:0px solid #dae6f0; width:60px; height:25px;margin-right:3px}
.checkBox{width:18px;}
 table { white-space: nowrap; width: 90%;font-size: 14px; border:1px solid #E6E6FA;border-collapse:collapse; margin-left:5%;
}  
</style>
<body>
	<div id="">
		<form id="myForm">
			<input type="hidden" value="${sessionScope.admin.admin_id}" name="admin_id" id="admin_id">
			<table>
			<caption>入库申请单</caption>
				<tr>
					<th>入库单编号</th>
					<td ><input id="storge_id" name="storge_id"></td>
					<th>采购单编号</th>
					<td><input id="auditsdetail_id" name="auditsdetail_id" list="purchaseList">
						<datalist id="purchaseList">
						<c:forEach items="${requestScope.purchaseList}" var="purchases">
							<option value="${purchases.AUDITSDETAIL_ID}">${purchases.AUDITSDETAIL_ID}</option>
						</c:forEach>
						</datalist>
					</td>
				</tr>
				<tr>
				<th>药品名称：</th>
			        <td>
			        	 <input type="text" id="drug_name" name="drug_name" list="drug_names"/>
			         <datalist id="drug_names">
			          	<c:forEach items="${requestScope.drugList}" var="drugs">
							<option value="${drugs.DRUG_NAME}">${drugs.DRUG_NAME}</option>
						</c:forEach>
			         </datalist>
			        </td>
				<th>药品编号：</th>
					<td>
						<select id="drug_id" name="drug_id" onchange="chooseId()"></select>
					</td>
			        <th> 生产厂家：</th>
			    	<td>
				    	<select id="factory" name="factory">
							<option value="">请选择</option>
							<c:forEach items="${requestScope.factoris}" var="fac">
								<option value="${fac.FACTORY_NAME}" >${fac.FACTORY_NAME}</option>
							</c:forEach>
						</select>
					</td>
					</tr>
					<tr>
						<th>生产日期</th>
						<td><input type="text" id="production_date" name="production_date" style="width:250px; height:20px;margin-left:0px" ></td>
						<th>生产批号</th>
				    	<td ><input type="text" id="production_id" name="production_id" ></td>
						<th>入库数量</th>
						<td>
							<input type="text" id="storge_number" name="storge_number">
						</td>
				    </tr>
			</table>
		</form>
	</div>
	<div >
                 <input type="button"  onclick="DelRow();" value="删除"> 
                <input type="button" onclick="AddRow();" value="添加">
                <input type="button" value="提交" onclick="submitForm()">
                <input type="button" value="生成入库单" onclick="submitTable()">
            </div>
            <div class="">
                <input type="hidden" id="hid" name="hid" />    
                 <table id="tab1" class="detailList">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>采购单编号</th>
							<th>药品编号</th>
							<th>药品名称</th>
							<th>生产厂家</th>
							<th>生产日期</th>
							<th>生产批号</th>
							<th>入库数量</th>
                        </tr>
                    </thead>
                     <tbody id="tbody"></tbody>
                </table>
            </div>
</body>
	<script>
	 //添加行
    function AddRow() {
		var storgeId = $("#storge_id").val();
    	var detail =$("#auditsdetail_id").val();
    	var drugId = $("#drug_id").val();
		var drugName = $("#drug_name").val();
		var factory = $("#factory").val();
		var productionDate =$("#production_date").val();
		var productionId =$("#production_id").val();
		var storgeNumber = $("#storge_number").val();
        var newRowNumber = $("#tab1>tbody>tr").length+1; 
		var reg = /^[0-9]*$/;
    	if(!reg.test(storgeNumber) || storgeNumber==""){
    		alert("请数字为整数的入库数量");
    		return false;
    	}
    	if(storgeNumber.length>8){
    		alert("数值最大为99999999");
    		return false;
    	}
    	if(factory==""){
    		alert("请选择厂家");
    		return false;
    	}
    	if(storge_id==""){
    		alert("请输入库单编号");
    		return false;
    	}
    	if(detail==""){
    		alert("请输采购单编号");
    		return false;
    	}
    	if(productionDate==""){
    		alert("请输入生产日期");
    		return false;
    	}
    	if(productionId==""){
    		alert("请输入生产批号");
    		return false;
    	}
    	$.ajax({
    		type:"post",
    		url:"<%=basePath%>/storge/addStorge.action",
    		data:JSON.stringify($("#myForm").serializeJSON()),
			//contentType:"application/json",
			dataType:"json",
    		success : function(res){
    			$('#myForm')[0].reset();
    			$('#storge_id').val(storgeId);
    			alert("tianjiachenggong");
    		},
    		error:function(res){
    			alert("shibai");
    		}
    	});
    	
    	$("#tab1>tbody").append(
        		"<tr><td>"+ newRowNumber +
        		"</td><td>"+detail+"</td>"+
        		"</td><td>"+drugId+"</td>"+
        		"</td><td>"+drugName+"</td>"+
        		"</td><td>"+factory+"</td>"+
        		"</td><td>"+productionDate+"</td>"+
        		"</td><td>"+productionId+"</td>"+
        		"</td><td>"+storgeNumber+"</td></tr>"
        );
	 }
	 
	 
    //根据药名显示信息
    $("#drug_name").on("blur",function(){
    	var drug_name=$("#drug_name").val();
    	console.log(drug_name);
    	$.ajax({
    		type:"post",
    		   url:"<%=basePath%>/storge/showDrugId.action",
    		   data:{"drug_name":drug_name},
    		   dataType:"json",
    		   success:function(res){
    			   var drugList=res;
    			   console.log(drugList.length);
    			   var str="";
    			   if(drugList.length==1){
    				   for(var i=0;i<drugList.length;i++){
        				   str+="<option value='"+drugList[i].DRUG_ID+"'>"+drugList[i].DRUG_ID+"</option>";
        					$("#factory").val(drugList[i].FACTORY);
    				   }
    				   $("#drug_id").html(str);
    			   }else{
    			   for(var i=0;i<drugList.length;i++){
    				   str+="<option value='"+drugList[i].DRUG_ID+"'>"+drugList[i].DRUG_ID+"</option>";
    			   }
    			   $("#drug_id").html("<option>请选择</option>"+str);
    			   }
    		   }
    	});
    	
    }); 
    //提交入库表
    function submitForm(){
    	$.ajax({
			url:"<%=basePath%>/storge/submitStorge.action",
			type: "POST",
			data:{
				"storge_id":$("#storge_id").val(),
				"admin_id":$("#admin_id").val(),
				},
				success : function(res){
				if(res=='0'){
					alert("提交成功，请联系仓库管理员进行审核");
				}else{
					alert("提交失败失败");
				}
			}
		});
    }
	</script>
	
</html>