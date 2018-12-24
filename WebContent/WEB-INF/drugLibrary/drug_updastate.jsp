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
<h1 style="text-align: center;">药品禁用修改</h1>
<input  id="drug1" list="druglist" name="drug" type="text" class="form-control">
			<datalist id="druglist">
				<c:forEach items="${requestScope.page.queryList}" var="drug">
			  			<option data-id="${drug.DRUG_ID}">${drug.DRUG_NAME}</option>
			  	</c:forEach>
			</datalist>
    	<input type="button" value="查看" onclick="inputSelect()">
<table class="table table-hover">
  <caption>药品信息</caption>
  <thead>
    <tr>
    	<th>药品ID</th>
      <th>药品名称</th>
      <th>售价</th>
      <th>特殊药属性</th>
      <th>药效</th>
      <th>状态</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody id="drugbody">
  		<c:forEach items="${requestScope.page.queryList}" var="drug1">
			  			<tr>
			  			<td>${drug1.DRUG_ID}</td>
			  			<td>${drug1.DRUG_NAME}</td>
			  			<td>${drug1.PRICE}</td>
			  			<td>${drug1.PSYCHOTROPICS}</td>
			  			<td>${drug1.ILLUSTRATE}</td>
			  			<c:if test="${drug1.STATE==1}">
			  				<td>可用</td>
			  				<td><input type="button" value="禁用" onclick="changedata(${drug1.DRUG_ID},${drug1.STATE})" ></td>
			  			</c:if>
			  			<c:if test="${drug1.STATE==2}">
			  				<td>不可用</td>
			  			<td><input type="button" value="启用" onclick="changedata(${drug1.DRUG_ID},${drug1.STATE})" ></td>
			  			</c:if>
			  			</tr>
			  	</c:forEach>
	</tbody>
</table>
<ul class="pagination pagination-lg" id="changepage">
		<li><a onclick="up()">&laquo;</a></li>
		
		<c:forEach items="${page.pageShu}" var="pageshu">
			<li ><a onclick="addTabs(this)">${pageshu}</a></li>
		</c:forEach>
		
		<li><a onclick="next()">&raquo;</a></li>
		<li>共${page.totalPage}页，当前第${page.page}页</li>
	</ul>
	<input type="hidden" name="pageTwo" value="${page.pageTwo}" id="pageT">
	<input type="hidden" value="${page.totalPageTwo}" id="totalPageTwo">
</body>
<script type="text/javascript">

function addTabs(obj) {
	   console.log(obj);
    var page = (Number)($(obj).text());
    var pageTwo=(Number)($("#pageT").attr("value"));
    console.log(page);
    console.log(pageTwo);
    this.qyerybyall(page,pageTwo);
}

function next(){
	   var pageTwo=(Number)($("#pageT").attr("value"));
	   var totalPageTwo=(Number)($("#totalPageTwo").attr("value"));
	   if(pageTwo>=totalPageTwo){
		   alert("没有更多页了！");
	   }else{
		   pageTwo++;
		   var page=(pageTwo-1)*5+1;
		   alert(pageTwo);
		   this.qyerybyall(page,pageTwo);
	   }
	   
}

function up(){
	   var pageTwo=(Number)($("#pageT").attr("value"));
	   var totalPageTwo=(Number)($("#totalPageTwo").attr("value"));
	   if(pageTwo<=1){
		   alert("没有更多页了！");
	   }else{
		   pageTwo--;
		   var page=(pageTwo-1)*5+1;
		   alert(pageTwo);
		   this.qyerybyall(page,pageTwo);
	   }
	   
}

function inputSelect(){
		this.qyerybyall(1,1)
		}
/* 通用的方法  */
function qyerybyall(page,pageTwo){
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
		drugid=0;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/daily/qurypagedrugbyid.action",
		dataType : "JSON",
		data : {"drugid":drugid,"dqpage":page,"pageTwo":pageTwo},
		success : function(data) {
			console.log(data);
			var str="";
			for(var a=0 ;a<data.queryList.length;a++){
				str+="<tr>"+
		  		"<td>"+data.queryList[a].DRUG_ID+"</td>"+
		  		"<td>"+data.queryList[a].DRUG_NAME+"</td>"+
		  		"<td>"+data.queryList[a].PRICE+"</td>"+
		  		"<td>"+data.queryList[a].PSYCHOTROPICS+"</td>"+
		  		"<td>"+data.queryList[a].ILLUSTRATE+"</td>"
		  		if(data.queryList[a].STATE==1){
		  			str+="<td>可用</td>"+
		  			"<td><input type='button' value='禁用 '  onclick='changedata("+data.queryList[a].DRUG_ID+","+data.queryList[a].STATE+")' /></td> </tr>"
		  		}else{
		  			str+="<td>不可用 </td>"+
		  			"<td><input type='button' value='启用 '  onclick='changedata("+data.queryList[a].DRUG_ID+","+data.queryList[a].STATE+")' /></td> </tr>"
			  		}
		  		
				}
	   			console.log(str);
			$("#drugbody").html(str);
			
			
			
			 var str1="";
	           var str2="";
	           str1+="<li><a onclick='up()'>&laquo;</a></li>"
	   		
	   		for(var a=0 ;a<data.pageShu.length;a++){
	   			str2+="<li><a onclick='addTabs(this)'>"+data.pageShu[a]+"</a></li>"
	   		}
	   		str1+=str2+"<li><a onclick='next()'>&raquo;</a></li>"+
	   		"<li>共"+data.totalPage+"页，当前第"+data.page+"页</li>"+
	   	"<input type='hidden' name='pageTwo' value='"+data.pageTwo+"' id='pageT'>"+
	   	"<input type='hidden' value='"+data.totalPageTwo+"' id='totalPageTwo'>"
	         
	    $("#changepage").html(str1); 
		},
});
}



function  changedata(drugid,state){
	if(state==1){
		state=2;
	}else if (state==2){
		state=1;
	}
	
	 $.ajax({
			type : "post",
			url : "<%=basePath%>/daily/updateDrugstate.action",
			dataType : "JSON",
			data : {"drug_id":drugid,"state":state},
			success : function(data) {
				if(data=="1"){
					alert("修改成功");
					window.location.href ="<%=basePath%>/daily/blockUp.action";
				}else{
					alert("修改失败");
				}
			},
			});
	
}

   </script>
</html>