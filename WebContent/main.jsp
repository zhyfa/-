<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>智慧药房管理</title>
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
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ztree/jquery.ztree.excheck.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zTreeStyle.css"/>

<link rel="shortcut icon"
	href="<%=basePath%>/assets/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="<%=basePath%>/assets/css/font.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/css/xadmin.css">
<script type="text/javascript"
	src="<%=basePath%>/assets/js/jquery.min.js"></script>
<script
	src="<%=basePath%>/assets/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=basePath%>/assets/js/xadmin.js"></script>

</head>

<body>
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="<%=basePath%>/main.jsp">智慧药房管理系统</a>
		</div>
		<div class="left_open">
			<i title="展开左侧栏" class="iconfont">&#xe699;</i>
		</div>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">${sessionScope.admin.admin_name }</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a  onclick="myInfo()">个人信息</a>
					</dd>
					<dd>
						<a onclick="pwdAlter()">修改密码</a>
					</dd>
					<dd>
						<a href="<%=basePath%>/admin/exit.action">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a href="#">${sessionScope.admin.role_name }</a></li>
		</ul>

	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<c:forEach items="${sessionScope.admin.menus}" var="menu">
					<li><a > <i class="iconfont">&#xe6b4;</i>
							<cite>${menu.menu_name }</cite> <i class="iconfont nav_right">&#xe697;</i>
					</a>
						<ul class="sub-menu">
							<c:forEach items="${menu.menuChilds }" var="childs">
								<li><a _href="<%=basePath%>/${childs.menu_con}"> <i class="iconfont">&#xe6a7;</i>
										<cite>${childs.menu_name}</cite>
								</a></li>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- <div class="x-slide_left"></div> -->
	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='<%=basePath%>/main1.jsp'
						frameborder="0" scrolling="yes" class="x-iframe"></iframe>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content-bg"></div>
	<!-- 右侧主体结束 -->
	<!-- 中部结束 -->
	<!-- 底部开始 -->
	<div class="footer">
		<div class="copyright">
			相关链接&nbsp&nbsp <a href="http://www.nmpa.gov.cn" target="_blank">国家药品监督管理局</a>&nbsp&nbsp <a
				href="http://zjj.fujian.gov.cn" target="_blank">福建省食品药品监督管理局</a>
		</div>
	</div>
	<!-- 底部结束 -->

</body>
<script type="text/javascript">
 function myInfo(){
      layer.open({
        type: 1
        ,title: false //不显示标题栏
        ,closeBtn: false
        ,area: '300px;'
        ,shade: 0.8
        ,id: 'myInfoPanel' //设定一个id，防止重复弹出
        ,btn: ['知道了']
        ,btnAlign: 'c'
        ,moveType: 1 //拖拽模式，0或者1
         ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
        '<table style="text-align:left;"><tr><th>用户名：</th><td>${sessionScope.admin.admin_name}</td></tr>'+
        '<tr ><th>账户状态：</th><td>使用中</td></tr>'+
        '<tr><th>创建时间：</th><td>${sessionScope.admin.admin_cdate}</td></tr>'+
        '</table></div>' 
        
      });
    }
function pwdAlter(){
     var that = this; 
     //多窗口模式，层叠置顶
     layer.open({
       type: 2 //此处以iframe举例
       ,title: '修改密码'
       ,area: ['600px', '400px']
       ,shade: 0
       ,maxmin: true
       
       ,content: '<%=basePath%>/admin/toAlterPwd.action'
       ,btn: ['关闭本页'] 
       ,btn2: function(){
         layer.closeAll();
       }
       
       /* ,zIndex: layer.zIndex //重点1
       ,success: function(layero){
         layer.setTop(layero); //重点2
       } */
     });
   }
</script>
</html>