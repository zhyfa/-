<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
    <title>Bootstrap 实例 - 自定义缩略图</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/x-admin/js/jquery.min.js"></script>
	<link 	rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/x-admin/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/x-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/x-admin/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/x-admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/x-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/x-admin/js/xadmin.js"></script>
</head>
<style>
.checkBox{float:left}
.row{margin-left:15px;}
 .layui-icon { width: 20px;height: 20px;}
 .layui-icon:hover { width: 30px;height: 30px;}
 img{border:0}/* css 注释说明：设置图片边框为0 */ 
body{text-align:center;}/* css注释说明：兼容ie6 支持标签使用hover */ 
.thinkcss{ position:relative;width:180px; height:180px;margin:0px auto} 
.thinkcss a,.thinkcss span{display:none; text-decoration:none}
.thinkcss:hover{cursor:pointer} 
.thinkcss:hover a.now{cursor:pointer; position:absolute; top:0;
 z-index:100; left:0; display:block;}
.thinkcss:hover span{ display:block;position:absolute; bottom:0; left:0;color:#FFF;width:180px; 
z-index:10;height:180px; line-height:150px; background:#000;filter:alpha(opacity=60);-moz-opacity:0.5;opacity: 0.5;}
/* 设置显示文字定位位置，背景半透明 */ 
</style>
<body>

<div class="row">
    <div class="col-sm-4 col-md-3">
        <div class="thumbnail">
        	<div class="thinkcss" style="background:url(${pageContext.request.contextPath}/assets/x-admin/images/logo.png)">
           <%--  <img src="${pageContext.request.contextPath}/assets/images/logo.png" width="100px" height="100px"> --%>
            <span>文字内容</span>
    		<a href="#" class="now">&nbsp;</a> 
            <div class="checkBox">
           		<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </div>
           </div>
           
            <div class="caption">
                 <h4>药品名称</h4>
                <p>
                    <a title="编辑"  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/user/user_add.action',600,400)" href="javascript:;">
	                <i class="layui-icon">&#xe642;</i>
	              </a>
	              <a title="采购"  onclick="x_admin_show('采购','${pageContext.request.contextPath}/user/user_add.action',600,400)" href="javascript:;">
	                <i class="icon iconfont">&#xe698;</i>
	              </a>
                    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
	                <i class="layui-icon">&#xe640;</i>
	              </a>
	              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
	                <i class="layui-icon">&#xe601;</i>
	              </a>
	              </a>
                    <a title="出库"  onclick="x_admin_show('采购','${pageContext.request.contextPath}/user/user_add.action',600,400)" href="javascript:;">
	                <i class="icon iconfont">&#xe6cb;</i>
	              </a> 
	              
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-md-3">
        <div class="thumbnail">
        	<div class="thinkcss" style="background:url(${pageContext.request.contextPath}/assets/x-admin/images/logo.png)">
           <%--  <img src="${pageContext.request.contextPath}/assets/images/logo.png" width="100px" height="100px"> --%>
            <span>文字内容</span>
    		<a href="#" class="now">&nbsp;</a> 
            <div class="checkBox">
           		<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </div>
           </div>
           
            <div class="caption">
                 <h4>药品名称</h4>
                <p>
                    <a title="编辑"  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/user/user_add.action',600,400)" href="javascript:;">
	                <i class="layui-icon">&#xe642;</i>
	              </a>
	              <a title="采购"  onclick="x_admin_show('采购','${pageContext.request.contextPath}/user/user_add.action',600,400)" href="javascript:;">
	                <i class="icon iconfont">&#xe698;</i>
	              </a>
                    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
	                <i class="layui-icon">&#xe640;</i>
	              </a>
	              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
	                <i class="layui-icon">&#xe601;</i>
	              </a>
	              </a>
                    <a title="出库"  onclick="x_admin_show('采购','${pageContext.request.contextPath}/user/user_add.action',600,400)" href="javascript:;">
	                <i class="icon iconfont">&#xe6cb;</i>
	              </a> 
	              
                </p>
            </div>
        </div>
    </div>
    
    
   
</div>

</body>
<script>
layui.use('layer', function(){ //独立版的layer无需执行这一句
	  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
	  
	});
       layui.use('laydate', function(){
        var laydate = layui.laydate; 
        
         //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        }); 
       }); 

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 1,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }

      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
      
     /*  //头工具栏事件
      table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
          case 'getCheckData':
            var data = checkStatus.data;
            layer.alert(JSON.stringify(data));
          break;
          
        };
      }); */
    </script>
</html>