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
	<link href="<%=basePath%>/assets/alert/css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/assets/alert/js/ui.js"></script>  
	<style type="text/css">
	 body { padding-top: 60px;text-align: center; }
	</style>
 <script src="<%=basePath%>/js/bootstrap.min.js"></script>
  </head>
  
  <body>
	<div class="mc">
			<h2>盘点明细表</h2>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
				<th>药品名称</th>
				<th>系统数量</th>
				<th>生产批号</th>
				<th>实际盘点数量</th>
				<th>差值</th>
				<th>操作</th>
				</tr>
				</thead>
				<cc:forEach items="${page.queryCheck}" var="user1">
				<tr>
				<td><span>${user1.drug_name }</span></td>
				<td><span>${user1.system_quantity}</span></td>
				<td><span>${user1.production_date}</span></td>
				<td><span>${user1.real_quantity}</span></td>
				<td><span style="color:<cc:if test="${user1.difference>0}">blue</cc:if><cc:if test="${user1.difference<0}">red</cc:if>">${user1.difference}</span></td>
				<td><input type="<cc:if test="${user1.difference==0}">hidden</cc:if><cc:if test="${user1.difference!=0}">button</cc:if>" value="<cc:if test="${user1.difference>0}">盘盈</cc:if><cc:if test="${user1.difference<0}">盘亏</cc:if>" onclick="channage(${user1.check_id})" class="btn btn-warning"></td>
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
           window.location.href="${pageContext.request.contextPath}/creditInfo/checkDaily.action?dqPage="+page+"&pageTwo="+pageTwo;
       }
       
       function next(){
    	   var pageTwo=(Number)($("#pageT").attr("value"));
    	   var totalPageTwo=(Number)($("#totalPageTwo").attr("value"));
    	   if(pageTwo>=totalPageTwo){
    		   mizhu.alert('提示', '没有更多页了！','alert_red');
    	   }else{
    		   pageTwo++;
    		   var page=(pageTwo-1)*5+1;
    		   window.location.href="${pageContext.request.contextPath}/creditInfo/checkDaily.action?dqPage="+page+"&pageTwo="+pageTwo;
    	   }
    	   
       }
       
       function up(){
    	   var pageTwo=(Number)($("#pageT").attr("value"));
    	   var totalPageTwo=(Number)($("#totalPageTwo").attr("value"));
    	   if(pageTwo<=1){
    		   mizhu.alert('提示', '没有更多页了！','alert_red');
    	   }else{
    		   pageTwo--;
    		   var page=(pageTwo-1)*5+1;
    		   window.location.href="${pageContext.request.contextPath}/creditInfo/checkDaily.action?dqPage="+page+"&pageTwo="+pageTwo;
    	   }
       }
       
       function channage(checkID){
    	   alert(checkID);
       }
   </script>
</html>
