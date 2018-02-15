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
         <a href="<%=basePath%>views/route.jsp" ><li class="TabbedPanelsTab2" tabindex="0">静态路由状态</li></a>
         <a href="<%=basePath%>views/routeNew.jsp" ><li class="TabbedPanelsTab2 " tabindex="0">新建静态路由</li></a>
         <a href="<%=basePath%>Database/getAllAdmin.do" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">新建vlan</li></a>
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
            
            <h1>VLAN绑定</h1>
            <hr />
            <h2>说明：VLAN绑定允许用户设置基于VLAN绑定，根据业务需要进行VLAN绑定的增加或删除。</h2>
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
					
					<!--按钮样式表-->
					.button {
						background: #E27575;
						border: none;
						padding: 10px 25px 10px 25px;
						color: #FFF;
						box-shadow: 1px 1px 5px #B6B6B6;
						border-radius: 3px;
						text-shadow: 1px 1px 1px #9E3F3F;
						cursor: pointer;
					}
					.button:hover {
						background: #CF7A7A
					}
                </style>
            <form >
            
            
            <table class="zebra" >
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
           <!--  <tr>
            	<td>用户</td>
            	<td>用户VLAN</td>
            	<td>WAN侧VLAN</td>
            	<td><input name='checkboxvlan[]' type='checkbox' value='{$id}'></td>
            </tr> -->
            
           
         <!--    <script>
			var i =1;
			while(i < 6/*连接数据库并调用，以下均为示例。*/){
				document.write("<tr>");
					document.write("<td>用户"+i+"</td>");
					document.write("<td>用户VLAN</td>");
					document.write("<td>WAN侧VLAN"+i+"</td>");
					document.write("<td><input name='checkboxvlan[]' type='checkbox' value='{$id}'></td>");
				document.write("</tr>");
				i++;
			}
			</script> -->
            </table> 
            <br />
            <input type="submit" class="button" value="删除选中项" />
            </form>
            <br />
            <hr />
            <br />
            <form class="basic-grey">
            <table class="zebra">
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
            <!-- <tr>
            	<td><select>  
  					<option value ="1">设备1</option>  
  					<option value ="2">设备2</option>  
 					 <option value="3">设备3</option>  
  					<option value="4">设备4</option>  
				</select>  </td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/1'>端口1</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/2'>端口2</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/3'>端口3</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/4'>端口4</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/5'>端口5</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/6'>端口6</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/7'>端口7</label></td>
                <td><label><input name='checkboxssport[]' type='checkbox' value='G0/8'>端口8</label></td>
            </tr> -->
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
            <input type="button" class="button" id="but1" value="确认" />
            <br />
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
		else
		vlanChecked = $("input[name='radiovlan']:checked").val();
		alert("checked vlan " + vlanChecked);
		//alert(checkedValue[0]);
		$.post("<%=basePath%>Database/ConfigPort.do",{vlanChecked:vlanChecked,checkedValue1:checkedValue1,checkedValue2:checkedValue2},function(data){
				alert(data);
				});
	});
	<%-- $("#but03").click(function(){
			var onuId1 = $("#onuId1").val();
			$.post("<%=basePath%>admin/deleteById.do",{Id:onuId1},function(data){
				alert(data);
				});
			}); --%>	
	
</script>


</body>
</html>