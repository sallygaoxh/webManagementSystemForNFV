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
                        <a class="link link--takiri" href="#">VLAN绑定  <span>本页允许用户根据业务需要进行VLAN绑定的增加或删除</span></a>
                        </div>
                        <hr />
						<!--标题样式结束-->
			            <form>
			            
			            <table class="zebra" >
			 			<c:if test="${rank1==1}">
			            <th>用户id</th>
			            <th>用户rank</th>
			            <th>用户分配vlan</th>
			            
			            
			            <c:forEach items="${AdminUser}" var="item">
			             <tr>
			            	<td>${item.username}</td>
			            	<td>${item.rank}</td>
			            	<td>${item.vlan}</td>          	
			            </tr>
			            </c:forEach>
			            </c:if>
			            
			             <c:if test="${rank1==2}">
			             <th>空端口</th>
			            <th>属于vlan</th>
			            <th>交换机</th>
                                                            <c:forEach items="${idlport}" var="item">
							
							                               <c:if test="${1==item.vlans[0]}">
                                                            <tr class="LPorts">
                                                                    <td>${item.inter }</td>
                                                                    <td>VLAN1(未分配)</td>
                                                                    <td><c:if test="${item.pby1=='20015998343868'}">1
			            	</c:if>
			            	<c:if test="${item.pby1=='167633986132668'}">2
			            	</c:if>
                                                                    </td>
                                                                   <%--  <td>
																			<a href="<%=basePath%>tableShow/loadUpdate.do?Id=${item.onu_id }">修改</a>
																			<a href="<%=basePath%>tableShow/deleteById.do?Id=${item.onu_id }">删除</a>
                                                           			</td> --%>
                                                           	</tr>	
                                                           	</c:if>
                                                           	 </c:forEach>	
                                                           	</c:if>                  	
                                                           	
			            
			            <%-- <c:if test="${rank1==2}">
			            <c:forEach items="${LPorts}" var="item">
			             <c:if test="${item.vlans[0]=='1'}">
			             <th>可用空端口</th>
			             <th>交换机</th>
			            
			             <tr>
			            	<td>${item.inter}</td>
			            	<td> <c:if test="${item.pby1=='20015998343868'}">1
			            	</c:if>
			            	<c:if test="${item.pby1=='167633986132668'}">2
			            	</c:if>
			            	</td>      	
			            </tr>
			            </c:if>
			            </c:forEach>
			            </c:if> --%>
			            
			           <%--   <c:if test="${rank1==2}">
			            <th>拥有端口</th>
			            <th>端口ip</th>
			            <th>端口属于vlan</th>
			            
			            
			            <c:forEach items="${LPorts}" var="item">
			            <c:if test="${vlanid==item.vlans[0]}">
			             <tr>
			            	<td>${item.inter }</td>
			            	<td>${item.ipadd}</td>
			            	<td>${item.vlans[0]}</td>          	
			            </tr>
			            </c:if>
			            </c:forEach>
			            </c:if> --%>
			           
			            
			            
			            
			            </table> 
            <br />
            <!-- <input type="submit" class="button" value="删除选中项" /> -->
            </form>
            <br />
            <hr />
            <br />
            <form>
            <table class="zebra" style="width:900px;">
            <div id = "wrap">
            <c:if test="${rank1==1}">
            <tr>
            	<td>VLAN</td>
                <td><label><input name='radiovlan' type='radio'  value='1'>VLAN1</label></td>
                <td><label><input name='radiovlan' type='radio'  value='2'>VLAN2</label></td>
                <td><label><input name='radiovlan' type='radio'  value='3'>VLAN3</label></td>
                <td><label><input name='radiovlan' type='radio'  value='4'>VLAN4</label></td>
            </tr>
            </c:if>
            <c:if test="${rank1==2}">
            <tr>
            	分配给您的vlan为VLAN${vlanid}
            </tr>
            </c:if>
            </div>
            <tr>
            	<td>交换机1</td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/1'>端口1</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/2'>端口2</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/3'>端口3</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/4'>端口4</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/5'>端口5</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/6'>端口6</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/7'>端口7</label></td>
                <td><label><input name='checkboxssport[1]' type='checkbox' value='G0/8'>端口8</label></td>
            </tr>
            <tr>
            	<td>交换机2</td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/1'>端口1</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/2'>端口2</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/3'>端口3</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/4'>端口4</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/5'>端口5</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/6'>端口6</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/7'>端口7</label></td>
                <td><label><input name='checkboxssport[2]' type='checkbox' value='G0/8'>端口8</label></td>
            </tr>

            </table>
            <br />
            <input type="button" class="zebrabutton" id="but1" value="确认" />
            <br />
            </form>
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
$("#but1").click(function(){
	//$("[name='checkboxssport[]']").attr("checked",'true');
	var checkedValue1 = new Array();
	var checkedValue2 = new Array();
	var i = 0;
	$("input[name='checkboxssport[1]']:checked").each(function(){
		//checkedValue[i]=$(this).val();
	
		checkedValue1.push($(this).val());
	});
	$("input[name='checkboxssport[2]']:checked").each(function(){
		//checkedValue[i]=$(this).val();
	
		checkedValue2.push($(this).val());
	});
	 /* var checkedPort = "";
	for (i=0;i<checkedValue.length;i++){
		
		checkedPort+=""+checkedValue[i];
	}  */
	//alert(checkedPort);
	var vlanChecked;
	if(<%=session.getAttribute("rank1")%>==2)
		vlanChecked=<%=session.getAttribute("vlanid")%>;
	else{
	vlanChecked = $("input[name='radiovlan']:checked").val();
	}
	if(vlanChecked==null){
		alert("请选择需要配置的vlan");
	}
	else if(checkedValue1.length == 0&&checkedValue2.length == 0){
		alert("请选择需要配置的port");
	}else{
	if(checkedValue1.length == 0) checkedValue1.push("s");
	if(checkedValue2.length == 0) checkedValue2.push("s");
	
	$.post("<%=basePath%>Database/ConfigPort.do",{vlanChecked:vlanChecked,checkedValue1:checkedValue1,checkedValue2:checkedValue2},function(data){
			alert(data);
			});
	}			
});
</script>
</body>
</html>
