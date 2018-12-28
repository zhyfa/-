<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/jquery.form.js"></script>
<link href="<%=basePath%>/css/hovertreetags.css" rel="stylesheet" type="text/css" />
<base target="_blank" />
<style>.hovertreeinfo{text-align:center;margin-top:10px;}
.hovertreeinfo a{color:black;}
</style>
</head>
<body>
<div class="hovertreeinfo"><h1>HovertreeTags标签云JS特效</h1></div>
<div id="hovertreetags">
<a href="http://hovertree.com/menu/java/" class="tagc1">Java</a>
<a href="http://hovertree.com/menu/visualstudio/" class="tagc2">Visual Studio</a>
<a href="http://hovertree.com/menu/javascript/" class="tagc5">JavaScript</a>
<a href="http://hovertree.com/menu/php/" class="tagc2">
PHP
</a>
<a href="http://hovertree.com/menu/jquery/" class="tagc2">jQuery</a>
<a href="http://hovertree.com" class="tagc1">何问起</a>
<a href="http://hwq2.com" class="tagc2">hwq2</a>
<a href="http://hovertree.com/menu/texiao/" class="tagc5">网页特效</a>
<a href="http://hovertree.com/menu/csharp/" class="tagc2">C#</a>
<a href="http://hovertree.com/menu/bootstrap/" class="tagc2">Bootstrap</a>
<a href="http://hovertree.com/menu/java/" class="tagc5">Java</a>
<a href="http://hovertree.net" class="tagc2">hovertree.net</a>
<a href="http://keleyi.com/" class="tagc1">柯乐义</a>
<a href="http://keleyi.com/a/bjac/d863921ed93d03ff.htm" class="tagc2">a标签</a>
<a href="http://hovertree.com/h/bjaf/l3c6nm7b.htm" class="tagc5">何问起键盘</a>
<a href="http://hovertree.com/tiku/bjaf/5v9ps30o.htm" class="tagc2">
数组
</a>
<a href="http://tool.hovertree.com/a/base64/" class="tagc2">Base 64</a>
<a href="http://hovertree.com" class="tagc1">HoverTree</a>
<a href="http://hovertree.com/code/css/4u8q30yw.htm" class="tagc2">CSS开门</a>
<a href="http://hovertree.com/code/" class="tagc5">代码</a>
<a href="http://hovertree.com/menu/css/" class="tagc2">CSS</a>
<a href="http://hovertree.com/h/bjaf/c7lmaqjx.htm" class="tagc2">Bootstrap</a>
<a href="http://hovertree.com/tiku/" class="tagc5">题库</a>
<a href="http://hovertree.com/h/bjaf/kqud99m6.htm" class="tagc2">图标旋转</a>
</div>
<div class="hovertreeinfo"><a href="http://hovertree.com/h/bjaf/hovertreetags.htm">原文</a> <a href="http://hovertree.com">首页</a> <a href="http://hovertree.com/texiao/">特效</a>
</div>

</body>
<script src='<%=basePath%>/js/hovertreetags.js' type="text/javascript"></script>
</html>