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
<script type="text/javascript" src="<%=path%>/static/js/twaver.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/topo1.js"></script>
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
<script type="text/javascript">
var rank1=<%=session.getAttribute("rank1")%>;
var ports=<%=session.getAttribute("ports")%>;
var objPorts= eval(ports);
alert(objPorts[0].length+","+objPorts[1].length+","+objPorts.length);    
if (rank1==1||rank1=='1'||rank1=="1"){
	//var ports="<%=session.getAttribute("ports")%>";
<%-- 	var vlans="<%=session.getAttribute("vlans")%>";
	alert(vlans); --%>
	//alert(ports);
	
	/*$("#but01").click(function(){
		$.post("<%=basePath%>admin/showall.do",{userId:"111"},function(mm){

			tp=mm;
			alert(tp.length);
			alert(tp[0].length);
			loadAll();
			
			}, "json");
		});*/
		alert('1');
	    var switch1 = new twaver.Node({
	                                  name: 'switch1',
	                                  location: {
	                                  x: 300,
	                                  y: 300
	                                  }
	                                  });
	    switch1.setImage('switch1');
	    switch1.setClient('brand', 'Cisco');
	    box.add(switch1);
	    
	    var switch2 = new twaver.Node({
	                                  name: 'switch2',
	                                  location: {
	                                  x: 700,
	                                  y: 300
	                                  }
	                                  });
	    switch2.setImage('switch1');
	    switch2.setClient('brand', 'Cisco');
	    box.add(switch2);
	    
	    var router1 = new twaver.Node({
	                                  name: 'router1',
	                                  location: {
	                                  x: 300,
	                                  y: 150
	                                  }
	                                  });
	    box.add(router1);
	    router1.setImage('router');
	    router1.setClient('brand', 'Huawei');
	    
	    var router2 = new twaver.Node({
	                                  name: 'router2',
	                                  name2: 'Huawei',
	                                  location: {
	                                  x: 700,
	                                  y: 150
	                                  }
	                                  });
	    box.add(router2);
	    router2.setImage('router');
	    router2.setClient('brand', 'Huawei');
	    var port1 = [];
	    var link1 = [];
	    var count = 0;
	    for (var i=0;i<objPorts.length;i++){
	    	for(var j=0; j<objPorts[i].length;j++){
	    		//alert(objPorts[i].length);
	    		if (objPorts[i][j].pby1== '20015998343868'){
	    			port1[count] = new twaver.Node({
	    	                                   name: objPorts[i][j].inter,
	    	                                   location:{
	    	                                   x: (160 + 40*count),
	    	                                   y: 500
	    	                                   }
	    	                                   });
	    	        box.add(port1[count]);
	    	        port1[count].setClient('vlan', 'vlan'+objPorts[i][j].vlans);
	    	        port1[count].setClient('brand', objPorts[i][j].switype);
	    	        link1[count] = new twaver.Link(switch1,port1[count]);
	    	        box.add(link1[count]);
	    	        count++;
	    		}
	    	    	   		
	    	}
	        
	    }
	    
	    var port2 = [];
	    var link2 = [];
	    var count = 0;
	    for (var i=0;i<objPorts.length;i++){
	    	for(var j=0; j<objPorts[i].length;j++){
	    		//alert(objPorts[i].length);
	    		if (objPorts[i][j].pby1== '167633986132668'){
			        port2[count] = new twaver.Node({
			                                   name: objPorts[i][j].inter,
			                                   location:{
			                                   x: (560 + 40*count),
			                                   y: 500
			                                   }
			                                   });
			        box.add(port2[count]);
			        port2[count].setClient('vlan','vlan'+objPorts[i][j].vlans);
			        port1[count].setClient('brand', objPorts[i][j].switype);
			        link2[count] = new twaver.Link(switch2,port2[count]);
			        box.add(link2[count]);
			        count++;
	    		}
	    	}
	    }
	    
	    for (var i=0;i<port1.length;i++){
	        link1[i].setStyle("link.color",setColor(port1[i]));
	    }
	    for (var i=0;i<port2.length;i++){
	    	link2[i].setStyle("link.color",setColor(port2[i]));
	    }
	    
	    var link1 = new twaver.Link(router1, switch1);
	    link1.setClient('clientProperty',switch1);
	    box.add(link1);
	    
	    var link2 = new twaver.Link(router2, switch2);
	    link2.setClient('clientProperty',switch2);
	    box.add(link2);
	    
	    var link = new twaver.Link(router2, router1);
	    link.setStyle("link.width", 5);
	    link.setStyle("link.color", '#CD3333');
	    
	    box.add(link);

}	 
 else if (rank1=='2'){
	 //alert('2'); 
	 	var nodeName = '<%=session.getAttribute("username")%>';
	 	var vlanid = <%=session.getAttribute("vlanid")%>;
		var switch1 = new twaver.Node({
	                                  name: ''+nodeName,
	                                  location:{
	                                      x: 300,
	                                      y: 150
	                                      }
	                                  });
	    switch1.setImage('switch1');
	    box.add(switch1);
	    switch1.setClient('vlan',vlanid);
	    switch1.setClient('brand','cisco');
	    
	    var port1 = [];
	    var link1 = [];
	    var count = 0;
/* 	    for (var i=0;i<objPorts[vlanid-1].length;i++){
	        port1[i] = new twaver.Node({
	                                   name: objPorts[vlanid-1][i].inter,
	                                   location:{
	                                       x: (210 + 60*i),
	                                       y: 350
	                                       }
	                                   });
	        box.add(port1[i]);
	        port1[i].setClient('vlan','vlan'+ vlanid);
	        link1[i] = new twaver.Link(switch1,port1[i]);
	        box.add(link1[i]);
	    } */ 
  	    for (var i=0;i<objPorts.length;i++){
	    	for(var j=0; j<objPorts[i].length;j++){
	    		if (objPorts[i][j].vlans == vlanid){
			        port1[count] = new twaver.Node({
			                                   name: objPorts[i][j].inter,
			                                   location:{
			                                   x: (210 + 60*count),
			                                   y: 350
			                                   }
			                                   });
			        box.add(port1[count]);
			        port1[count].setClient('vlan','vlan'+objPorts[i][j].vlans);
			        port1[count].setClient('brand',objPorts[i][j].switype);
			        link1[count] = new twaver.Link(switch1,port1[count]);
			        box.add(link1[count]);
			        count++;
	    		}
	    	}
	    } 
	    //alert(port1.length);
	    for (var i=0;i<link1.length;i++){
	        link1[i].setStyle("link.color",setColor(port1[i]));
	    }
	    //autoLayouter.doLayout('topbottom');

} 
</script>
</head>

<body  onLoad="init()">
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
                        <a href="<%=basePath%>views/main3.jsp" ><i class="fa fa-fw fa-home"></i>&nbsp;全网拓扑</a>
                        <a href="<%=basePath%>tableShow/getTable.do"> <i class="fa fa-fw fa-bar-chart-o "></i>&nbsp;表格显示</a>
                        <a href="<%=basePath%>TuopuShow/getPage.do" ><i class="fa fa-fw fa-newspaper-o"></i>&nbsp;逻辑拓扑</a>
                        <a href="<%=basePath%>views/rate3.jsp"><i class="fa fa-fw fa-star-o"></i>&nbsp;端口速率</a>
                    </nav>
                </div>
                <button class="menu-button" id="open-button"></button><!--每个按钮对应一个main*.js文件，保证每个菜单都能正确的呼出-->
                <div class="content-wrap" id="content-wrap">
                <div class="content">
					<!--内容页面开始-->
      				<div style="width:90%;float: right;height:570px;overflow:auto;margin:0px;">
                                                              <!--标题样式-->
                        <div class="grid__item">
                        <a class="link link--takiri" href="#">拓扑显示 <span>本页显示运营商的端口拓扑图</span></a>
                        <div id=topo></div>	
                        </div>
                        <hr />
						<!--标题样式结束-->

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
$(".LPorts:even").addClass("gridAlternada");
$(".LPorts:odd").addClass("grid");
$(".TabbedPanelsTab").eq(0).trigger("click");
$(".TabbedPanelsTab").eq(1).click(function(){
	//alert("ssss");
	//$(".TabbedPanelsTab2").eq(2).trigger("click");
	window.location="<%=basePath%>Setting/manualSet.do";
	
});  
</script>
</body>
</html>





