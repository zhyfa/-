<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>药房申请药品页面</title>
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
 .infoTb th{ text-align:left;  border:0.5px solid #E6E6FA;} 
 .infoTb td{text-align:left; border:0.5px solid #E6E6FA;padding-left:3px}
 .infoTb select{border:10px}
 input{width:120px;height:30px; border:0px ;border-radius: 3px 3px 3px 3px;}
 caption{padding-left:15%}
 span{color:red}
.checkBox{width:18px;}
 table { white-space: nowrap; width: 95%;font-size: 14px; border:1px solid #E6E6FA;border-collapse:collapse;
}
 #tab1 th{text-align:center;  border:0.5px solid #E6E6FA;background-color:#DCDCDC;} 
 td{text-align:center; border:0.5px solid #E6E6FA;padding-left:3px}

#con{margin-left:5%;margin-top:50px} 
</style>
<body>
<%-- <a href="<%=basePath%>/pharmacyApply/pharmacy_apply_list.action">前往基准表列表页</a><br />
<a href="<%=basePath%>/pharmacyApply/pharmacy_apply_list2.action">前往待确认列表页</a><br />
<a href="<%=basePath%>/pharmacyApply/pharmacy_apply_list3.action">前往已确认列表页</a> --%>
	<div id="con">
	<form id="myForm">
		<table class="infoTb" cellspacing="1">
			<tr>
				<td colspan="10">
				
				</td>
			</tr>
			<tr>
				<th>药品名称：</th>
				<td><select id="drug_name" name="drug_name">
						<option value="">请选择</option>
						<c:forEach items="${requestScope.drugList}" var="drugs">
							<option value="${drugs.DRUG_ID}">${drugs.DRUG_NAME}</option>
						</c:forEach>
				</select></td>
				<th>药品ID：</th>
				<td><input type="text" id="drug_id" name="drug_id" readonly="readonly" />
				<th>是否特殊药品：</th>
				<td><input type="text" id="psycho" name="psychotropics" readonly="readonly" /> 
				<th>申请总量</th>
				<td><input type="text" id="total" name="drug_number"></td>
				<th>药库该药品库存总量</th>
				<td><input type="text" id="allnumber" name="allnumber" readonly="readonly"></td>
			</tr>
		</table>
	</form>
	<div class="table_toolbar" >
		<button class="layui-btn" onclick="AddRow();"><i class="layui-icon">&#xe608;</i>添加</button>
		<button class="layui-btn layui-btn-danger" onclick="DelRow();"><i class="layui-icon">&#xe640;</i>删除</button>
		<button class="layui-btn" onclick="add()"><i class="layui-icon">&#xe605;</i>提交申请</button>
		<a class="layui-btn" href="<%=basePath%>/pharmacyApply/pharmacy_apply_list.action">前往基准表列表页</a>
		<a class="layui-btn" href="<%=basePath%>/pharmacyApply/pharmacy_apply_list2.action">前往待确认列表页</a>
		<a class="layui-btn" href="<%=basePath%>/pharmacyApply/pharmacy_apply_list3.action">前往已确认列表页</a>
	</div>
	<div class="">
		<input type="hidden" id="hid" name="hid" />
		<table id="tab1">
			<thead>
				<tr>
					<th width="10px"><input type="checkbox" class="checkBox"
						title="全选" />
					</th>
					<th>序号</th>
					<th>药品名称</th>
					<th>药品ID</th>
					<th>是否特殊药品</th>
					<th>总量</th>
				</tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
	</div>
	<p>
	<div id="result"></div>
	</p>
</body>
<script type="text/javascript">
		var list1=new Array();
		var list2=new Array();
        //添加行
        function AddRow() {        	
			var obj=document.getElementById('drug_name');
			var text=obj.options[obj.selectedIndex].text;//获取文本
        	var drug_id=$("#drug_id").val();
			var psycho = $("#psycho").val();
			var total =(Number)($("#total").val());
			var allnumber =(Number)($("#allnumber").val());
			if(total>allnumber){
				alert("申请总量大于库存总量！");
				return;
			}
			if(total==""){
				alert("请输入申请数量");
				return;
			}
			var newRowNumber = $("#tab1>tbody>tr").length+1;
            $("#tab1>tbody").append(
            		"<tr><td><input type='checkbox' class='checkBox' name='dateItem' /></td><td>"
            		+ newRowNumber +
            		"</td><td>"+text+"</td>"+
            		"</td><td>"+drug_id+"</td>"+
            		"</td><td>"+psycho+"</td>"+
            		"</td><td>"+total+"</td></tr>"
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
        
 
        
        function creatImage(){
        	var rowCount = $("#tab1>tbody>tr").length;
        	var mytable = document.getElementById("tab1");
            var state = [];
            var a=[];
            var rows = $("#tab1>tbody>tr").length;
            for(var i=1; i<rows+1; i++){
              for(var j=2; j<12; j++){
                if(!state[i]){
                	state[i] = new Array();
                }
                state[i][j] = mytable.rows[i].cells[j].innerText;
              }
              a.push({i:state[i]});
              var b=JSON.stringify(a)
        }
              console.log(b+"");
        	$.ajax({
        		type:"post",
        		url:"<%=basePath%>/exportTable/exportTable.action",
//         		contentType: "application/json; charset=UTF-8",
        		dataType:"JSON",
        		data:b,
        		success:function(data){
        			alert(data);
        		}
        	});
        }
        //药品名发现改变时，搜索该新的药名的看它是否特殊药
    	  $( "#drug_name" ).change(function(){
    	    	if($("#drug_name").val()!=''||$("#drug_name").val()!=null){
    	    		$("#psycho").val("")
    	    		$("#allnumber").val("")
    	    		$("#total").val("")
    	    		searchById();
    	   	 	}
    		})
    function searchById() {
        	//搜索该药品是否特殊药
    		  $.ajax({
    				type:"post",
    				url:"<%=basePath%>/drug/searchById.action",
    				data:{"drug_id":$( "#drug_name" ).val()},
    				success:function(data){
    						$("#psycho").val(data.PSYCHOTROPICS);
    						$("#drug_id").val(data.DRUG_ID);
    						//搜索该药品在药库的库存量
    			    		  $.ajax({
    			  				type:"post",
    			  				url:"<%=basePath%>/stock/drugNumById.action",
    			  				data:{"drug_id":$( "#drug_name" ).val()},
    			  				success:function(data){
    			  						$("#allnumber").val(data);
    			  				}
    			  			});
    				}
    			});
    		
	}
        
        
     function add() {
    	 
    	var table = document.getElementById("tab1");
    	var tr;
    	var JSONtext='';
    	var dataArray = new Array();
		for(var i=1;i<table.rows.length;i++){
    		date = new Object();
    		tr = table.rows[i];
			date.Code = tr.childNodes[1].innerHTML;
			date.name = tr.childNodes[2].innerHTML;
			date.drug_id = tr.childNodes[3].innerHTML;
    		date.psychotropics  = tr.childNodes[4].innerHTML;
    		date.drug_number  = tr.childNodes[5].innerHTML;
    		//将table表对象转换成数组装成json放在数组里
    		JSONtext+="]"+JSON.stringify(date);
    		}
		$.ajax({
			url : "<%=basePath%>/pharmacyApply/addPharmacyApply.action",
			type: "POST",
			data:{"JSONtext":JSONtext},
			success : function(res) {
				if(res==0){
					alert("添加成功");
				}
				if(res==1){
					alert("添加失败");
				}
				//跳转至药房端的申请药品列表页
				window.location.href="<%=basePath%>/pharmacyApply/pharmacy_apply_list.action";
			}
		})
	}
</script>
</html>