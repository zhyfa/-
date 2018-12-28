<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>药品修改价格</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/bootstrap/css/bootstrap.css">
 <link rel="shortcut icon" href="<%=basePath%>/assets/x-admin/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/assets/x-admin/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/x-admin/css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>/assets/x-admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/assets/x-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/assets/x-admin/js/xadmin.js"></script>
</head>


<body>
<h1 style="text-align: center;">药品售价修改</h1>
<table><tr><td>
<label class="input-group">请在下列输入（选择）药品</label> 
</td></tr>
<tr><td>
<input  id="drug1" list="druglist" name="drug" type="text" class="form-control" style="width:200px">
			<datalist id="druglist">
				<c:forEach items="${requestScope.drugs}" var="drug">
			  			<option data-id="${drug.DRUG_ID}">${drug.DRUG_NAME}</option>
			  	</c:forEach>
			</datalist></td><td>
    	<input class="layui-btn" type="button" value="确定" onclick="inputSelect()">
      </tr></table> 	
<table class="table table-hover">
  <caption>药品价格</caption>
  <thead>
    <tr>
      <th>药品名称</th>
      <th>售价</th>
      <th>当前折扣</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody id="drugbody">
  </tbody>
</table>
</body>
<script type="text/javascript">
function  inputSelect(){
    var $options=$("#druglist").children();
	 for(var i=0;i<$options.length;i++){
         if($options.eq(i).val().trim()==$("#drug1").val().trim()){
             console.log("???????"+$options.eq(i).attr("data-id"))
             var drugid=$options.eq(i).attr("data-id");
         }
     }
	
	var drugname=$('#drug1').val();
	console.log("name="+drugname);
	if(drugname==null||drugname==""||drugid==""||drugid==null){
		  alert("提交的数据不能为空");
		return;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/daily/qurydrugbyid.action",
		dataType : "JSON",
		data : {"drugid":drugid},
		success : function(data) {
			console.log(data);
			var str2="";
	   			str2+="<tr><td>"+data.DRUG_NAME+"</td>"+
	   			"<td><input type='text' value="+data.PRICE+" id='price'/></td>"+
	   			"<td><input type='text' value="+data.DISCOUNT+" id='discount'/></td>"+
	   			"<td><input type='button' onclick='update()' value='确定 '/></td>"+
	   			"<td><input type='hidden' value="+data.DRUG_ID+"  id='priceid' /></td>"+
	   			"</tr>"
	   			console.log(str2);
			$("#drugbody").html(str2);
		},
});
}



function  update(){
	 var drugid=$('#priceid').val();
	 var price=$('#price').val();
	 var discount=$('#discount').val();
	 console.log("drugid:"+drugid);
	 console.log("price:"+price);
	 console.log("discount:"+discount);
	 $.ajax({
			type : "post",
			url : "<%=basePath%>/daily/updateDrugprice.action",
			dataType : "JSON",
			data : {"drug_id":drugid,"price":price,"discount":discount},
			success : function(data) {
				if(data=="1"){
					alert("修改成功");
					window.location.href ="<%=basePath%>/daily/readjust.action";
				}else{
					alert("修改失败");
				}
			},
			});
	
}

   </script>
</html>