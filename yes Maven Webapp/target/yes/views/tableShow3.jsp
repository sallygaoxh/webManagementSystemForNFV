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
<script  type="text/javascript">
  $(document).ready(function () {
        $("#table1").freezeHeader({ 'height': '300px' });
	    $("#table2").freezeHeader();	    
	   $("#tbex1").freezeHeader();
            $("#tbex2").freezeHeader();
            $("#tbex3").freezeHeader();
            $("#tbex4").freezeHeader();	
        });
  </script>
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
                        <a class="link link--takiri" href="#">端口显示 <span>本页显示运营商的端口资源信息</span></a>
                        </div>
                        <hr />
						<!--标题样式结束-->
                                                            <table class="zebra" style="width: 1000px" id="table1">
                                                            <!-- class="zebra" -->

                                                            <thead>
                                                                <tr>
                                                                        <th>inter</th>
                                                                        <th>status</th>
                                                                        <th>ipAdd</th>
                                                                        <th>valid</th>
                                                                        <th>prol</th>
                                                                        <th>method</th>
                                                                        <th>bw</th>
                                                                        <th>inuti</th>
                                                                        <th>oututi</th>
                                                                        <th>inerrors</th>
                                                                        <th>outerrors</th>
                                                                        <th>swiType</th>
                                                                        <th>vlan</th>
                                                                        <th>dpid</th>
                                                                        
                                                                        <!-- <th>操作</th> -->
                                                                </tr>
                                                            </thead>
                                                            <tbody >
							              <%--   <%
  											HttpSession sessions=request.getSession();
   											//session.getAttribute("rank1");
   											Object sessionValues1=sessions.getAttribute("vlanid");
   										  %> 
   										    从Session中取出值：<%=sessionValues1 %>  --%>
   										   <c:if test="${rank1==1}">
                                                            <c:forEach items="${LPorts}" var="item">
							
							
                                                            <tr class="LPorts">
                                                                    <td>${item.inter }</td>
                                                                    <td>${item.status }</td>
                                                                    <td>${item.ipadd}</td>
                                                                    <td>${item.valid } </td>
                                                                    <td>${item.prol }</td>
                                                                    <td>${item.method }</td>
                                                                    <td>${item.bw }</td>
                                                                    <td>${item.inuti }</td>
                                                                    <td>${item.oututi }</td>
                                                                    <td>${item.inerrors }</td>
                                                                    <td>${item.outerrors }</td>
                                                                     <td>${item.switype }</td>
                                                                    <td>${item.vlans[0]}</td>
                                                                    <td>${item.pby1 }</td>
                                                                   <%--  <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td> --%>
                                                           	</tr>	
                                                           	 </c:forEach>	
                                                           	</c:if> 
                                          
                                           <c:if test="${rank1==2}">
                                                            <c:forEach items="${LPorts}" var="item">
							
							                               <c:if test="${vlanid==item.vlans[0]}">
                                                            <tr class="LPorts">
                                                                    <td>${item.inter }</td>
                                                                    <td>${item.status }</td>
                                                                    <td>${item.ipadd}</td>
                                                                    <td>${item.valid } </td>
                                                                    <td>${item.prol }</td>
                                                                    <td>${item.method }</td>
                                                                    <td>${item.bw }</td>
                                                                    <td>${item.inuti }</td>
                                                                    <td>${item.oututi }</td>
                                                                    <td>${item.inerrors }</td>
                                                                    <td>${item.outerrors }</td>
                                                                     <td>${item.switype }</td>
                                                                    <td>${item.vlans[0]}</td>
                                                                    <td>${item.pby1 }</td>
                                                                   <%--  <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td> --%>
                                                           	</tr>	
                                                           	</c:if>
                                                           	 </c:forEach>	
                                                           	</c:if>                  	
                                                           	
                                                           	   <%--  <tr class="LPorts">
                                                                    <td>G0/1</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-1</td>
                                                                    <td>1</td>
                                                                    <th>1</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>	
                                                           	 <tr class="LPorts">
                                                                    <td>G0/2</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-1</td>
                                                                    <td>1</td>
                                                                    <th>1</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>
                                                           	 <tr class="LPorts">
                                                                    <td>G0/3</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-1</td>
                                                                    <td>1</td>
                                                                    <th>1</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>	
                                                           	 <tr class="LPorts">
                                                                    <td>G0/4</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>down</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>
                                                           	 <tr class="LPorts">
                                                                    <td>G0/5</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>
                                                           		 <tr class="LPorts">
                                                                    <td>G0/6</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>
                                                           	
                                                           		
                                                           		 <tr class="LPorts">
                                                                    <td>G0/7</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>	
                                                           	
                                                           		 <tr class="LPorts">
                                                                    <td>G0/6</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>		
                                                           	
                                                           	 <tr class="LPorts">
                                                                    <td>G0/7</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>
                                                           	
                                                           		 <tr class="LPorts">
                                                                    <td>G0/8</td>
                                                                    <td>1</td>
                                                                    <td>255.255.255.255</td>
                                                                    <td>ok </td>
                                                                    <td>up</td>
                                                                    <td>0</td>
                                                                    <td>100</td>
                                                                    <td>def</td>
                                                                    <td>def</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>cisco-2</td>
                                                                    <td>2</td>
                                                                    <th>2</th>
                                                                    <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td>
                                                           	</tr>			
								 --%>
									
                                                           					
                                                            </tbody>
                                                            </table>

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





