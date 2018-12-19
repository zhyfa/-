<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/back/ztree/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/back/ztree/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/back/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/back/ztree/jquery.ztree.excheck.min.js"></script>
</head>
<script type="text/javascript">
var zTreeObj;
var setting ={
		check:{
			enable:true
		},
		data:{
			key:{
				name:"menuName",
				checked: "isChecked"
			},
			simpleData:{
				enable:true,//通过id pId建立子父级关系
				idKey: "menuId",
				pIdKey: "fatherId",
				rootPId: 0
			}
			
		}
};

var zNodes = [
	   {menuId:"1",fatherId:"0",menuName:"福建省",isChecked:true},
	   {menuId:"2",fatherId:"0",menuName:"广东省",isChecked:true},
	   {menuId:"3",fatherId:"1",menuName:"厦门市",isChecked:true},
	   {menuId:"4",fatherId:"1",menuName:"福州市",isChecked:false},
	   {menuId:"5",fatherId:"1",menuName:"泉州市",isChecked:true},
	   {menuId:"6",fatherId:"2",menuName:"深圳市",isChecked:false}
];

$(document).ready(function(){
    zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    zTreeObj.expandAll(true);
 });
</script>
<body>
	<div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>