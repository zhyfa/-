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
<style type="text/css">
body{font-size:12px}
        #demo{overflow:hidden; height:80px; width:280px; margin:90px auto; position:relative;}
        #demo1{height:auto; text-align:left;}
        #demo2{height:auto; text-align:left;}
        #demo1 li, #demo2 li{list-style-type:none; height:22px; text-align:left; }
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : "post",
		url : "<%=basePath%>/stock/stockList.action",
		dataType : "JSON",
		success : function(data) {
			if(data.stocks!=null){
				var str = "";
				for(var i=0;i<data.stocks.length;i++){
					var stock = data.stocks[i];
					if(stock.msg!=null){
						str+="<li><a href='#' target='_blank'>"+stock.drug_name+":"+stock.msg+"</a></li>";
					}
				}
				$("#demo1").html(str);
			}
			if(data.unsalables!=null){
				var str = "";
				for(var i=0;i<data.unsalables.length;i++){
					var unsalable = data.unsalables[i];
						str+="<p style='red'>药房库存id:"+unsalable.inventory_id+",药品名:"+unsalable.drug_name+","+unsalable.msg+"</p>";
				}
				$("#aaa").html(str);
			}
			if(data.overdues!=null){
				var str = "";
				for(var i=0;i<data.overdues.length;i++){
					var overdue = data.overdues[i];
						str+="<p style='red'>药房库存id:"+overdue.inventory_id+",药品名:"+overdue.drug_name+","+overdue.msg+"</p>";
				}
				$("#bbb").html(str);
			}
		}
	});
});
</script>
<body>
<div id="demo">
    <ul id="demo1">
    </ul>
    <div id="demo2"></div>
</div>
<div id="aaa">
<!-- <p style="red;"></p> -->
</div>
<div id="bbb">

</div>
</body>

<script type="text/javascript">
var speed = 40;
window.onload=function(){
    var demo=document.getElementById("demo");
    var demo2=document.getElementById("demo2");
    var demo1=document.getElementById("demo1");
    demo2.innerHTML = demo1.innerHTML;
    function Marquee(){if(demo.scrollTop>=demo1.offsetHeight){
            demo.scrollTop=0;
        }
        else{
            demo.scrollTop=demo.scrollTop+1;
        }
    }
    var MyMar=setInterval(Marquee,speed);
    demo.onmouseover=function(){clearInterval(MyMar)};
    demo.onmouseout=function(){MyMar=setInterval(Marquee,speed); };
}

</script>
</html>