<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>智慧药房管理</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="shortcut icon" href="<%=basePath%>/assets/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>

</head>
<style>
 .infoTb table { white-space: nowrap; width: 95%;font-size: 16px; 
} 
.info tr{background-color:#DCDCDC;}
 .infoTb th{ text-align:left; font-family:"微软雅黑"; border:0.5px solid #E6E6FA;} 
 .infoTb td{text-align:left; border:0.5px solid #E6E6FA;padding-left:3px}
 .infoTb select{border:10px}
 input{width:120px;height:30px; border:0px ;border-radius: 3px 3px 3px 3px;}
 caption{padding-left:15%}
 span{color:red}
.checkBox{width:18px;}
 table { white-space: nowrap; width: 95%;font-size: 14px; border:1px solid #E6E6FA;border-collapse:collapse;
}
 #tab1 th{text-align:center; font-family:"微软雅黑"; border:0.5px solid #E6E6FA; background-color:#DCDCDC;} 
 td{text-align:center; border:0.5px solid #E6E6FA;padding-left:3px}
#con{margin-left:5%;margin-top:50px}  
</style>
<body>
	<div id="con">
<!-- <input type="button" value="查看采购图形表" onclick="getChart()"> -->

<form id="myForm">
	<input type="hidden" value="${sessionScope.admin.admin_id}" name="admin_id" id="admin_id">
	<table class="infoTb" cellspacing="1">
	
		<tr >
			<th>编号：</th>
			<td colspan="7"><input type="text" id="auditsdetail_id" name="auditsdetail_id"/></td>
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
	     	<th>是否特殊药品：</th>
	       	<td>
	       		<input id="psycho" name="psycho" readonly="readonly" value="">
	       	</td>
			<th>药品种类：</th>    
	        <td>
	        	<input id="drug_type" name="drug_type" readonly="readonly" value="">
			</td>
			</tr>
			<tr>
	         <th>  规格：</th>
	        	<td>
			    <input id="spec" name="spec" readonly="readonly" value="">
				</td>
			<th>单位：</th>
			<td>
				<input id="drug_unit" name="drug_unit" readonly="readonly" value="">
			</td>
			<th>  单位数量：</th>
	        <td><input type="text" id="per_piece" name="per_piece" value="" readonly="readonly"/></td>
			<th>单价：</th>
			<td><input type="text" id="price" name="price"/></td>
		</tr>
	    <tr>
			<th>主治症状：</th>
			<td><input type="text" id="sicks" name="sicks" value="" readonly="readonly"/></td>
	         	<th> 生产厂家：</th>
	    <td><select id="factory" name="factory">
			<option value="">请选择</option>
			<c:forEach items="${requestScope.factoris}" var="fac">
				<option value="${fac.FACTORY_NAME}" >${fac.FACTORY_NAME}</option>
			</c:forEach>
		</select>
		</td>
		<th>保质期：</th>
		<td >
			<input type="text" id="irradiated" list="invals" name="irradiated">
			 <datalist id="invals">
			 	<option value="一个月"></option>
			 	<option value="三个月"></option>
			 	<option value="六个月"></option>
			 	<option value="一年"></option>
			 	<option value="一年半"></option>
			 	<option value="两年"></option>
			 </datalist>
			</td>
			<th>采购数量</th>
			<td>
				<input type="text" id="total" name="total">
			</td>
	    </tr>
	    <tr>
	    	<th>总价</th>
	    	<td colspan="7"><input type="text" id="total_price" name="total_price"  readonly="readonly"></td>
	    </tr>
	    </table>
	    
</form>	
<div class="table_toolbar">
                <button type="button" class="layui-btn" onclick="AddRow();" ><i class="layui-icon ">&#xe642;</i>添加</button>
                <button type="button" class="layui-btn layui-btn-danger" onclick="DelRow();" ><i class="layui-icon ">&#xe640;</i> 删除</button>
                <button type="button" class="layui-btn"  onclick="submitForm()"><i class="layui-icon ">&#xe605;</i>提交</button>
                <button type="button" class="layui-btn"  onclick="submitTable()"><i class="layui-icon ">&#xe609;</i>导出</button>
            	<button type="button" class="layui-btn layui-btn-normal" onclick="getChart()"><i class="layui-icon ">&#xe62c;</i>查看采购图形表</button>
            </div>
            <div class="">
                <input type="hidden" id="hid" name="hid" />    
                 <table id="tab1">
                    <thead>
                        <tr>
                            <td width="10px"><input type="checkbox" class="checkBox" title="全选" /></td>
                            <th>序号</th>
							<th>药品编号</th>
							<th>药品名称</th>
							<th>是否特殊药品</th>
							<th>药品种类</th>
							<th>规格</th>
							<th>单位</th>
							<th>单位数量</th>
							<th>单价</th>
							<th>主治症状</th>
							<th>生产厂家</th>
							<th>保质期</th>
							<th>数量</th>
							<th>总价</th>
                        </tr>
                    </thead>
                     <tbody id="tbody"></tbody>
                </table>
            </div>
</div>
</body>
<script type="text/javascript">
        //添加行
        function AddRow() {
        	var detail =$("#auditsdetail_id").val();
        	var id = $("#drug_id").val();
			var name = $("#drug_name").val();
			var psycho = $("#psycho").val();
			var drugType = $("#drug_type").val();
			var spec = $("#spec").val();
			var drugUnit = $("#drug_unit").val();
			var perPiece = $("#per_piece").val();
			var price = $("#price").val();
			var sicks = $("#sicks").val();
			var factory = $("#factory").val();
			var irradiated =$("#irradiated").val();
			var total =$("#total").val();
			var totalPrice=$("#total_price").val();
			var totalP = price*total
            var newRowNumber = $("#tab1>tbody>tr").length+1;
			var reg = /^[0-9]*$/;
        	if(!reg.test(price) || price==""){
        		alert("请数字为整数的单价");
        		return false;
        	}
        	if(price.length>8){
        		alert("数值最大为99999999");
        		return false;
        	}
        	if(factory==""){
        		alert("请选择厂家");
        		return false;
        	}
        	if(total==""||!reg.test(total)){
        		alert("请输入采购数量，内容限为整数");
        		return false;
        	}
        	if(total.length>8){
        		alert("数值最大为99999999");
        		return false;
        	}
        	if(irradiated==""){
        		alert("请输入药品保质期");
        		return false;
        	}
        	$.ajax({
        		type:"POST",
        		url:"<%=basePath%>/stock/addOrder.action",
        		data:JSON.stringify($("#myForm").serializeJSON()),
    			//contentType:"application/json",
    			dataType:"json",
        		success : function(res){
        			$('#myForm')[0].reset();
        			$('#auditsdetail_id').val(detail);
        			alert("tianjiachenggong");
        		},
        		error:function(res){
        			alert("shibai");
        		}
        	});
        	
            $("#tab1>tbody").append(
            		"<tr><td><input type='checkbox' class='checkBox' name='dateItem' /></td><td>"
            		+ newRowNumber +
            		"</td><td>"+id+"</td>"+
            		"</td><td>"+name+"</td>"+
            		"</td><td>"+psycho+"</td>"+
            		"</td><td>"+drugType+"</td>"+
            		"</td><td>"+spec+"</td>"+
            		"</td><td>"+drugUnit+"</td>"+
            		"</td><td>"+perPiece+"</td>"+
            		"</td><td>"+price+"</td>"+
            		"</td><td>"+sicks+"</td>"+
            		"</td><td>"+factory+"</td>"+
            		"</td><td>"+irradiated+"</td>"+
            		"</td><td>"+total+"</td>"+
            		"</td><td>"+totalP+"</td></tr>"
            );
            
        }
        //删除行
        function DelRow() {
            var rowCount = $("#tab1>tbody>tr").length;
            var checkedCounts = $("input[type='checkbox'][name='dateItem']:checked").length;
            if (checkedCounts > 0 && checkedCounts != rowCount) {
                  $("input[type='checkbox'][name='dateItem']:checked").each(function () {
                      $(this).parents("tr").remove();
                   });
                   ResetOrder(); //刷新表序号
            }
            else if (checkedCounts == 0) {
               alert("请选择要删除的行!");
            }
             else if(checkedCounts == rowCount) {
                alert("至少保留一行!");
            } 
        }
        //刷新表序号
        function ResetOrder() {
            var rowCount = $("#tab1>tbody>tr").length;
            for(var i=0;i<rowCount;i++){
                $("#tab1>tbody>tr:eq("+i+")>td:eq(1)").html(i+1);
            }
         }
        
        //提交审批表
        function submitForm(){
        	$.ajax({
    			url:"<%=basePath%>/stock/submitAudits.action",
    			type: "POST",
    			data:{
    				"auditsdetail_id":$("#auditsdetail_id").val(),
    				"admin_id":$("#admin_id").val(),
    				},
    				success : function(res){
    				if(res=='0'){
    					alert("提交成功，请联系管理员进行审核");
    				}else{
    					alert("提交失败失败");
    				}
    			}
    		});
        }
        //导出水印审批单
        function submitTable(){
        	var sy=prompt("请输入水印内容");
        	if(sy!=null&&sy!=""){
            var that = this; 
            //多窗口模式，层叠置顶
            layer.open({
              type: 2 //此处以iframe举例
              ,title: '采购单预览'
              ,area: ['600px', '400px']
              ,shade: 0
              ,maxmin: true
              
              ,content: '<%=basePath%>/stock/creatImage.action?sy='+sy
            });
        	}
          }
        //根据药名显示信息
        $("#drug_name").on("blur",function(){
        	var drug_name=$("#drug_name").val();
        	console.log(drug_name);
        	$.ajax({
        		type:"post",
        		   url:"<%=basePath%>/stock/showDrugId.action",
        		   data:{"drug_name":drug_name},
        		   dataType:"json",
        		   success:function(res){
        			   var drugList=res;
        			   console.log(drugList.length);
        			   
        			   var str="";
        			   if(drugList.length==1){
        				   for(var i=0;i<drugList.length;i++){
            				   str+="<option value='"+drugList[i].DRUG_ID+"'>"+drugList[i].DRUG_ID+"</option>";
        				  	$("#psycho").val(drugList[i].PSYCHOTROPICS);
        					$("#drug_type").val(drugList[i].SMALLTYPE_NAME);
        					if(drugList[i].SPEC==1){
        					$("#spec").val("盒");
        					}else{
        						$("#spec").val("瓶");
        					}
        					$("#drug_unit").val(drugList[i].DRUG_UNIT);
        					$("#per_piece").val(drugList[i].DRUG_SIZE);
        					$("#sicks").val(drugList[i].ILLUSTRATE);
        					
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
        //根据id显示药品信息
        function chooseId(){
        	$.ajax({
    			url:"<%=basePath%>/stock/showDrugDetail.action",
    			type: "POST",
    			data:{
    				"drug_id":$("#drug_id").val(),
    				},
    				success : function(res){
    				var drug = res;
    				$("#psycho").val(drug.PSYCHOTROPICS);
					$("#drug_type").val(drug.SMALLTYPE_NAME);
					if(drug.SPEC==1){
					$("#spec").val("盒");
					}else{
						$("#spec").val("瓶");
					}
					$("#drug_unit").val(drug.DRUG_UNIT);
					$("#per_piece").val(drug.DRUG_SIZE);
					$("#sicks").val(drug.ILLUSTRATE);
    			}
    		});
        }
        //计算总价
        $("#total").on("blur",function(){ 
            var total =$("#total").val();
            console.log(total);
            var price = $("#price").val();
            console.log(price);
            var totalP =total*price;
            $("#total_price").val(totalP);
            console.log(totalP); 
        });
      //计算总价
        $("#price").on("blur",function(){ 
            var total =$("#total").val();
            console.log(total);
            var price = $("#price").val();
            console.log(price);
            var totalP =total*price;
            $("#total_price").val(totalP);
            console.log(totalP); 
        });
//进入采购图形统计页面
function getChart(){
	window.location.href="<%=basePath%>/stock/goStockChartJSP.action";
}
    </script>
</html>