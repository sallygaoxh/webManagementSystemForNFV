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
<!--引用css文件-->
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
        <div class="TabbedPanelsContent"> <!--内容 1-->
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
                        <a href="<%=basePath%>views/main3.jsp" ><i class="fa fa-fw fa-home"></i>&nbsp;全网拓扑</a>
                        <a href="<%=basePath%>tableShow/getTable.do"> <i class="fa fa-fw fa-bar-chart-o"></i>&nbsp;表格显示</a>
                        <a href="<%=basePath%>TuopuShow/getPage.do" ><i class="fa fa-fw fa-newspaper-o"></i>&nbsp;逻辑拓扑</a>
                        <a href="<%=basePath%>views/rate3.jsp"><i class="fa fa-fw fa-star-o"></i>&nbsp;端口速率</a>
                    </nav>
                </div>
                <button class="menu-button" id="open-button"></button><!--每个按钮对应一个main*.js文件，保证每个菜单都能正确的呼出-->
                <div class="content-wrap" id="content-wrap">
                    <div class="content">
					<!--内容页面开始-->
                    
                    <!--从此处开始百度地图api-->
                    <div><div id="allmap" style="width:90%;float: right;height:570px;overflow:auto;margin:0px;font-family:"微软雅黑";"></div>
                     <script type="text/javascript">
                                    // 百度地图API功能
                                    var map = new BMap.Map("allmap", {enableMapClick:false,minZoom:12,maxZoom:19});    // 创建Map实例
                                    document.getElementById("allmap").style.display='block';
                                    document.getElementById("allmap").style.poistion='fixed';
                                    map.centerAndZoom(new BMap.Point(116.404, 39.895), 14);  // 初始化地图,设置中心点坐标和地图级别
                                    //map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
                                    //map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
                                    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
                                    //---------------地图设置---------------------------------------------------------------
                                    
                                    //--------------OLT的设置---------------------------------------------------------------
                                    //下面是信息窗格，主要写明点击交换机之后的弹窗内容
                                    var OLTINFO =
                                    "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>OLTINFO</h4>" + 
                                    "<img style='float:right;margin:4px' id='cisco' src='../static/img/cisco.jpg' width='120' height='120' title='cisco'/>" + 
                                    "<p style='margin:0;line-height:1.5;font-size:13px'>名字：思科<br>ID：44944<br>上行：10M/s<br>下行：100M/s</p>" + 
                                    "</div>";
                                    var OLTPOINT = new BMap.Point(116.404, 39.915);
                                    var OLTICON = new BMap.Icon("../static/img/olt.png", new BMap.Size(23,40));
                                    var OLT = new BMap.Marker(OLTPOINT,{icon:OLTICON});
                                    var OLTinfoWindow = new BMap.InfoWindow(OLTINFO);  // 创建信息窗口对象
                                    
                                    
                                    //e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）OLT表示绑定的OLT
                                    //e（如果自己没有传参数的话表示表示覆盖物（有经纬度）  ee为undefined OLT表示绑定的OLT
                                    
                                    
                                    var removeMarker = function(e,ee,OLT){
                                        map.removeOverlay(OLT);
                                    }
                                    
                                    OLT.addEventListener("click", function(){          
                                       this.openInfoWindow(OLTinfoWindow);
                                       //图片加载完毕重绘infowindow
                                       document.getElementById('cisco').onload = function (){
                                           OLTinfoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                                       }
                                    });	//左键click动作
                                    
                                    //创建右键菜单
                                    var OLTMENU = new BMap.ContextMenu();
                                    OLTMENU.addItem(new BMap.MenuItem('配置',removeMarker.bind(OLT)));
                                    OLTMENU.addItem(new BMap.MenuItem('删除',removeMarker.bind(OLT)));
                                    OLTMENU.addItem(new BMap.MenuItem('重启',removeMarker.bind(OLT)));
                                    OLTMENU.addItem(new BMap.MenuItem('关闭',removeMarker.bind(OLT)));
                                    
                                    OLT.addContextMenu(OLTMENU);
                                    map.addOverlay(OLT);
                                    //OLT.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                                    //--------------OLT结束-----------------------------------------------------------------
                                    
                                    
                                    //--------------ONU的设置---------------------------------------------------------------
                                    //下面是信息窗格，主要写明点击交换机之后的弹窗内容
                                    var ONUINFO =
                                    "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>ONUINFO</h4>" + 
                                    "<img style='float:right;margin:4px' id='cisco' src='../static/img/cisco.jpg' width='120' height='120' title='cisco'/>" + 
                                    "<p style='margin:0;line-height:1.5;font-size:13px'>名字：思科<br>ID：44945<br>上行：10M/s<br>下行：100M/s</p>" + 
                                    "</div>";
                                    var ONUPOINT = new BMap.Point(116.404, 39.885);
                                    var ONUICON = new BMap.Icon("../static/img/onu.png", new BMap.Size(54,40));
                                    var ONU = new BMap.Marker(ONUPOINT,{icon:ONUICON});
                                    var ONUinfoWindow = new BMap.InfoWindow(ONUINFO);  // 创建信息窗口对象
                                    
                                    
                                    //e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）ONU表示绑定的ONU
                                    //e（如果自己没有传参数的话表示表示覆盖物（有经纬度）  ee为undefined ONU表示绑定的ONU
                                    
                                    
                                    var removeMarker2 = function(e,ee,ONU){
                                        map.removeOverlay(ONU);
                                    }
                                    
                                    ONU.addEventListener("click", function(){          
                                       this.openInfoWindow(ONUinfoWindow);
                                       //图片加载完毕重绘infowindow
                                       document.getElementById('cisco').onload = function (){
                                           ONUinfoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                                       }
                                    });	//左键click动作
                                    
                                    //创建右键菜单
                                    var ONUMENU = new BMap.ContextMenu();
                                    ONUMENU.addItem(new BMap.MenuItem('配置',removeMarker2.bind(ONU)));
                                    ONUMENU.addItem(new BMap.MenuItem('删除',removeMarker2.bind(ONU)));
                                    ONUMENU.addItem(new BMap.MenuItem('重启',removeMarker2.bind(ONU)));
                                    ONUMENU.addItem(new BMap.MenuItem('关闭',removeMarker2.bind(ONU)));
                                    
                                    ONU.addContextMenu(ONUMENU);
                                    map.addOverlay(ONU);
                                    //ONU.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                                    //--------------ONU结束-----------------------------------------------------------------
                                    
                                    //--------------ONU2的设置---------------------------------------------------------------
                                    //下面是信息窗格，主要写明点击交换机之后的弹窗内容
                                    var ONUINFO2 =
                                    "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>ONUINFO</h4>" + 
                                    "<img style='float:right;margin:4px' id='cisco' src='../static/img/cisco.jpg' width='120' height='120' title='cisco'/>" + 
                                    "<p style='margin:0;line-height:1.5;font-size:13px'>名字：思科<br>ID：44947<br>上行：1M/s<br>下行：20M/s</p>" + 
                                    "</div>";
                                    var ONUPOINT2 = new BMap.Point(116.434, 39.885);
                                    var ONUICON2 = new BMap.Icon("../static/img/onu.png", new BMap.Size(54,40));
                                    var ONU2 = new BMap.Marker(ONUPOINT2,{icon:ONUICON2});
                                    var ONUinfoWindow2 = new BMap.InfoWindow(ONUINFO2);  // 创建信息窗口对象
                                    
                                    
                                    //e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）ONU表示绑定的ONU
                                    //e（如果自己没有传参数的话表示表示覆盖物（有经纬度）  ee为undefined ONU表示绑定的ONU
                                    
                                    
                                    var removeMarker3 = function(e,ee,ONU){
                                        map.removeOverlay(ONU2);
                                    }
                                    
                                    ONU2.addEventListener("click", function(){          
                                       this.openInfoWindow(ONUinfoWindow2);
                                       //图片加载完毕重绘infowindow
                                       document.getElementById('cisco').onload = function (){
                                           ONUinfoWindow2.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                                       }
                                    });	//左键click动作
                                    
                                    //创建右键菜单
                                    var ONUMENU2 = new BMap.ContextMenu();
                                    ONUMENU2.addItem(new BMap.MenuItem('配置',removeMarker3.bind(ONU2)));
                                    ONUMENU2.addItem(new BMap.MenuItem('删除',removeMarker3.bind(ONU2)));
                                    ONUMENU2.addItem(new BMap.MenuItem('重启',removeMarker3.bind(ONU2)));
                                    ONUMENU2.addItem(new BMap.MenuItem('关闭',removeMarker3.bind(ONU2)));
                                    
                                    ONU2.addContextMenu(ONUMENU2);
                                    map.addOverlay(ONU2);
                                    //ONU2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                                    //--------------ONU2结束-----------------------------------------------------------------
                                    
                                    //--------------添加连线效果-----------------------------------------------------------------
                                    var polyline1 = new BMap.Polyline([OLTPOINT, ONUPOINT], {strokeColor:"blue", strokeWeight:4, strokeOpacity:0.5});
                                    var polyline2 = new BMap.Polyline([OLTPOINT, ONUPOINT2], {strokeColor:"blue", strokeWeight:4, strokeOpacity:0.5});
                                    map.addOverlay(polyline1);
                                    map.addOverlay(polyline2);
                                </script></div>
                    <!--百度地图api结束-->
                    
					<!--内容页面结束-->
                    </div>
                </div><!-- /content-wrap -->
            </div><!-- /container -->
            <script src="<%=path%>/static/js/classie.js"></script>
            <script src="<%=path%>/static/js/main.js"></script>
            </body>
        <!--二级菜单引用结束-->
     
        </div>

      </div>
      <!--内容div定义结束-->
      
    </div>

	<script type="text/javascript">
    var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
    $(".TabbedPanelsTab").eq(1).click(function(){
		//alert("ssss");
		//$(".TabbedPanelsTab2").eq(2).trigger("click");
		window.location="<%=basePath%>Setting/manualSet.do";
		
	});

    </script>
</body>
</html>
