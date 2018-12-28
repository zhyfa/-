<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
caption{font-size:24px}
#con{margin-top:30px;margin-left:30px}
</style>

<script type="text/javascript">

$(document).ready(function(){
//选 药品 显示信息
	$("#drug_id").change(function(){
		if($("#drug_id").val()==""){
			$("#saleForm").html("");
		}
		$.ajax({
    		type:"post",
    		url:"<%=basePath%>/daily/getInventoryByIdForSold.action",
			data : {"drug_id" : $("#drug_id").val()},
			dataType : "json",
			success : function(res) {
				var msg = "";
				for (var i = 0; i < res.length; i++) {
					var inventory = res[i];
					msg += "库存id:<input style='text-align:center; width:50px;height:30px; margin-top:10px; border:0px;' name='inventory_id' value='"+inventory.inventory_id+"' readonly='readonly'>&nbsp;";
					msg += "数量：<input style='width:50px; text-align:center; border:0px;' name='inventory_number' id='inventory_number' value='"+inventory.inventory_number+"' readonly='readonly'>&nbsp;";
					msg += inventory.spec==1?'盒':'瓶';
					msg += "  单价：<input style='width:50px; text-align:center; border:0px;' name='price' value='"+inventory.price+"' readonly='readonly'>";
					msg += "元  \&nbsp;&nbsp;折扣："+inventory.discount+"折&nbsp;";
					msg += "&nbsp;&nbsp;销售数量：<input style='width:50px; text-align:center; height:25px; border:0.5px solid #E6E6FA;' name='"+i+"' id='"+i+"' value=''>";
					msg += "&nbsp;"+inventory.psychotropics+"&nbsp;";
					msg += "<a class='layui-btn layui-btn-xs' href='#' id='submit"+i+"' onclick='aaa("+inventory.inventory_id+
							","+inventory.inventory_number+
							","+i+
							")'>出药</a><br>";
				}
				$("#saleForm").html(msg);
			}
		});
	});

});
function aaa(inventory_id,inventory_number,numberid,drug_name){
	var reg = /^[0-9]*$/;
	var saleNum = document.getElementById(numberid).value;
	var drug_name = $("#drug_id").find("option:selected").text();
	var drug_id = $("#drug_id").val();
// 	var price = $("#price").val();
// alert(price);
	if(!reg.test(saleNum) || saleNum=="" || saleNum==null){
		alert("请输入数字");
		return false;
	}
	if(inventory_number<saleNum){
		alert("数量太大！");
		return false;
	}
	
	var arr = new Array();
	var trList = $("tbody").children("tr");
	if(trList.length>0){
		for (var i = 0; i < trList.length; i++) {
		      var tdArr = trList.eq(i).find("td");
		      if(inventory_id == tdArr.eq(1).text()){
		    	  alert("该单号已存在,如需加购，请先移除改单号重新选择数量");
		    	  return false;
		      }
		}
	}
	$("tbody").append("<tr class='item'>"+
				"<td width=50><input type='checkbox' class='cb'></td> "+
				"<td>"+inventory_id+"</td> "+//1
				"<td>"+drug_id+"</td>"+
				"<td>"+drug_name+"</td>"+
				"<td>"+saleNum+"</td>"+
				"</tr>");
	
	var arr = new Array();
	var trList = $("tbody").children("tr");
	if(trList.length>0){
		 for (var i = 0; i < trList.length; i++) {
		      var json = {};
		      var tdArr = trList.eq(i).find("td");
// 		      json.inventory_id = tdArr.eq(1).text();
		      json.drug_id = tdArr.eq(2).text();
// 		      json.saleNum = tdArr.eq(4).text();
		      if (json !=""|| json!="undefined") {
		          arr.push(json);
		 	  };
		 }
	  
		 var arrs=JSON.stringify(arr);
		 $.ajax({
			type:"post",
			url:"<%=basePath%>/daily/checkBanned.action",
			data : {"data":arrs},
			//dataType : "json",
			success : function(res) {
				if (res == 1) {
// 					alert("出单");
				} 
				if (res == 2) {
					alert("禁忌药！");
					$("#asdf tr:last-child").remove();
				} 
			}
		 });
		
	 }
	
}
	function submitOrder(){
		 var arr = new Array();
		 var trList = $("tbody").children("tr");
		 if(trList.length>0){
			 for (var i = 0; i < trList.length; i++) {
			      var json = {};
			      var tdArr = trList.eq(i).find("td");
			      json.inventory_id = tdArr.eq(1).text();
			      json.drug_id = tdArr.eq(2).text();
			      json.saleNum = tdArr.eq(4).text();
			      if (json !=""|| json!="undefined") {
			          arr.push(json);
			 	  };
			 }
		  
	 		 var arrs=JSON.stringify(arr);
			 $.ajax({
				type:"post",
				url:"<%=basePath%>/daily/soldOrder.action",
				data : {"data":arrs},
				//dataType : "json",
				success : function(res) {
					if (res == 1) {
						alert("出药成功");
						window.location.href="<%=basePath%>/daily/dispensing.action";
	// 					$("tbody").html("");
					} else {
						alert("出药失败");
					}
				}
			 });
			
		 }else{
		      alert("请选择")
	     }
	}
    
	function delOrder(){
		var items = $(".cb:checked");
		for(var i=0;i<items.length;i++){
			$(items[i]).parents(".item").remove();
		}
	}
</script>

<body>
<div id="con">
	<div id="drugName">药品:
		<select id="drug_id" name="drug_id" style="width:200px;height:35px;border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;">
			<option value="">请选择药品</option>
			<c:forEach items="${requestScope.inventoryss}" var="inventory">
				<option value="${inventory.drug_id}">${inventory.drug_name}</option>
			</c:forEach>
		</select>
		<div id="msg" >
			<p></p>
		</div>
	</div>
	<form name="saleForm" id="saleForm"></form>
	<form id="myForm">
		<table class="layui-table">
			<caption>订单表</caption>
			<thead>
				<th >选择</th>
				<th >库存id</th>
				<th >药品id</th>
				<th >药品名</th>
				<th >销售数量</th>
<!-- 				<th width=100>单价</th> -->
			</thead>
			<tbody id="asdf">
			</tbody>
		</table>
		<a class="layui-btn layui-btn-danger" onclick="submitOrder()"> <i class="layui-icon">&#xe605;</i>提交订单</a>
		<a class="layui-btn" onclick="delOrder()"> <i class="layui-icon">&#xe640;</i>删除选中订单</a>
	</form>
</div>
</body>

</html>