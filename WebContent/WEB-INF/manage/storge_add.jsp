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
<link rel="shortcut icon"
	href="<%=basePath%>/assets/favicon.ico"
	type="image/x-icon" />
<script type="text/javascript"
	src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script
	src="<%=basePath%>/assets/lib/layui/layui.js"
	charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/js/xadmin.js"></script>
</head>
<style>
 .infoTb table { white-space: nowrap; width: 90%;font-size: 14px; 
} 
.info tr{background-color:#DCDCDC;}
 .infoTb th{ text-align:left; font-family:"微软雅黑"; border:0.5px solid #E6E6FA;} 
 .infoTb td{text-align:left; border:0.5px solid #E6E6FA;}
 .infoTb select{border:10px}
 input{width:120px;height:30px; border:0px ;border-radius: 3px 3px 3px 3px;}
 caption{padding-left:15%}
 button{border:0px solid #dae6f0; width:80px; height:35px; margin-left:15%}
 span{color:red}
 .btn_opt{border:0px solid #dae6f0; width:60px; height:25px;margin-right:3px}
.checkBox{width:18px;}
 table { white-space: nowrap; width: 90%;font-size: 14px; border:1px solid #E6E6FA;border-collapse:collapse;
}  
</style>
<body>
	<p>
<form id="myForm">
	<table class="infoTb" cellspacing="1">
		<tr background-color="#E6E6FA">
			<th>编号：</th>
			<td colspan="7"><input type="text" id="count" /></td>
		</tr>
		<tr>
		<th>药品编号：</th>
	       <td><input type="text" id="drug_id" name="drug_id" list="drug_ids"/> 
	         <datalist id="drug_ids">
	          <c:forEach items="${requestScope.drugList}" var="drugs">
					<option value="${drugs.DRUG_ID}">${drugs.DRUG_ID}</option>
				</c:forEach>
	         </datalist>
	         </td>
			<th>药品名称：</th>
	        <td>
	        	 <input type="text" id="drug_name" list="drug_names" name="drug_name" />
	         <datalist id="drug_names">
	          	<c:forEach items="${requestScope.drugList}" var="drugs">
					<option value="${drugs.DRUG_NAME}">${drugs.DRUG_NAME}</option>
				</c:forEach>
	         </datalist>
	        </td>
	     	<th>是否特殊药品：</th>
	       	<td>
	       		<select id="psycho" name="psycho">
					<option value="否">否</option>
					<option value="是">是</option>
					</select>
	       	</td>
			<th>药品种类：</th>    
	        <td>
	        	<select id="durg_type" name="durg_type">
					<option value="">请选择</option>
					<c:forEach items="${requestScope.secondType}" var="type">
						<option value="${type.SMALLTYPE_ID}" >${type.SMALLTYPE_NAME}</option>
					</c:forEach>
				</select>
			</td>
			</tr>
			<tr>
	         <th>  规格：</th>
	        	<td>
			    <select id="spec" name="spec">
					<option value="瓶">瓶</option>
					<option value="盒">盒</option>
					<option value="包">付</option>
			    	<option value=""> </option>
				</select>
				</td>
			<th>单位：</th>
			<td>
				<select id="drug_unit" name="drug_unit">
					<option value="颗">颗</option>
					<option value="包">包</option>
					<option value="付">付</option>
					<option value="毫升">毫升</option>
				</select>
			</td>
			<th>  单位数量：</th>
	        <td><input type="text" id="per_piece" name="per_piece"/></td>
			<th>单价：</th>
			<td><input type="text" id="price" name="price"/></td>
		</tr>
	    <tr>
			<th>主治症状：</th>
			<td><input type="text" id="sicks" name="sicks"/><br></td>
	         	<th> 生产厂家：</th>
	    <td><select id="factory" name="factory">
			<option>请选择</option>
			<c:forEach items="${requestScope.factoris}" var="fac">
				<option value="${fac.FACTORY_NAME}" >${fac.FACTORY_NAME}</option>
			</c:forEach>
		</select>
		</td>
		<th>保质期：</th>
		<td >
			<input type="text" id="irradiated" list="invals" name="iraradiated">
			 <datalist id="invals">
			 	<option value="一个月"></option>
			 	<option value="三个月"></option>
			 	<option value="六个月"></option>
			 	<option value="一年"></option>
			 	<option value="一年半"></option>
			 	<option value="两年"></option>
			 </datalist>
			</td>
			<th>采购总量</th>
			<td>
				<input type="text" id="total" name="total">
			</td>
	    </tr>
	    <tr>
	    	<th>总价</th>
	    	<td colspan="7"><input type="text" id="totalPrice" name="totalPrice"></td>
	    </tr>
	    </table>
	    </p>
</form>	
<div class="table_toolbar">
                <input type="button"  onclick="DelRow();" value="删除"> 
                <input type="button" onclick="AddRow();" value="添加">
                <input type="button" value="保存" onclick="getTableContent()">
                <input type="button" value="生成采购单" onclick="submitTable()">
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
							<th>总量</th>
							<th>总价</th>
                        </tr>
                    </thead>
                     <tbody id="tbody"></tbody>
                </table>
            </div>
<p><div id="result"></div></p>
</body>
<script type="text/javascript">
        //添加行
        function AddRow() {
        	$.ajax({
        		type:"POST",
        		url:"<%=basePath%>/stock/addOrder.action",
        		data:JSON.stringify($("#myForm").serializeJSON()),
    			//contentType:"application/json",
    			dataType:"json",
        		success : function(res){
        			alert("tianjiachenggong");
        		},
        		error:function(res){
        			alert("shibai");
        		}
        	});
        	var id = $("#drug_id").val();
			var name = $("#drug_name").val();
			var psycho = $("#psycho").val();
			var drugType = $("#durg_type").val();
			var spec = $("#spec").val();
			var drugUnit = $("#drug_unit").val();
			var perPiece = $("#per_piece").val();
			var price = $("#price").val();
			var sicks = $("#sicks").val();
			var factory = $("#factory").val();
			var irradiated =$("#irradiated").val();
			var total =$("#total").val();
			var totalPrice=$("#totalPrice").val();
			var totalP = price*total
            var newRowNumber = $("#tab1>tbody>tr").length+1;
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
        function getTableContent(){
            var mytable = document.getElementById("tab1");
            var data = [];
            var rows = $("#tab1>tbody>tr").length;
            var cells=11;
           
            for(var i=1; i<rows+1; i++){
              for(var j=0; j<12; j++){
                if(!data[i]){
                  data[i] = new Array();
                }
                data[i][j] = mytable.rows[i].cells[j].innerHTML;
              }
            }
            console.log(data);
            return data;
          }
        
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
              ,btn: ['关闭本页'] 
              ,btn2: function(){
                layer.closeAll();
              }
              
              /* ,zIndex: layer.zIndex //重点1
              ,success: function(layero){
                layer.setTop(layero); //重点2
              } */
            });
        	}
          }
        $("#total").on("blur",function(){ 
            var total =$("#total").val();
            console.log(total);
            var price = $("#price").val();
            console.log(price);
            var totalP =total*price;
            $("#totalPrice").val(totalP);
            console.log(totalP); 
        });
        $("#price").on("blur",function(){ 
            var total =$("#total").val();
            console.log(total);
            var price = $("#price").val();
            console.log(price);
            var totalP =total*price;
            $("#totalPrice").val(totalP);
            console.log(totalP); 
        });
        
    </script>
</html>