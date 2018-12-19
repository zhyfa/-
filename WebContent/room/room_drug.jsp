<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<table border="1" width="80%">
	<caption>药品列表</caption>
	<thead>
		<th>序号</th>
		<th>药品名</th>
		<th>cdate</th>
		<th>操作</th>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.drugs }" var="drug" varStatus="st">
		<tr>
			<td>${st.count }</td>
			<td>${drug.drug_name }</td>
			<td>${drug.cdate }</td>
			<td>
				<a href="#">禁用/启用</a>
				<a href="#">修改</a>
				<a href="#">删除</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
${requestScope.drugs }
</body>
</html>