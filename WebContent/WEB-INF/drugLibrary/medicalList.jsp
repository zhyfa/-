<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.css">  
	<style type="text/css">
	 body { padding-top: 60px;text-align: center; }
	</style>
 <script src="<%=basePath%>/js/bootstrap.min.js"></script>
  </head>
  
  <body>
	<div class="mc">
			<h2>医保药品基表</h2><input type="button" value="同步到本地" onclick="updateMedical()">
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
				<th>医保地区</th>
				<th>编号</th>
				<th>药品名称</th>
				</tr>
				</thead>
				<cc:forEach items="${page.queryMedical}" var="user1">
				<tr>
				<td><span>${user1.medical_city }</span></td>
				<td><span>${user1.medical_id}</span></td>
				<td><span>${user1.drug_name}</span></td>
				</cc:forEach>
				</table>
				<ul class="pagination pagination-lg">
					<li><a onclick="up()">&laquo;</a></li>
					<cc:forEach items="${page.pageShu}" var="pageshu">
					<li><a onclick="addTabs(this)">${pageshu}</a></li>
					</cc:forEach>
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
           window.location.href="${pageContext.request.contextPath}/creditInfo/medicalList.action?dqPage="+page+"&pageTwo="+pageTwo;
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
    		   window.location.href="${pageContext.request.contextPath}/creditInfo/medicalList.action?dqPage="+page+"&pageTwo="+pageTwo;
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
    		   window.location.href="${pageContext.request.contextPath}/creditInfo/medicalList.action?dqPage="+page+"&pageTwo="+pageTwo;
    	   }
       }
       
       function channage(checkID){
    	   alert(checkID);
       }
       
       function updateMedical(){
    	   window.location.href="${pageContext.request.contextPath}/creditInfo/updateMedical.action";
       }
   </script>
</html>
