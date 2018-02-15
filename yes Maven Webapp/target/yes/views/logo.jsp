<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<span class="logo">
	<img src = "<%=path%>/static/img/2.png" width="200" height="55" />
</span>
<span class="name">
	欢迎${rank}管理员： ${username} 
</span>
<script language="JavaScript"> 
	function getMyName(){ 
		var myName="<%=session.getAttribute("username")%>";
		printf(myName);
		return myName;
	}	
</script>