<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/treeview/jquery.screen.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/treeview/jquery.treeview.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/treeview/jquery.treeview.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/treeview/jquery.cookie.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#browser").treeview({
			toggle: function() {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
		/*
		$("#add").click(function() {
			var branches = $("<li><span class='folder'>New Sublist</span><ul>" +
				"<li><span class='file'>Item1</span></li>" +
				"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
			$("#browser").treeview({
				add: branches
			});
		});
		*/
	});
	</script>
</head>
<body>
	<div id="main">
		<ul id="browser" class="filetree treeview-famfamfam">
			<ul>
				<li><span class="folder">一</span>
					<ul>
						<li><span class="file"><a href="#">1.1</a></span></li>
						<li><span class="file"><a href="#">1.2</a></span></li>
						<li><span class="file"><a href="#">1.3</a></span></li>
						<li><span class="file"><a href="#">1.4</a></span></li>
					</ul></li>
				<li><span class="folder">二</span>
					<ul>
						<li><span class="file"><a href="#">2.1</a></span></li>
						<li><span class="file"><a href="#">2.2</a></span></li>
						<li><span class="file"><a href="#">2.3</a></span></li>
						<li><span class="file"><a href="#">2.4</a></span></li>
					</ul></li>
				<!-- 
			<li class="closed"><span class="folder">Folder 3 (closed at start)</span>
				<ul>
					<li><span class="file">File 3.1</span></li>
				</ul>
			</li>
			 -->
			</ul>
		</ul>
		<!-- <button id="add">Add!</button> -->
	</div>
</body>
</html>