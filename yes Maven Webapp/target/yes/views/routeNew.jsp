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
         <a href="<%=basePath%>Setting/autoSet.do" ><li class="TabbedPanelsTab2  " tabindex="0">引导型配置</li></a>
         <a href="<%=basePath%>Setting/manualSet.do" ><li class="TabbedPanelsTab2" tabindex="0">手动配置接口</li></a>
         <a href="<%=basePath%>views/route.jsp" ><li class="TabbedPanelsTab2" tabindex="0">静态路由状态</li></a>
         <a href="<%=basePath%>views/routeNew.jsp" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">新建静态路由</li></a>
         <a href="<%=basePath%>Database/getAllAdmin.do" ><li class="TabbedPanelsTab2" tabindex="0">新建vlan</li></a>
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
            	<style>
                .basic-grey {
					margin-left:0px;
					margin-right:auto;
					max-width: 700px;
					background: #F7F7F7;
					padding: 25px 15px 25px 10px;
					font: 14px Georgia, "Times New Roman", Times, serif;
					color: #888;
					text-shadow: 1px 1px 1px #FFF;
					border:1px solid #E4E4E4;
					}
					.basic-grey h1 {
					font-size: 25px;
					padding: 0px 0px 10px 40px;
					display: block;
					border-bottom:1px solid #E4E4E4;
					margin: -10px -15px 30px -10px;;
					color: #888;
					}
					.basic-grey h1>span {
					display: block;
					font-size: 11px;
					}
					.basic-grey label {
					display: block;
					margin: 0px;
					}
					.basic-grey label>span {
					float: left;
					width: 20%;
					text-align: right;
					padding-right: 10px;
					margin-top: 10px;
					color: #888;
					}
					.basic-grey input[type="text"], .basic-grey input[type="email"], .basic-grey textarea {
					border: 1px solid #DADADA;
					color: #888;
					height: 30px;
					margin-bottom: 16px;
					margin-right: 6px;
					margin-top: 2px;
					outline: 0 none;
					padding: 3px 3px 3px 5px;
					width: 40%;
					font-size: 12px;
					line-height:15px;
					 box-shadow: inset 0px 1px 4px #ECECEC;
					 -moz-box-shadow: inset 0px 1px 4px #ECECEC;
					 -webkit-box-shadow: inset 0px 1px 4px #ECECEC;
					}
					.basic-grey select {
					border: 1px solid #DADADA;
					color: #888;
					height: 30px;
					margin-bottom: 16px;
					margin-right: 6px;
					margin-top: 2px;
					outline: 0 none;
					padding: 3px 3px 3px 5px;
					width: 10%;
					font-size: 12px;
					line-height:15px;
					 box-shadow: inset 0px 1px 4px #ECECEC;
					 -moz-box-shadow: inset 0px 1px 4px #ECECEC;
					 -webkit-box-shadow: inset 0px 1px 4px #ECECEC;
					}
					.basic-grey textarea{
					padding: 5px 3px 3px 5px;
					}
					.basic-grey select {
					background: #FFF url('down-arrow.png') no-repeat right;
					background: #FFF url('down-arrow.png') no-repeat right);
					 appearance:none;
					 -webkit-appearance:none;
					 -moz-appearance: none;
					text-indent: 0.01px;
					 text-overflow: '';
					width: 10%;
					height: 35px;
					line-height: 25px;
					}
					.basic-grey textarea{
					height:100px;
					}
					.basic-grey .button {
					background: #E27575;
					border: none;
					padding: 10px 25px 10px 25px;
					color: #FFF;
					 box-shadow: 1px 1px 5px #B6B6B6;
					 border-radius: 3px;
					text-shadow: 1px 1px 1px #9E3F3F;
					cursor: pointer;
					}
					.basic-grey .button:hover {
					background: #CF7A7A
					}
                </style>
                
        		<h1>新建静态路由表</h1>
        		<hr />
            	<h2>本页设置静态路由。</h2>
                
                <form class="basic-grey">
             		<p>目的网络地址： <input type="text" id="mac"/></p>
                    <p>Ip &nbsp;&nbsp;&nbsp; 地址： <input type="text" id="ip"/></p>
					<p>状态设置： <select id="select"><option value="on">生效</option><option value="off">失效</option></select></p>
                    <input type="button" class="button"  id='but1' value="确认" />
                    <input type="button" class="button" value="返回" />
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
	$("#but1").click(function(){
		alert(""+$("#ip").val()+","+$("#select").val());
	});
</script>


</body>
</html>