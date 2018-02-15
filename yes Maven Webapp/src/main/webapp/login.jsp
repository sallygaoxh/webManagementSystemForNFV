<%@ page language="java"   import="java.util.*"  pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <base href="<%=basePath%>">
    <title>Web manage system's starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path%>/css/login.css"
	rel="stylesheet" type="text/css">
	
	
</head>
  
<body>

<div class="login-form">
                <div class="head"><img  src="<%=path%>/img/mem2.jpg" alt="" /></div>
				
				<form name="form1" action="user/log.do" method="post">
					<li class="istit">  <h1 style= "display:inline ">多租户虚拟网管系统</h1> 
    								<h2 style= "display:inline ">v.1.1</h2>
					</li>
					<span>${username}</span>
					<li class="notit">
						<input type="text" class="text" value="USERNAME" name="uname" id="USERNAME" onfocus="this.value = '';" required = "true">
						<a href="#" class=" icon user" ></a>
					</li>
					<li class="notit">
						<input type="password" value="Password" name="password" id="Password" onfocus="this.value = '';" required = "true" >
						<a href="#" class=" icon lock"></a>
					</li>
					<div class="radio-container">
					<input type="radio" checked="checked" name="rank" value="user" />用户 
					<input type="radio" name="rank" value="admin" />虚拟运营商
					<input type="radio" name="rank" value="hiadmin" />基础运营商
					</div>
					<div class="p-container">
								<!-- <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Remember Me</label> -->
								<input type="submit" value=登录>
							<div class="clear"> </div>
					</div>
				</form>
</div>

</body>
</html>
