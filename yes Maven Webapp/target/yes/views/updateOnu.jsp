<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateOnu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="<%=basePath%>tableShow/updateOnu.do" onsubmit="return verify();" method="post"  id="form">
		onu_id：<input type="text" name="onu_id" value="${onu.onu_id }" readonly="readonly"/><br/>
		onu_type：<input type="text" name="onu_type" value="${onu.onu_type }"/><br/>
		olt_id：<input type="text" name="olt_id" value="${onu.olt_id }"/><br/>
		vir_id：<input type="text" name="vir_id" value="${onu.vir_id }"/><br/>
		mac_addr：<input type="text" name="mac_addr" value="${onu.mac_addr }"/><br/>
		vlan_id：<input type="text" name="vlan_id" value="${onu.vlan_id }"/><br/>
		vir_id：<input type="text" name="vir_id" value="${onu.vir_id }"/><br/>
		onu_state：<input type="text" name="onu_state" value="${onu.onu_state }"/><br/>
		onu_bandwith：<input type="text" name="onu_bandwith" value="${onu.onu_bandwith }"/><br/>
		<input type="submit" value="修改"/>
	</form>
  </body>
<!--  <script>
 $('form').submit(function(){
 $('input').each(function(i){
 	if(this.value==""){
 	 	alert("请填写完整参数");
 	}
 });
 	return false;
 });
 </script>  -->
 <script>
     function verify(){
        //获取form标签元素
        var form=document.getElementById('form');
        //获取form下元素下所有input标签
        var inputArray=form.getElementsByTagName("input");
        var inputArrayLength=inputArray.length;
        //循环input元素数组
        for(var int=0;int<inputArrayLength;int++){
            //判断每个input元素的值是否为空
            if( inputArray[int].value==null || inputArray[int].value==''){
                alert('第'+(int+1)+'个input的值为空.');
                return false;
            }
        }
        //如果所有Input标签的值都不为空的话
        return true;
    }
 </script>
</html>
