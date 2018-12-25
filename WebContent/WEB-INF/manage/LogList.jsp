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
<title>日志查看管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/js/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/lib/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/assets/lib/layui/css/layui.css"  media="all">
<script type="text/javascript" src="<%=basePath%>/assets/js/xadmin.js"></script>
	<link rel="stylesheet" href="<%=basePath%>/js/jqueryUI/jquery-ui.min.css">
	<script type="text/javascript" src="<%=basePath%>/js/jqueryUI/jquery-ui.min.js"></script>
</head>
<style>
.info{margin-top:20px}
.info input{width:180px;height:35px; border:0.5px solid #E6E6FA;border-radius: 3px 3px 3px 3px;margin-top:5px}
.info .td{text-align:left;font-size:16px}
#page{font-size:16px;}
</style>

<body>
	<h1 style="text-align: center;">日志查看</h1>

	<div >
		<form id="queryadmin" >
			<div class="info">
				<table>
				<tr>
					<td class="td">姓名： </td>
					<td> <input type="text"  placeholder="请输入需要查询的姓名" name="admin_name" id="adminname"></td>
					<td class="td">操作： </td>
					<td><input type="text"  placeholder="请输入需要查询的操作" name="log_operation" id="log_operation"></td>
					<td class="td">开始日期： </td>
					<td><input   type="text" id="datepicker" name="startdata"></td>
					<td class="td">结束日期： </td>
					<td><input  type="text" id="datepickerend" name="enddata">
					<button class="layui-btn "  onclick="queryadmin()"><i class="layui-icon ">&#xe615;</i>搜索</button></td>
				</tr>
				<!--<tr>
				<td> <input type="button"  data-toggle="button" value="查询"> -->
				
				</table>
			</div>
			
		</form>
	</div >
	

			<table class="table table-hover"  style="border: 1px solid color:red">
					<thead>
						<tr>
							<th>序号</th>
							<th>操作人员姓名</th>
							<th>操作</th>
							<th>日期</th>
						</tr>
					</thead>
							<tbody id="body">
							<c:forEach items="${page.queryList}" var="log" varStatus="st">
								<tr>
									<td>${st.count}</td>
									<td>${log.ADMIN_NAME}</td>
									<td>${log.LOG_OPERATION}</td>
									<td>${log.LOG_CDATE}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
	<ul class="pagination pagination-lg" id="changepage">
		<li><a onclick="up()">&laquo;</a></li>
		<c:forEach items="${page.pageShu}" var="pageshu">
			<li><a onclick="addTabs(this)">${pageshu}</a></li>
		</c:forEach>
		
		<li><a onclick="next()">&raquo;</a></li>
		<%-- <li id="page">共${page.totalPage}页，当前第${page.page}页</li> --%>
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
    this.allqurry(page,pageTwo);
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
		   this.allqurry(page,pageTwo);
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
		   this.allqurry(page,pageTwo);
	   }
}



function queryadmin(){
	this.allqurry(1,1);
}

function allqurry(page,pagetwo){
	var adminname=$("#adminname").val();
	var operation=$("#log_operation").val();
	var startdata=$("#datepicker").val();
	console.log("startdata:"+startdata)
		var enddata=$("#datepickerend").val();
	console.log("enddata:"+enddata)
			if(startdata!=null&&enddata!=null){
				console.log("不空");
				var start=new Date(startdata.replace("-", "/").replace("-", "/"));
		    	var end=new Date(enddata.replace("-", "/").replace("-", "/"));
				if(start>end){
					console.log("小于");
					alert("开始日期不能小于结束日期  ");
					$("#datepickerend").val("");
					return;
				}
			}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/log/quryLogbysome.action",
		dataType : "JSON",
		data : {
				"dqpage":page,
				"pageTwo":pagetwo,
				"startdata":startdata,
				"enddata":enddata,
				"adminname":adminname,
				"operation":operation
				},
		success : function(data) {
			console.log(data)
				var str="";
				for(var a=0 ;a<data.queryList.length;a++){
					str+="<tr>"+
					"<td>"+data.queryList[a].R+"</td>"+
					"<td>"+data.queryList[a].ADMIN_NAME+"</td>"+
			  		"<td>"+data.queryList[a].LOG_OPERATION+"</td>"+
			  		"<td>"+data.queryList[a].LOG_CDATE+"</td>"+
				"</tr>"
				}
				console.log("sss："+str+":SSS");
				$("#body").html(str);
				
				var str1="";
		           var str2="";
		           str1+="<li><a onclick='up()'>&laquo;</a></li>"
		   		
		   		for(var a=0 ;a<data.pageShu.length;a++){
		   			str2+="<li><a onclick='addTabs(this)'>"+data.pageShu[a]+"</a></li>"
		   		}
		   		str1+=str2+"<li><a onclick='next()'>&raquo;</a></li>"+
		   	"<input type='hidden' name='pageTwo' value='"+data.pageTwo+"' id='pageT'>"+
		   	"<input type='hidden' value='"+data.totalPageTwo+"' id='totalPageTwo'>"
		         
		    $("#changepage").html(str1); 
			
			
		},
		});
}


$(function() {
	$("#datepicker").datepicker({
		maxDate : "+0"
	});
});
$(function() {
	$("#datepickerend").datepicker({
		maxDate : "+0"
	});
});  

   </script>
   
</html>