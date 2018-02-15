<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网管系统</title>
<script src="<%=path%>/static/js/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="<%=path%>/static/css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/static/css/SpryTabbedPanels2.css" rel="stylesheet" type="text/css"/>
<script src="<%=path%>/static/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.freezeheader.js"></script>
<style type="text/css">
		#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
<link href="<%=path%>/static/css/topHover.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<jsp:include page="logo.jsp" flush="true" />
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">

<!--     <li class="TabbedPanelsTab" tabindex="0" >主页</li> -->
    <li class="TabbedPanelsTab" tabindex="0">资源一览</li>
    <li class="TabbedPanelsTab" tabindex="0">网络配置</li>
    <li class="TabbedPanelsTab" tabindex="0">网络查询</li>
    <li class="TabbedPanelsTab" tabindex="0">设备管理</li>

  </ul>

  
<div class="TabbedPanelsContentGroup">
<!--     <div class="TabbedPanelsContent">内容 1s
    <div id="TabbedPanels2" class="TabbedPanels">
      <ul class="TabbedPanelsTabGroup2">
        <li class="TabbedPanelsTab2" tabindex="0">概览</li>
        <li class="TabbedPanelsTab2" tabindex="0">快捷设置</li>
        <li class="TabbedPanelsTab2" tabindex="0">信息概要</li>
        <li class="TabbedPanelsTab2" tabindex="0">关于我们</li>
      </ul>
      <div class="TabbedPanelsContentGroup2">
        <div class="TabbedPanelsContent2">内容 1</div>
        <div class="TabbedPanelsContent2">内容 2</div>
        <div class="TabbedPanelsContent2">内容 3</div>
        <div class="TabbedPanelsContent2">内容 4</div>
      </div>
    </div>
    </div>  -->  
    <div class="TabbedPanelsContent"></div>
    <div class="TabbedPanelsContent">内容 3
    <div>
    	<ul class="TabbedPanelsTabGroup2">
    	 <a href="<%=basePath%>Setting/autoSet.do" ><li class="TabbedPanelsTab2" tabindex="0">引导型配置</li></a>
         <a href="<%=basePath%>Setting/manualSet.do" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">手动配置接口</li></a>
		 <a href="<%=basePath%>Database/getRoutable.do" ><li class="TabbedPanelsTab2" tabindex="0">静态路由状态</li></a>
         <a href="<%=basePath%>views/routeNew.jsp" ><li class="TabbedPanelsTab2 " tabindex="0">新建静态路由</li></a>   
         <a href="<%=basePath%>Database/getAllAdmin.do" ><li class="TabbedPanelsTab2 " tabindex="0">新建vlan</li></a> 	
    	</ul>
    
    <div class="TabbedPanelsContentGroup2">
	<div class="TabbedPanelsContent2" >
	<div>
		<textarea rows="20" cols="100" id="msg"></textarea>
	</div>
	
	<br/>
	<input type="button" value="确定" id ="submit"></input>
	<div id="returnMsg"></div>
    </div>
    </div>
    </div>
    
    
    </div>
	<div class="TabbedPanelsContent">内容 4</div>
    <div class="TabbedPanelsContent">内容 5</div>  
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
var TabbedPanels2 = new Spry.Widget.TabbedPanels("TabbedPanels2");
var TabbedPanels3 = new Spry.Widget.TabbedPanels("TabbedPanels3");
</script>

<script type="text/javascript">
$(".TabbedPanelsTab").eq(1).trigger("click");
$(".TabbedPanelsTab").eq(0).click(function(){
	//alert("ssss");
	//$(".TabbedPanelsTab2").eq(2).trigger("click");
	window.location="<%=basePath%>views/main2.jsp";
	
});
</script>

<script type="text/javascript">
$("#submit").click(function(){
	alert(""+$("#msg").val());
	
	$.ajax({   	 	
    data:"message="+$("#msg").val(),     
    type:"post",  
    url:"<%=basePath%>Setting/send.do",
    dataType: "text",           
    success:function(msg){  
        alert("success:"+msg);  
        $("#returnMsg").innerHTML=msg;
        //var ajaxobj=new AJAXRequest;    // 创建AJAX对象,类在刚刚那个文件里了
		//ajaxobj.method="GET";   // 设置请求方式为GET
		//ajaxobj.url="abc.html" ;
		//alert("after url");
		//ajaxobj.callback=function(xmlobj) {
		//alert("enter callback");
		//document.getElementById("abc").innerHTML = xmlobj.responseText;     //可要看好这句话哦
		//}
		//ajaxobj.send();    // 发送请求 // 响应的URL,以后可以改为一些动态处理页,会用Ajax的都知道，这在页里可以有目的返回不同的数据
		// 设置回调函数，输出响应内容,因为是静态页（这是我的需求嘛）所以所有内容都过来了  
    },  
    error:function(msg){  
        alert("出错了！！:"+msg);  
        $("#returnMsg").innerHTML=msg;
    } 
});
});

</script>

</body>
</html>