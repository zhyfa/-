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
<title>药库生成药房申请药品页面</title>
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
<link rel="shortcut icon" href="<%=basePath%>/assets/favicon.ico"
	type="image/x-icon" />
<script type="text/javascript"
	src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/assets/lib/layui/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery.serializejson.js"></script>
<script src="<%=basePath%>/js/jquery.serializejson.min.js"></script>
</head>
<style>

</style>
<body>
<input type="button" onclick="insRow()" value="Insert row">
<input type="button" onclick="add()" value="Insert">
	<table id="myTable" border="1">
	<thead>
				<tr>
					<th>序号</th>
					<th>药品名称</th>
					<th>是否特殊药品</th>
					<th>生产厂家</th>
					<th>生产日期</th>
					<th>申请总量</th>
					<th>操作</th>
				</tr>
			</thead>
	<tr>
	<td>Row1 cell1</td>
	<td>Row1 cell2</td>
	<td>Row1 cell2</td>
	<td>Row1 cell2</td>
	<td>Row1 cell2</td>
	<td>Row1 cell2</td>
	<td>Row1 cell2</td>
	</tr>
	
	</table>
<br>

	
</body>
<script type="text/javascript">
var count = 1;
function add() {
var tbl = document.all.ci;
var rows = tbl.rows.length;
var tr = tbl.insertRow(rows);
 
var e_id = tr.insertCell(0);
e_id.innerHTML = '<input type="text" name="e_id' + count + '" size="7" />';
 
var class_id = tr.insertCell(1);
class_id.innerHTML = '';
 
var memo = tr.insertCell(2);
memo.innerHTML = '<input type="text" name="memo' + count + '" size="14" />';
 
var del = tr.insertCell(3);
del.innerHTML = '<input type="button" onclick="del(this)" value="删除" />';
count++;
}
 
function del(btn) {
var tr = btn.parentElement.parentElement;
var tbl = tr.parentElement;
if (tr.rowIndex >= 1) {
tbl.deleteRow(tr.rowIndex);
} else {
 
}
};

	
	
	
// 	function insRow(){
// 		var x=document.getElementById('myTable').insertRow(document.getElementById('myTable').rows.length);
// 		var a=x.insertCell(0);
// 		var b=x.insertCell(1);
// 		var c=x.insertCell(2);
// 		var d=x.insertCell(3);
// 		var e=x.insertCell(4);
// 		var f=x.insertCell(5);
// 		var g=x.insertCell(6);
// 		a.innerHTML="NEW CELL1";
// 		b.innerHTML="NEW CELL2";
// 		c.innerHTML="NEW CELL1";
// 		d.innerHTML="NEW CELL2";
// 		e.innerHTML="NEW CELL1";
// 		f.innerHTML="NEW CELL2";
// 		g.innerHTML = '<input type="button" onclick="del(this)" value="删除" />';
// 		count++;
// 	}
</script>
</html>