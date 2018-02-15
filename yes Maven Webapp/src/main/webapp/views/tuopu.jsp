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
<script type="text/javascript" src="<%=path%>/static/js/topo1.js"></script>
<link href="<%=path%>/static/css/topHover.css" rel="stylesheet" type="text/css"/>
</head>
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
	                                  name2: 'Cisco',
	                                  location: {
	                                  x: 300,
	                                  y: 300
	                                  }
	                                  });
	    switch1.setImage('switch1');
	    box.add(switch1);
	    
	    var switch2 = new twaver.Node({
	                                  name: 'switch2',
	                                  name2: 'Cisco',
	                                  location: {
	                                  x: 700,
	                                  y: 300
	                                  }
	                                  });
	    switch2.setImage('switch1');
	    box.add(switch2);
	    
	    var router1 = new twaver.Node({
	                                  name: 'router1',
	                                  name2: 'Huawei',
	                                  location: {
	                                  x: 300,
	                                  y: 100
	                                  }
	                                  });
	    box.add(router1);
	    router1.setImage('router');
	    
	    var router2 = new twaver.Node({
	                                  name: 'router2',
	                                  name2: 'Huawei',
	                                  location: {
	                                  x: 700,
	                                  y: 100
	                                  }
	                                  });
	    box.add(router2);
	    router2.setImage('router');
	    
	    var port1 = [];
	    var link1 = [];
	    var count = 0;
	    for (var i=0;i<objPorts.length;i++){
	    	for(var j=0; j<objPorts[i].length;j++){
	    		//alert(objPorts[i].length);
	    		if (objPorts[i][j].switype== '1'){
	    			port1[count] = new twaver.Node({
	    	                                   name: objPorts[i][j].inter,
	    	                                   location:{
	    	                                   x: (160 + 40*count),
	    	                                   y: 500
	    	                                   }
	    	                                   });
	    	        box.add(port1[count]);
	    	        port1[count].setClient('vlan', 'vlan'+objPorts[i][j].vlans);
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
	    		if (objPorts[i][j].switype== 0){
			        port2[count] = new twaver.Node({
			                                   name: objPorts[i][j].inter,
			                                   location:{
			                                   x: (560 + 40*count),
			                                   y: 500
			                                   }
			                                   });
			        box.add(port2[count]);
			        port2[count].setClient('vlan','vlan'+objPorts[i][j].vlans);
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
	                                      y: 100
	                                      }
	                                  });
	    switch1.setImage('switch1');
	    box.add(switch1);
	    switch1.setClient('vlan',vlanid);
	    switch1.setClient('brand','cisco');
	    
	    var port1 = [];
	    var link1 = [];
	    for (var i=0;i<objPorts[vlanid-1].length;i++){
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
	    } 
/*  	    for (var i=0;i<objPorts.length;i++){
	    	for(var j=0; j<objPorts[i].length;j++){
	    		//alert(objPorts[i].length);
	    		if (objPorts[i][j].vlans== vlanid){
			        port1[count] = new twaver.Node({
			                                   name: objPorts[i][j].inter,
			                                   location:{
			                                   x: (210 + 60*count),
			                                   y: 350
			                                   }
			                                   });
			        box.add(port1[count]);
			        port1[count].setClient('vlan','vlan'+objPorts[i][j].vlans);
			        link1[count] = new twaver.Link(switch1,port1[count]);
			        box.add(link1[count]);
			        count++;
	    		}
	    	}
	    } */
	    
	    for (var i=0;i<link1.length;i++){
	        link1[i].setStyle("link.color",setColor(port1[i]));
	    }
	    //autoLayouter.doLayout('topbottom');

} 
</script>

<body onLoad="init()">
<jsp:include page="logo.jsp" flush="true" />
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">

<!--     <li class="TabbedPanelsTab" tabindex="0" >主页</li> -->
    <li class="TabbedPanelsTab TabbedPanelsTabSelected"  tabindex="0">资源一览</li>
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
    </div>
    </div>    -->
    <div class="TabbedPanelsContent">内容 2
      <div>
        <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>views/main2.jsp" ><li class="TabbedPanelsTab2 " tabindex="0">全网拓扑</li></a>
         <a href="<%=basePath%>tableShow/getTable.do"> <li class="TabbedPanelsTab2 " tabindex="0">表格显示</li></a>
         <a href="<%=basePath%>TuopuShow/getPage.do" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">逻辑拓扑</li></a>
         <a href="<%=basePath%>views/rate.jsp"> <li class="TabbedPanelsTab2" tabindex="0">端口速率</li></a>
        </ul>
<div class="TabbedPanelsContentGroup2">
<div class="TabbedPanelsContent2" >
								   
							    <div>
	<!-- 						    <h4><input type="button" id="but01" value="查询所有"/></h4>
    
							<h4>virId:<input type="text" name="virId1" id="virId1"/>
							    <input type="button" id="but02" value="查询vir"/></h4>
							    
							    <h4>onuId:<input type="text" name="onuId1" id="onuId1"/>
							    <input type="button" id="but03" value="删除byId"/></h4> -->
	   	 				<!-- 	    <h4>onuName:<input type="text" name="onuName1" id="onuName1"/>
								<input type="button" id="but04" value="删除byName"/></h4>
								    
								
								<h4>onuName:<input type="text" name="onuName" id="onuName"/>
								oltId:<input type="text" name="oltId" id="oltId"/>
								virId:<input type="text" name="virId" id="virId"/>
								<input type="button" id="but05" value="增加"/></h4> -->
								</div>
							    <div id=topo></div>						   
 
</div>
</div>
</div>
    </div>
    <div class="TabbedPanelsContent"> </div>
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
	//$(".TabbedPanelsTab2").eq(2).trigger("click");
	window.location="<%=basePath%>Setting/autoSet.do";
	
}); 
</script>
</body>
</html>
