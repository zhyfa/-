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
<title>成员管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.min.js"></script>
<script
	src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/assets/bootstrap/css/bootstrap.css">
<link rel="shortcut icon"
	href="<%=basePath%>/assets/x-admin/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/font.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/x-admin/css/xadmin.css">
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/x-admin/js/xadmin.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/media/css/jquery.dataTables.css">
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="<%=basePath%>/media/js/jquery.js"></script>
<script type="text/javascript" charset="utf8"
	src="<%=basePath%>/media/js/jquery.dataTables.js"></script>

</head>


<body>
	<h1 style="text-align: center;">成员管理界面</h1>

	<a class="btn btn-primary" role="button"
		onclick="x_admin_show('添加新成员'  ,'${pageContext.request.contextPath }/admin/addadminbefore.action',600,400)"
		href="javascript:;"> <i class="layui-icon">&#xe642;</i>添加用户
	</a>
	<div style="padding: 100px 100px 10px;">
		<form id="queryadmin" class="navbar-form navbar-left">
			<div class="input-group">
				<label class="input-group ">请在下列输入（选择）查询条件</label> 
				<select name="role_id" class="form-control" id="role_id">
					<option value=0>"未选择需要查询的职位"</option>
					<c:forEach items="${requestScope.rolelist}" var="role" varStatus="sta">
						<option value="${role.roleId}">${role.roleName}</option>
					</c:forEach>
				</select> <select name="admin_state" class="form-control" id="stateid">
					<option value=0>"未选择查询的状态"</option>
					<c:forEach items="${requestScope.parameterlist}" var="parameter"
						varStatus="sta">
						<option value="${parameter.PARAMETER_VALUE}">${parameter.PARAMETER_NAME}</option>
					</c:forEach>
				</select> <input type="text" class="form-control" placeholder="请输入需要查询的姓名"
					name="admin_name" id="adminname">
			</div>
			<input type="button" class="btn btn-primary" data-toggle="button"
				value="查询" onclick="queryadmin()">
		</form>
	</div>
	<div id="adindiv">
	<c:forEach items="${page.queryList}" var="admins" varStatus="sta">
		<div class="row" style="margin-left: 50px">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="<%=basePath%>/image/doctor.png"
						alt="通用的占位符缩略图">
					<div class="caption">

						<table class="table table-hover" id="${admins.ADMIN_ID}">
							<thead>
								<tr>
									<th>姓名</th>
									<th>职位</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${admins.ADMIN_NAME}</td>
									<td>${admins.ROLE_NAME}</td>
									<td>${admins.PARAMETER_NAME}</td>
								</tr>
							</tbody>
						</table>

						<div style="border: 1px solid color:red">
							<p>
								<a class="btn btn-primary" role="button"
									onclick="x_admin_show('成员详情 ' ,'${pageContext.request.contextPath }/admin/queryadminbyid.action?adminid=${admins.ADMIN_ID}',600,400)"
									href="javascript:;"> <i class="layui-icon">&#xe642;</i>查看详情
								</a> <a  class="btn btn-default" role="button" onclick="delectadmin(${admins.ADMIN_ID})">删除用户</a> <br>

								<a class="btn btn-primary" role="button"
									onclick="x_admin_show('修改信息'  ,'${pageContext.request.contextPath }/admin/updaadminbefore.action?adminid=${admins.ADMIN_ID}',600,400)"
									href="javascript:;"> <i class="layui-icon">&#xe642;</i>更改数据</a> 
								<a  class="btn btn-default" role="button" onclick="turnoffadmin(${admins.ADMIN_ID})">禁用用户 </a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<ul class="pagination pagination-lg">
		<li><a onclick="up()">&laquo;</a></li>
		<c:forEach items="${page.pageShu}" var="pageshu">
			<li><a onclick="addTabs(this)">${pageshu}</a></li>
		</c:forEach>
		<li><a onclick="next()">&raquo;</a></li>
		<li>共${page.totalPage}页，当前第${page.page}页</li>
	</ul>
	<input type="hidden" name="pageTwo" value="${page.pageTwo}" id="pageT">
	<input type="hidden" value="${page.totalPageTwo}" id="totalPageTwo">

</body>
<script type="text/javascript">
       function addTabs(obj) {
           var page = (Number)($(obj).text());
           var pageTwo=(Number)($("#pageT").attr("value"));
           window.location.href="<%=basePath%>/admin/adminList.action?dqPage="+page+"&pageTwo="+pageTwo;
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
    		   window.location.href="<%=basePath%>/admin/adminList.action?dqPage="+page+"&pageTwo="+pageTwo;
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
    		   window.location.href="<%=basePath%>/admin/adminList.action?dqPage="+page+"&pageTwo="+pageTwo;
    	   }
    	   
       }
       function queryadmin(){
    	   console.log("!!!!!!!!!!!")
    	  
	       	var stateid =JSON.parse($("#stateid").val());
    	   console.log(stateid)
	    	var role_id =JSON.parse($("#role_id").val());
    	   console.log(role_id)
	    	var adminname =$("#adminname").val();
    	   console.log(adminname)
    	   $.ajax({
				type : "post",
				url : "<%=basePath%>/admin/queryadmin.action",
				dataType : "JSON",
				data : {"admin_name":adminname,"role_id":role_id,"admin_state":stateid,"dqpage":1,"pageTwo":1},
				success : function(data) {
					var str="";
					 
		                 for(var i=0;i<data.queryList.length;i++) {
		                str+=  "<div class='row' style='margin-left: 50px'>"+
		        			"<div class='col-sm-6 col-md-3'>"+
		        				"<div class='thumbnail'>"+
		        				"<img src='<%=basePath%>/image/doctor.png' alt='通用的占位符缩略图'>"+
		        					"<div class='caption'>"+
		        						"<table class='table table-hover'>"+
		        							"<thead>"+
		        								"<tr>"+
		        									"<th>姓名</th>"+
		        									"<th>职位</th>"+
		        									"<th>状态</th>"+
		        								"</tr>"+
		        							"</thead>"+
		        							"<tbody>"+
		        								"<tr>"+
		        									"<td>"+data.queryList[i].ADMIN_NAME+"</td>"+
		        									"<td>"+data.queryList[i].ROLE_NAME+"</td>"+
		        									"<td>"+data.queryList[i].PARAMETER_NAME+"</td>"+
		        								"</tr>"+
		        							"</tbody>"+
		        						"</table>"+

		        						"<div style='border: 1px solid color:red'>"+
		        							"<p>"+
		        								"<a class='btn btn-primary' role='button' "+
		        									" onclick='x_admin_show('成员详情 ','//admin///queryadminbyid.action?adminid="+data.queryList[i].ADMIN_ID+"',600,400)'"+
		        									" href='javascript:;''> <i class='layui-icon'>&#xe642;</i>查看详情 </a> "+
		        								"<a  class='btn btn-default' role='button' onclick='delectadmin("+data.queryList[i].ADMIN_ID+")'>删除用户 </a>"+

		        								"<a class='btn btn-primary' role='button'"+
		        									"onclick='x_admin_show('修改信息','////admin////updaadminbefore.action?adminid=data.queryList[i].ADMIN_ID',600,400)'"+
		        									"href='javascript:;'> <i class='layui-icon'>&#xe642;</i>更改数据</a> "+
		        								"<a  class='btn btn-default' role='button' onclick='turnoffadmin("+data.queryList[i].ADMIN_ID+")'>禁用用户 </a>"+
		        								"</p>"+
		        							"</div>"+
		        						"</div>"+
		        					"</div>"+
		        				"</div>"+
		        			"</div>"
		                 }
		                    
		                    

		           $("#adindiv").html(str); 
				},
			});
			}
       
       function delectadmin(adminid){
    	   $.ajax({
				type : "post",
				url : "<%=basePath%>/admin/admindelete.action",
				dataType : "JSON",
				data : {'adminid':adminid},
				success : function(data) {
					if(data=="1"){
						window.alert("删除成功");
						window.location.href = "<%=basePath%>/admin/adminList.action?dqPage=1&pageTwo=1";
					}if(data=="2"){
						window.alert("删除失败");
					}
					
				}
    	   });
       }
       
   </script>
</html>