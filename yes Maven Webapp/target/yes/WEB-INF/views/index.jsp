<%@ page language="java"   import="java.util.*"  pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登陆注册</title>
<style type="text/css">
.ys{color: red;}
.ys1{color:blue;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function show(){
		$("#yc").css("display","block");
		if($("#yc2").css("display","block")){
			$("#yc2").css("display","none");
		}
	}
	function show1(){
		$("#yc2").css("display","block");
		if($("#yc").css("display","block")){
			$("#yc").css("display","none");
		}
	}
	if($("#yc").css("display","block")){
		$(function(){
    	                var ok1=false;
    	                var ok2=false;
    	                var ok3=false;
    	                var ok4=false;
    	                var ok5=false;
    	                // 验证用户名
    	                $("#zh").focus(function(){
    	                    $(this).next().text('请输入内容。');
    	                }).blur(function(){
    	                    if($(this).val().length >= 3 && $(this).val().length <=12 && $(this).val()!=''){
    	                        $(this).next().text('正确！').addClass("ys1");
    	                        ok1=true;
    	                    }else{
    	                        $(this).next().text('用户名应该为3-12位之间').addClass("ys");
    	                    }
    	                    });
    	                $("#mm").focus(function(){
    	                    $(this).next().text('请输入内容。');
    	                }).blur(function(){
    	                    if($(this).val().length >= 3 && $(this).val().length <=8&& $(this).val()!=''){
    	                        $(this).next().text('正确！').addClass("ys1");
    	                        ok2=true;
    	                    }else{
    	                        $(this).next().text('密码应该为3-8位之间').addClass("ys");
    	                    }
    	                    });
    	                $("#rmm").focus(function(){
    	                    $(this).next().text('请输入内容。！');
    	                }).blur(function(){
    	                    if($(this).val()==$("#mm").val()&& $(this).val()!=''){
    	                        $(this).next().text('正确！').addClass("ys1");
    	                        ok3=true;
    	                    }else{
    	                        $(this).next().text('两次输入密码必须一致！').addClass("ys");
    	                    }
    	                    });
    	                $("#xm").focus(function(){
    	                    $(this).next().text('请输入内容。');
    	                }).blur(function(){
    	                    if($(this).val()!=''){
    	                        $(this).next().text('正确！').addClass("ys1");
    	                        ok4=true;
    	                    }else{
    	                        $(this).next().text('姓名不能为空！').addClass("ys");
    	                    }
    	                    });
    	                $("#sjh").focus(function(){
    	                    $(this).next().text('请输入内容。');
    	                }).blur(function(){
    	                    if($(this).val().length==11&& $(this).val()!=''){
    	                        $(this).next().text('正确！').addClass("ys1");
    	                        ok5=true;
    	                    }else{
    	                        $(this).next().text('长度必须是11位！').addClass("ys");
    	                    }
    	                    });
    	                $("#tj").click(function(){
    	                	if(ok1&&ok2&&ok3&&ok4&&ok5){
    	                		$('from').submit();
    	                	}else{
    	                		alert("请检查您填写的内容是否都正确！");
    	                		return false;
    	                	}
    	                	
    	                });
    	                
		 });
    	                }
	
</script>
</head>
<body>

<div>
<p><a href="#" onclick="show()" >登录</a> &nbsp;&nbsp;<a href="#" onclick="show1()">注册</a> </p>
<span>${jg}</span><span>${zjg}</span>
<div  id="yc">
<form action="user/log.do" method="post">
账号：<input type="text" name="uname"/><br/>
密码：<input type="password" name="password"/><br/>
<input  type="submit" value="登录" />
</form>
</div>
<div style="display: none" id="yc2">
<form action="user/reg.do"   method="post">
账号：&nbsp;&nbsp;<input id="zh" type="text" name="uname"/><span></span><br/>
密码：&nbsp;&nbsp;<input id="mm"	 type="password"  name="password"/><span></span><br/>
确认：&nbsp;&nbsp;<input id="rmm"	type="password"  /><span></span><br/>
姓名：&nbsp;&nbsp;<input id="xm"	type="text" name="name"/><span></span><br/>
手机号：<input id="sjh"	type="text" name="phone"><span></span><br/>
<input id="tj"  type="submit" value="注册" />
</form>
</div>
</div>

</body>
</html>