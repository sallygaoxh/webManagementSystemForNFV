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
<script type="text/javascript" src="<%=path%>/static/js/api.js"></script>
<link href="<%=path%>/static/css/topHover.css" rel="stylesheet" type="text/css"/>


</head>


<body>
<jsp:include page="logo.jsp" flush="true" />
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">

  <!--   <li class="TabbedPanelsTab" tabindex="0" >主页</li> -->
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="0">资源一览</li>
    <li class="TabbedPanelsTab" tabindex="1">网络配置</li>
    <li class="TabbedPanelsTab" tabindex="2">网络查询</li>
    <li class="TabbedPanelsTab" tabindex="3">设备管理</li>

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
    </div> -->
    <div class="TabbedPanelsContent">内容 2
		<jsp:include page="mapinclude.jsp" flush="true" />
	</div>
    <div class="TabbedPanelsContent">
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
$(".TabbedPanelsTab").eq(0).trigger("click");
$(".TabbedPanelsTab").eq(1).click(function(){
	//alert("ssss");
	//$(".TabbedPanelsTab2").eq(3).trigger("click");
	window.location="<%=basePath%>Setting/autoSet.do";
	
}); 
</script>
</body>
</html>
