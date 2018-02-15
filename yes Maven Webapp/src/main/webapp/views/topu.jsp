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
<script type="text/javascript" src="<%=path%>/static/js/twaver.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.freezeheader.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jtopo-0.4.8-min.js"></script>
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

    <div class="TabbedPanelsContent">内容 2
      <div>
        <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>views/main2.jsp" ><li class="TabbedPanelsTab2 " tabindex="0">全网拓扑</li></a>
         <a href="<%=basePath%>tableShow/getTable.do"> <li class="TabbedPanelsTab2 " tabindex="0">表格显示</li></a>
         <a href="<%=basePath%>TuopuShow/getPage.do" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">逻辑拓扑</li></a>
         
        </ul>
<div class="TabbedPanelsContentGroup2">
<div class="TabbedPanelsContent2" >
	<div id=canvas></div>						   
</div>
</div>
</div>
    </div>
    <div class="TabbedPanelsContent">内容 3
    <jsp:include page="menu2.jsp" flush="true" />
    
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
$(document).ready(function(){
    var canvas = document.getElementById('canvas');
    var stage = new JTopo.Stage(canvas); // 创建一个舞台对象
    var scene = new JTopo.Scene(stage); // 创建一个场景对象
    
    var node = new JTopo.Node("Hello");    // 创建一个节点
    node.setLocation(300,200);    // 设置节点坐标
    scene.add(node); // 放入到场景中
                     });	
</script>							    
							    


<script type="text/javascript">
$(".TabbedPanelsTab").eq(0).trigger("click");
</script>
</body>
</html>
