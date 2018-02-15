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
<link href="<%=path%>/static/css/topHover.css" rel="stylesheet" type="text/css"/>
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
<jsp:include page="logo.jsp" flush="true" />
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">

<!--     <li class="TabbedPanelsTab" tabindex="0" >主页</li> -->
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="0">资源一览</li>
    <li class="TabbedPanelsTab" tabindex="0">网络配置</li>
    <li class="TabbedPanelsTab" tabindex="0">网络查询</li>
    <li class="TabbedPanelsTab" tabindex="0">设备管理</li>

  </ul>

  
  <div class="TabbedPanelsContentGroup">

    <div class="TabbedPanelsContent">内容 2
      <div>
        <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>views/main2.jsp" ><li class="TabbedPanelsTab2 " tabindex="0">全网拓扑</li></a>
         <a href="<%=basePath%>tableShow/getTable.do"> <li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">表格显示</li></a>
         <a href="<%=basePath%>TuopuShow/getPage.do" ><li class="TabbedPanelsTab2" tabindex="0">逻辑拓扑</li></a>
         <a href="<%=basePath%>views/rate.jsp"> <li class="TabbedPanelsTab2" tabindex="0">端口速率</li></a> 
        </ul>
           
    <div class="TabbedPanelsContentGroup2">
    <div class="TabbedPanelsContent2">
   <%--  <div>
    <form action="<%=basePath%>tableShow/queryOnu.do" method="post">
		onu_type：<input type="text" name="onu_type"/>
			<input type="submit" value="查询"/>	
			<input type="button" value="添加" onclick="javascript:window.location='<%=basePath%>views/addOnu.jsp'">
	</form>
	</div> --%>
 

                                                             <div class="TabbedPandlsContent2Chart">  
                                                              <div class="wrapper">
                                                              <h2>
																<a name="demo" href="#demo"></a>端口显示</h2>
                                                            <table class="gridView" id="table1">

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
</div>
</div>
</div>
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
$(".LPorts:even").addClass("gridAlternada");
$(".LPorts:odd").addClass("grid");
$(".TabbedPanelsTab").eq(0).trigger("click");
$(".TabbedPanelsTab").eq(1).click(function(){
	//alert("ssss");
	//$(".TabbedPanelsTab2").eq(2).trigger("click");
	window.location="<%=basePath%>Setting/autoSet.do";
	
});  
</script>
</body>
</html>





