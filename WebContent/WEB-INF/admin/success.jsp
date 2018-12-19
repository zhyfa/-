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
<title>修改成功</title>

</head>
</head>
<style>img{width:60px; height:60px}</style>
<body>
	<div><img alt="" src="<%=basePath%>/assets/images/smile.jpg">密码修改成功，<span id="second" style="color: red;">5</span>秒后跳转到首页，如果不跳转请<a href="#" onclick="turnLogin()">点击这里</a>
        <script type="text/javascript">
            var time = 5;
            var timer;
            timer = setInterval(
                function(){
                    var second = document.getElementById("second");
                    if(time>=1){
                        second.innerHTML = time;
                        time--;
                    }else{
                        clearInterval(timer);
                        top.window.location.href="<%=basePath%>/admin/exit.action";
                    }
                },
                1000
            );
            
            function turnLogin(){
            	 top.window.location.href="<%=basePath%>/admin/exit.action";
            }
        </script>
　　</div>

</body>
 
</html>