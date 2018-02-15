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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
<title>网管系统</title>
<script src="<%=path%>/static/js/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="<%=path%>/static/css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/static/css/SpryTabbedPanels2.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/htmleaf-demo.css">
<script src="<%=path%>/static/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/static/js/twaver.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.freezeheader.js"></script>
<style type="text/css">
		#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1rPbF5ljtS4XwQj9FY43dDFW"></script>
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
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="0">网络配置</li>
    <li class="TabbedPanelsTab" tabindex="0">网络查询</li>
    <li class="TabbedPanelsTab" tabindex="0">设备管理</li>

  </ul>

  
  <div class="TabbedPanelsContentGroup">

    <div class="TabbedPanelsContent">
	<jsp:include page="mapinclude.jsp" flush="true" />
    </div>
    
    <div class="TabbedPanelsContent">内容 3
    <div>
         <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>Setting/autoSet.do" ><li class="TabbedPanelsTab2  TabbedPanelsTabSelected2" tabindex="0">引导型配置</li></a>
         <a href="<%=basePath%>Setting/manualSet.do" ><li class="TabbedPanelsTab2" tabindex="0">手动配置接口</li></a>
        </ul>
		<div class="TabbedPanelsContentGroup2">
		<div class="TabbedPanelsContent2" >
	<section class="htmleaf-container">
		<div class="container">
			<ul class="payment-wizard">
		    	<li class="active">
		        	<div class="wizard-heading">
		            	1. Login Information
		                <span class="icon-user"></span>
		            </div>
		            <div class="wizard-content">
		            	<p>Create your Login Form here as per your requirement.</p>
		            	<button class="btn-green done" type="submit">Continue</button>
		            </div>
		        </li>
		        <li>
		        	<div class="wizard-heading">
		            	2. Delivery Address
		                <span class="icon-location"></span>
		            </div>
		            <div class="wizard-content">
			            <p>User address details section.</p>
		            	<button class="btn-green done" type="submit">Continue</button>
		            </div>
		        </li>
		        <li>
		        	<div class="wizard-heading">
		            	3. Order Summary
		                <span class="icon-summary"></span>
		            </div>
		            <div class="wizard-content">
		            	<p>Order summary details section.</p>
		            	<button class="btn-green done" type="submit">Continue</button>
		            </div>
		        </li>
		        <li>
		        	<div class="wizard-heading">
		            	4. Payment Method
		                <span class="icon-mode"></span>
		            </div>
		            <div class="wizard-content">
		            	<p>Your payment methods detail section.</p>
		            	<button class="btn-green" type="submit">Done</button>
		            </div>
		        </li>
		    </ul>    
		</div>
	</section>

	</div>
	</div>
	</div>
	</div>

  </div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
var TabbedPanels2 = new Spry.Widget.TabbedPanels("TabbedPanels2");
var TabbedPanels3 = new Spry.Widget.TabbedPanels("TabbedPanels3");
</script>

<script type="text/javascript">
	$(".TabbedPanelsTab").eq(1).trigger("click");
</script>

	<script>window.jQuery || document.write('<script src="<%=path%>/static/js/jquery-1.11.2.min.js" type="text/javascript" ><\/script>')</script>
	<script type="text/javascript">
	$(window).load(function(){	
		$(".done").click(function(){
			var this_li_ind = $(this).parent().parent("li").index();
			if($('.payment-wizard li').hasClass("jump-here")){
				$(this).parent().parent("li").removeClass("active").addClass("completed");
				$(this).parent(".wizard-content").slideUp();
				$('.payment-wizard li.jump-here').removeClass("jump-here");
			}else{
				$(this).parent().parent("li").removeClass("active").addClass("completed");
				$(this).parent(".wizard-content").slideUp();
				$(this).parent().parent("li").next("li:not('.completed')").addClass('active').children('.wizard-content').slideDown();
			}
		});
		
		$('.payment-wizard li .wizard-heading').click(function(){
			if($(this).parent().hasClass('completed')){
				var this_li_ind = $(this).parent("li").index();		
				var li_ind = $('.payment-wizard li.active').index();
				if(this_li_ind < li_ind){
					$('.payment-wizard li.active').addClass("jump-here");
				}
				$(this).parent().addClass('active').removeClass('completed');
				$(this).siblings('.wizard-content').slideDown();
			}
		});
	})
	</script>


</body>
</html>