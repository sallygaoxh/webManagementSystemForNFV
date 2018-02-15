<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div>
         <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>Setting/autoSet.do" ><li class="TabbedPanelsTab2  TabbedPanelsTabSelected2" tabindex="0">引导型配置</li></a>
         <a href="<%=basePath%>Setting/manualSet.do" ><li class="TabbedPanelsTab2" tabindex="0">手动配置接口</li></a>
        </ul>
		<div class="TabbedPanelsContentGroup2">
		<div class="TabbedPanelsContent2" >

	<div>
	<form action="<%=basePath%>Setting/set1.do" method="post">
		Interface Name:<input type="text" name="interName" required = "true" value="f0/1"><br/>
		Vlan Number:<input type="text" name="vlanNum" required = "true" value="2"><br/>
		Vlan Name:  <input type="text" name="vlanName" required = "true" value="vlanA"><br/>
		<input type="submit" value="确定" id ="submit"></input>	
	</form>
	</div>	
	</div>
	</div>
	</div>
