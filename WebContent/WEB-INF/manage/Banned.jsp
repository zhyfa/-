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
<title>成员详情</title>
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
    
<script type="text/javascript">
function del(){
$(function(){
    $("table#bannedbefor tr").click(function() {
        $(this).remove();
    });
});
}
</script>
</head>
<style>
caption{font-size:24px}
</style>

<body>
<h1 style="text-align: center;">药品配伍禁忌</h1>
<table class="table table-hover">
  <caption>药品配伍禁忌</caption>
  <thead>
    <tr>
      <th>第一种药品</th>
      <th>第二种药品</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input  id="drug1" list="druglist" name="drug" type="text" class="form-control" onchange="inputSelect()">
			<datalist id="druglist">
				<c:forEach items="${requestScope.drugs}" var="drug">
			  			<option data-id="${drug.DRUG_ID}">${drug.DRUG_NAME}</option>
			  	</c:forEach>
			</datalist>
		</td>
      <td>
		<input  id="drug2" list="drugtwo" name="drug2" type="text" class="form-control">
			<datalist id="drugtwo">
			  			<option data-id="0" value="请先选择第一种药品"></option>
			</datalist>
      </td>
      <td>
    	<button class="layui-btn layui-btn-sm" onclick="change()">选择</button>
    	</td>
    	</tr>
  </tbody>
</table>
  <form action="">  	
  <table id="bannedbefor" class="table table-hover">
  	<caption>已选择配伍禁忌的药品</caption>
  	<thead>
  	<tr>
  	<th>第一种药品ID</th>
  	<th>第一种药品</th>
  	<th>第二种药品ID</th>
  	<th>第二种药品</th>
  	<th>操作</th>
  	</tr>
  	</thead>
  	<tbody id="bannedbeforbody">
  	</tbody>
  </table>
  <button type="button" class="layui-btn layui-btn-sm" onclick="update()" >提交</button>
</form>

 <table id="bannedshow" class="table table-hover">
  	<caption>配伍禁忌的药品显示</caption>
  	<thead>
  	<tr>
  	<th>第一种药品ID</th>
  	<th>第一种药品</th>
  	<th>第二种药品ID</th>
  	<th>第二种药品</th>
  	<th>操作</th>
  	</tr>
  	</thead>
  	<tbody id="bannedshowbody">
  	<c:forEach items="${page.queryList}" var="drug"> 
  		<tr>
  		<td>${drug.DRUG_ID}</td>
  		<td>${drug.DRUG_NAME}</td>
  		<td>${drug.DRUG_ID1}</td>
  		<td>${drug.DRUG_NAME1}</td>
  		<td><button class="layui-btn layui-btn-danger layui-btn-xs" onclick="delebanned(${drug.DRUG_ID},${drug.DRUG_ID1})"><i class="layui-icon">&#xe640;</i>删除</button></td>
  		</tr>
  	</c:forEach>
  	</tbody>
  	
  <tr><td><input  id="drug3" list="druglist3" name="drug3" type="text" class="form-control" >
			<datalist id="druglist3">
				<c:forEach items="${requestScope.drugs}" var="drug3">
			  			<option data-id="${drug3.DRUG_ID}">${drug3.DRUG_NAME}</option>
			  	</c:forEach>
			</datalist>
			</td>
			<td><button class="layui-btn layui-btn-sm" onclick="qyerybanned()">查找已配置的禁止药品</button></td>
			</tr>
  </table>
<ul class="pagination pagination-lg" id="changepage">
		<li><a onclick="up()">&laquo;</a></li>
		<c:forEach items="${page.pageShu}" var="pageshu">
			<li ><a onclick="addTabs(this)">${pageshu}</a></li>
		</c:forEach>
		
		<li><a onclick="next()">&raquo;</a></li>
	
	</ul>
	<input type="hidden" name="pageTwo" value="${page.pageTwo}" id="pageT">
	<input type="hidden" value="${page.totalPageTwo}" id="totalPageTwo">
</body>
<script type="text/javascript">
function delebanned(drugid,drugid1){
	$.ajax({
		type : "post",
		url : "<%=basePath%>/drug/delebanbed.action",
		dataType : "JSON",
		data : {"drugid":drugid,"drugid1":drugid1},
		success : function(data) {
			if(data=="1"){
				alert("删除成功");
				window.location.href = "<%=basePath%>/drug/banned.action";

			}else{
				alert("删除失败");
			}
		},
	});
}

/* 模糊查询禁忌 */
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
       
       
       
function qyerybanned(){
	this.qyerybyall(1,1)
}

function qyerybyall(page,pagetwo){
	var $options=$("#druglist3").children();
	 for(var i=0;i<$options.length;i++){
        if($options.eq(i).val().trim()==$("#drug3").val().trim()){
            console.log("???????"+$options.eq(i).attr("data-id"))
            var drugid=$options.eq(i).attr("data-id");
        }
    }
	
	if(drugid==""||drugid==null){
		drugid=0;
	}
	$.ajax({
		type : "post",
		url : "<%=basePath%>/drug/qurybannedbydrug.action",
		dataType : "JSON",
		data : {"drugid":drugid,"dqpage":page,"pageTwo":pagetwo},
		success : function(data) {
			var str="";
			for(var a=0 ;a<data.queryList.length;a++){
				str+="<tr>"+
		  		"<td>"+data.queryList[a].DRUG_ID+"</td>"+
		  		"<td>"+data.queryList[a].DRUG_NAME+"</td>"+
		  		"<td>"+data.queryList[a].DRUG_ID1+"</td>"+
		  		"<td>"+data.queryList[a].DRUG_NAME1+"</td>"+
		  		"<td><input type='button' value='删除' onclick='delebanned("+data.queryList[a].DRUG_ID+","+data.queryList[a].DRUG_ID1+")'/></td>"+
		  		"</tr>"
				}
			$("#bannedshowbody").html(str);
			
			 var str1="";
	           var str2="";
	           str1+="<li><a onclick='up()'>&laquo;</a></li>"
	   		for(var a=0 ;a<data.pageShu.length;a++){
	   			str2+="<li><a onclick='addTabs(this)'>"+data.pageShu[a]+"</a></li>"
	   		}
	   		str1=str1+str2+"<li><a onclick='next()'>&raquo;</a></li>"+
	   		"<li>共"+data.totalPage+"页，当前第"+data.page+"页</li>"+
	   	"<input type='hidden' name='pageTwo' value='"+data.pageTwo+"' id='pageT'>"+
	   	"<input type='hidden' value='"+data.totalPageTwo+"' id='totalPageTwo'>"
	         
	   	console.log("?????"+str1+"::::")
	    $("#changepage").html(str1); 
		},
});
}

function  update(){
	 var arr = new Array();
	    var trList = $("#bannedbeforbody").children("tr");
		  if(trList.length>0){
		    for (var i = 0; i < trList.length; i++) {
		        var json = {};
		        var tdArr = trList.eq(i).find("td");
		        json.roiName = tdArr.eq(0).text();
		        json.roiInfo = tdArr.eq(2).text();
		        if (json !=""|| json!="undefined") {
		            arr.push(json);
		        
		        };
		        };
		    	    var arrs=JSON.stringify(arr);
		    	    $.ajax({
		    		type:"post",
		    		url : "<%=basePath%>/drug/addbanned.action",
		    		//dataType:'JSON',
		    		data:{"data":arrs},
		    		success:function(data){
		    			if(data==1){
		    				alert("增加成功");
		    				window.location.href = "<%=basePath%>/drug/banned.action";
		    			}else{
		    				alert("增加失败");
		    			}
		    		},
		    		});
		    
	    }else{
	    	alert("请选择------")
	    }
	    
	    
	}
	
	

function  change(){
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
		return;
	}
	 var $optionss=$("#drugtwo").children();
	 for(var i=0;i<$optionss.length;i++){
         if($optionss.eq(i).val().trim()==$("#drug2").val().trim()){
             console.log("!!!!!!!"+$optionss.eq(i).attr("data-id"))
             var drugid1=$optionss.eq(i).attr("data-id");
         }
     }
	
	var drugname1=$('#drug2').val();
	console.log("name="+drugname1);
	
	var str="";
	str+="<tr><td>"+drugid+"</td>";
	str+="<td>"+drugname+"</td>";
	str+="<td>"+drugid1+"</td>";
	str+="<td>"+drugname1+"</td>";
	str+="<td><input type='button' value='删除'  onclick='del()'></td></tr>";
	$("#bannedbeforbody").append(str);
	$("#drug1").val("");
	$("#drug2").val("");
}


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
		url : "<%=basePath%>/drug/qurydrugbyid.action",
		dataType : "JSON",
		data : {"drugid":drugid},
		success : function(data) {
			console.log(data);
			var str2="";
			for(var a=0 ;a<data.length;a++){
	   			str2+="<option data-id="+data[a].DRUG_ID+" value="+data[a].DRUG_NAME+"></option>"
	   		};
			$("#drugtwo").html(str2);
		},
});
}
   </script>
</html>