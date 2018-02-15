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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>网管系统</title>
<script src="<%=path%>/static/js/SpryAssets1/SpryTabbedPanels.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1rPbF5ljtS4XwQj9FY43dDFW"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.freezeheader.js"></script>
<link href="<%=path%>/static/css/topHover.css" rel="stylesheet" type="text/css"/><!--引用css文件-->
<link href="<%=path%>/static/js/SpryAssets1/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/static/js/SpryAssets2/SpryTabbedPanels2.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/static/css/mousemove1.css" rel="stylesheet" type="text/css"/>
<!--以下为二级菜单所需要的样式表，用于制作滑动菜单效果-->
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/secondmenu.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/fonts/fonts/font-awesome-4.2.0/css/font-awesome.min.css" /><!--图标包-->
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/menu_topside.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/title.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/seccontent.css" />
<!--引用css文件结束-->
</head>

<body>
    <!--span用于存放左上角logo-->
	<jsp:include page="logo3.jsp" flush="true" />
	
    <!--所有TabbedPanels*均代表上方选项栏及下面的空白div-->
    <div id="TabbedPanels1" class="TabbedPanels">
	  <!--TabbedPanelsTabGroup是上方菜单栏-->
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab" tabindex="0">资源一览</li>
        <li class="TabbedPanelsTab" tabindex="0">网络配置</li>
        <li class="TabbedPanelsTab" tabindex="0">网络查询</li>
        <li class="TabbedPanelsTab" tabindex="0">设备管理</li>
      </ul>
	  <!--上方菜单栏定义结束-->
      
      <!--TabbedPanelsContentGroup是每个菜单对应的内容div-->
      <div class="TabbedPanelsContentGroup">

	<div class="TabbedPanelsContent"></div>
    <div class="TabbedPanelsContent"><!-- 内容 2 -->
            <!--以复制粘贴的方法静态引用一个页面（网页二级菜单）-->
       <body class="TabPanelbody">
            <div class="container">
                <div class="menu-wrap">
                    <nav class="menu-top">
                        <div class="profile"><img src="<%=path%>/static/img/user1.png" alt="Matthew Greenberg"/><span>${rank}管理员： ${username}</span></div>
                        <!--
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-fw fa-star-o"></i></a>
                            <a href="#"><i class="fa fa-fw fa-bell-o"></i></a>
                            <a href="#"><i class="fa fa-fw fa-envelope-o"></i></a>
                            <a href="#"><i class="fa fa-fw fa-comment-o"></i></a>
                        </div>
                        -->
                    </nav>
                    <nav class="menu-side">
                        <!-- <a href="#"><i class="fa fa-fw fa-star-o"></i>&nbsp;引导型配置</a> -->
                        <a href="<%=basePath%>Setting/manualSet.do"><i class="fa fa-fw fa-cog"></i>&nbsp;手动配置接口</a>
                        <a href="<%=basePath%>Database/getRoutable.do"><i class="fa fa-fw fa-envelope-o"></i>&nbsp;静态路由状态</a>
                        <a href="<%=basePath%>views/routeNew3.jsp" ><i class="fa fa-fw fa-newspaper-o"></i>&nbsp;新建静态路由</a>
                        <a href="<%=basePath%>Database/getAllAdmin.do"><i class="fa fa-fw fa-bar-chart-o"></i>&nbsp;新建VLAN</a>
                    </nav>
                </div>
                <button class="menu-button" id="open-button"></button><!--每个按钮对应一个main*.js文件，保证每个菜单都能正确的呼出-->
                <div class="content-wrap" id="content-wrap">
                <div class="content">
					<!--内容页面开始-->
      				<div style="width:90%;float: right;height:570px;overflow:auto;margin:0px;">
                        <!--静态路由表配置-->
                        <!--标题样式-->
                        <div class="grid__item">
                        <a class="link link--takiri" href="#">手动配置接口 <span>本页供管理员手动配置底层设备</span></a>
                        </div>
                        <hr />
						<!--标题样式结束-->
							<div>
							<label><input type="radio" name="hardware">华为1</label>
							<label><input type="radio" name="hardware">华为2</label>
							<label><input type="radio" name="hardware">思科1</label>
							<label><input type="radio" name="hardware">思科2</label>
							<br />
								<textarea rows="20" cols="100" id="msg"></textarea>
							</div>
								<br/>
								<input type="button" class="zebrabutton" value="确定" id ="submit"></input>
								<div id="returnMsg"></div>
					</div>
   			</div>
            </div><!-- /content-wrap -->
            </div><!-- /container -->
            <script src="<%=path%>/static/js/classie.js"></script>
            <script src="<%=path%>/static/js/main.js"></script>
            </body>
    </div>
    <!--二级菜单引用结束-->
    <div class="TabbedPanelsContent"></div>
    <div class="TabbedPanelsContent">内容 4</div>
    <div class="TabbedPanelsContent">内容 5</div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
/* var TabbedPanels2 = new Spry.Widget.TabbedPanels("TabbedPanels2");
var TabbedPanels3 = new Spry.Widget.TabbedPanels("TabbedPanels3"); */
</script>
<script type="text/javascript">
$(".TabbedPanelsTab").eq(1).trigger("click");
$(".TabbedPanelsTab").eq(0).click(function(){
		//alert("ssss");
		//$(".TabbedPanelsTab2").eq(2).trigger("click");
		window.location="<%=basePath%>views/main3.jsp";
		
	});
	$("#button1").click(function(){
		window.location="<%=basePath%>views/routeNew.jsp";
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
   <%--  $.post("<%=basePath%>Database/ConfigPort.do",{vlanChecked:vlanChecked,checkedValue1:checkedValue1,checkedValue2:checkedValue2},function(data){
			alert(data);
			}); --%>

});

</script>
</body>
</html>
