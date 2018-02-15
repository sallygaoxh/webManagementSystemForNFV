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
    <li class="TabbedPanelsTab" tabindex="0">资源一览</li>
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="1">网络配置</li>
    <li class="TabbedPanelsTab" tabindex="2">网络查询</li>
    <li class="TabbedPanelsTab" tabindex="3">设备管理</li>

  </ul>

  
  <div class="TabbedPanelsContentGroup">

    <div class="TabbedPanelsContent"></div>  
    
    <div class="TabbedPanelsContent">内容 3
    <div>
         <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>Setting/autoSet.do" ><li class="TabbedPanelsTab2" tabindex="0">引导型配置</li></a>
         <a href="<%=basePath%>Setting/manualSet.do" ><li class="TabbedPanelsTab2" tabindex="0">手动配置接口</li></a>
         <a href="<%=basePath%>views/route.jsp" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">静态路由状态</li></a>
         <a href="<%=basePath%>views/routeNew.jsp" ><li class="TabbedPanelsTab2 " tabindex="0">新建静态路由</li></a>
         <a href="<%=basePath%>Database/getAllAdmin.do" ><li class="TabbedPanelsTab2 " tabindex="0">新建vlan</li></a>
        </ul>
		<div class="TabbedPanelsContentGroup2">
		<div class="TabbedPanelsContent2" >

<%-- 	<div>
	<form action="<%=basePath%>Setting/set1.do" method="post">
		Interface Name:<input type="text" name="interName" required = "true" value="f0/1"><br/>
		Vlan Number:<input type="text" name="vlanNum" required = "true" value="2"><br/>
		Vlan Name:  <input type="text" name="vlanName" required = "true" value="vlanA"><br/>
		<input type="submit" value="确定" id ="submit"></input>	
	</form>
	</div> --%>
	
	<div>
        	<h1>静态路由表</h1>
           	<hr />
           	<form>
          		<h2>本页设置交换机的静态路由信息。</h2>
                    
                    
                    <style type="text/css">
						.zebra{
							border-top-style: none;
							border-right-style: none;
							border-bottom-style: none;
							border-left-style: none;
							border-collapse:collapse;	
						}
						
						.zebra td, .zebra th {
							padding: 10px;
							border-left:none;
							border-right:none;
							border-top:none;
							border-bottom: 1px solid #f2f2f2;    
						}
						
						.zebra tbody tr:nth-child(even) {
							background: #f5f5f5;
							-webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
							-moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
							box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
						}
						
						.zebra th {
							text-align: left;
							text-shadow: 0 1px 0 rgba(255,255,255,.5); 
							border-bottom: 1px solid #ccc;
							background-color: #eee;
							background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));
							background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
							background-image:    -moz-linear-gradient(top, #f5f5f5, #eee);
							background-image:     -ms-linear-gradient(top, #f5f5f5, #eee);
							background-image:      -o-linear-gradient(top, #f5f5f5, #eee); 
							background-image:         linear-gradient(top, #f5f5f5, #eee);
						}
						
						.zebra th:first-child {
							-moz-border-radius: 6px 0 0 0;
							-webkit-border-radius: 6px 0 0 0;
							border-radius: 6px 0 0 0;  
						}
						
						.zebra th:last-child {
							-moz-border-radius: 0 6px 0 0;
							-webkit-border-radius: 0 6px 0 0;
							border-radius: 0 6px 0 0;
						}
						
						.zebra th:only-child{
							-moz-border-radius: 6px 6px 0 0;
							-webkit-border-radius: 6px 6px 0 0;
							border-radius: 6px 6px 0 0;
						}
						
						.zebra tfoot td {
							border-bottom: 0;
							border-top: 1px solid #fff;
							background-color: #f1f1f1;  
						}
						
						.zebra tfoot td:first-child {
							-moz-border-radius: 0 0 0 6px;
							-webkit-border-radius: 0 0 0 6px;
							border-radius: 0 0 0 6px;
						}
						
						.zebra tfoot td:last-child {
							-moz-border-radius: 0 0 6px 0;
							-webkit-border-radius: 0 0 6px 0;
							border-radius: 0 0 6px 0;
						}
						
						.zebra tfoot td:only-child{
							-moz-border-radius: 0 0 6px 6px;
							-webkit-border-radius: 0 0 6px 6px
							border-radius: 0 0 6px 6px
						}
					</style>
                    <table class="zebra">
                    <th>ID</th>
                    <th>目的网络地址</th>
                    <th>子网掩码</th>
                    <th>网关</th>
                    <th>状态</th>
                    <th>选择</th>
		<script type="text/javascript">
				var i = 1;
				              	while(/*开始查询数据库，将以前的信息找到*/i < 6){
					document.write("<tr>");
						document.write("<td>");
							document.write(i);
						document.write("</td>");
						
						document.write("<td>");
							document.write("192.168.1."+(i+9)/*从数据库调用目的网络地址*/);
						document.write("</td>");
						
						document.write("<td>");
							document.write("192.168.1.0"/*从数据库调用电子掩码*/);
						document.write("</td>");
						
						document.write("<td>");
							document.write("192.168.1.1"/*从数据库调用网关*/);
						document.write("</td>");
						
						document.write("<td>");
							document.write("启用"/*状态，不想要可以删了233333，这个位置选填启用和禁用*/);
						document.write("</td>");
						
						document.write("<td>");
							document.write("<input name='checkbox[]' type='checkbox' value='{$id}'>"/*只是一个效果示例*/);
						document.write("</td>");
					document.write("</tr>");
					i++;
				}
		</script>
		
                    </table>
                    <br />
                    <input type="button" class="button" id="button1" value="添加新规则" />
                    <br /><br />
                    <input type="button" value="删除选中项" />
            	</form>
			</div>        	
	</div>
	</div>
	</div>
	</div>
	<div class="TabbedPanelsContent">内容 4</div>
    <div class="TabbedPanelsContent">内容 5</div> 
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
	$("#button1").click(function(){
		window.location="<%=basePath%>views/routeNew.jsp";
	});
	
</script>


</body>
</html>