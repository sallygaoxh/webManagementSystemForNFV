<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Network Manager</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/main-normalize.css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/main-default.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/main-default1.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/main-style.css">
	<link rel="stylesheet" href="<%=path%>/static/css/main-style1.css">
	<script src="<%=path%>/static/js/modernizr.js">  </script>
	<script src="<%=path%>/static/js/js1.js">  </script>
	<link rel="stylesheet" href="<%=path%>/static/css/base.css" type="text/css">
	 <script type="text/javascript" src="<%=path%>/static/js/twaver.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/twaver_ext.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/demo.js"></script>
	
    <script>
			window.jQuery || document.write('<script src="<%=path%>/static/js/jquery-2.1.1.min.js"><\/script>')
	</script>
    <script src="<%=path%>/static/js/bootstrap.min.js">  </script>
    <script src="<%=path%>/static/js/jquery.bootstrap-dropdown-hover.js">  </script>
    <!--  <script src="<%=path%>/static/js/jquery-1.8.2.min.js">  </script>-->
    <script src="<%=path%>/static/js/ajaxrequest.js">  </script>
    </head>
   
<body onload="init()" style="margin:0;">
	<%@ include file="header.jsp"%>
	<%@ include file="tabMenu.jsp"%>	
	<%@ include file="topBar.jsp"%>


	<!-- tab-content -->	
	<div class="tab-content">
		<jsp:include page="main.jsp" flush="true" />
		<jsp:include page="resource.jsp" flush="true" />
		<jsp:include page="user.jsp" flush="true" />
		<jsp:include page="netquery.jsp" flush="true" />
		<jsp:include page="server.jsp" flush="true" />
		<jsp:include page="map.jsp" flush="true" />
		<jsp:include page="TabAnay.jsp" flush="true" />
		<jsp:include page="config.jsp" flush="true" />
	</div>

	
	 <script type="text/javascript">
    
     $("#test").click(function(){
			$.post("<%=basePath%>admin/test.do",{userId:"111"},function(tp){
				alert("sd");
				alert(tp);
		
			});
		});
    

    
   /*  $("#test1").click(
    		function (){
    		    	alert(""+$("#profileId").val());
    				$.ajax({   	 	
    		        data:"profileId="+$("#profileId").val(),     
    		        type:"post",  
    		        url:"admin/send.do",
    		        dataType: "text",           
    		        success:function(){   
    		            $("#add")[0].innerHTML="<input type='text' id='profileId2'/><input type='submit' value='Finish'>";
    		        },  
    			    error:function(msg){  
    			    	alert("出错了！！:"+msg); 
    			    	$("#add")[0].innerHTML="<input type='text' id='profileId2'/><input type='submit' value='Finish'>"; 
    		        } 
    		    });
    		});	 */
    
    
    $("#try").click(function(){
    	alert(""+$("#message").val());
    	
		$.ajax({   	 	
        data:"message="+$("#message").val(),     
        type:"post",  
        url:"admin/send.do",
        dataType: "text",           
        success:function(msg){  
            alert("success:"+msg);  
            $("#add")[0].innerHTML=msg;
            //var ajaxobj=new AJAXRequest;    // 创建AJAX对象,类在刚刚那个文件里了
			//ajaxobj.method="GET";   // 设置请求方式为GET
			//ajaxobj.url="abc.html" ;
			//alert("after url");
			//ajaxobj.callback=function(xmlobj) {
    		//alert("enter callback");
    		//document.getElementById("abc").innerHTML = xmlobj.responseText;     //可要看好这句话哦
			//}
			//ajaxobj.send();    // 发送请求 // 响应的URL,以后可以改为一些动态处理页,会用Ajax的都知道，这在页里可以有目的返回不同的数据
			// 设置回调函数，输出响应内容,因为是静态页（这是我的需求嘛）所以所有内容都过来了  
        },  
	    error:function(msg){  
            alert("出错了！！:"+msg);  
        } 
    });
   });

    $("#setting").click(function setUp (){ 
		profile = prompt("Please input the number of the profile:","20");
		if (profile != null&& profile>0 && profile<100){
		alert("You have chose profile" + profile );
		
	
		}else{
		alert("You have an wrong input. The default value will be used");
		profile = 10;
		}
		
		$.post("<%=basePath%>admin/test1.do",{age1:profile},function(data){
			alert(data);
					
			});
    });
		

	</script>


	<!--  <script type="text/javascript">
	var ajaxobj=new AJAXRequest;    // 创建AJAX对象,类在刚刚那个文件里了
		ajaxobj.method="GET";   // 设置请求方式为GET
		ajaxobj.url="templat/main.html"  // 响应的URL,以后可以改为一些动态处理页,会用Ajax的都知道，这在页里可以有目的返回不同的数据
	// 设置回调函数，输出响应内容,因为是静态页（这是我的需求嘛）所以所有内容都过来了
		ajaxobj.callback=function(xmlobj) {
    	document.getElementById('des).innerHTML = xmlobj.responseText;     //可要看好这句话哦
	}
	ajaxobj.send();    // 发送请求
	</script>-->
	 
	  <script type="text/javascript">
  		var tp;
  		 $("#but01").click(function(){
			$.post("<%=basePath%>admin/showall.do",{userId:"111"},function(mm){
		
				tp=mm;
				alert(tp.length);
				alert(tp[0].length);
				loadAll();
				
				}, "json");
			});
		
		$("#but02").click(function(){
			alert("1");
			var virId = $("#virId1").val();
			$.post("<%=basePath%>admin/showvir.do",{virId:virId},function(mm){
				alert(mm.length);
				tp=mm;
				alert(tp.length);
				loadVirOnus(tp);
				
				}, "json");
			});	
			
		$("#but03").click(function(){
			var onuId1 = $("#onuId1").val();
			$.post("<%=basePath%>admin/deleteById.do",{Id:onuId1},function(data){
				alert(data);
				});
			});	
		
		//$("#but04").click(function(){
			//var onuName1 = $("#onuName1").val();
			//$.post("<%=basePath%>admin/deleteByName.do",{name:onuName1},function(data){
			//	alert(data);u
			//	});
		//	});	
		
		//$("#but05").click(function(){
		  // var onuName = $("#onuName").val();
		  // var oltId = $("#oltId").val();
		 //  var virId = $("#virId").val();
		//   $.post("<%=basePath%>admin/insertONU.do",{onuName:onuName,oltId:oltId,virId:virId},function(data){
				//alert(data);
		//		});
			//});	
			
		 var box = new twaver.ElementBox();
         var network = new twaver.vector.Network(box);
         var autoLayouter = new twaver.layout.AutoLayouter(box);
        
    	 function init() {
            registerImage();
            initNetwork();
         }
    
    	function initNetwork(){
        var pane = new twaver.controls.BorderPane(network);
        pane.setTopHeight(25);
        var view = pane.getView();
        view.style.left = '200px';
        view.style.top = '0px';
        view.style.right = '0px';
        view.style.bottom = '0px';
        document.getElementById("map").appendChild(view);
        window.onresize = function () {
            spilt.invalidate();
        };
   		}
   		
    function registerImage() {
        registerNormalImage('<%=path%>/static/img/onu.png','onu');
        registerNormalImage('<%=path%>/static/img/olt.png','olt');
        registerNormalImage('<%=path%>/static/img/spilt.png','spilt');
    }

    function registerNormalImage(url, name) {
        var image = new Image();
            image.src = url;
            image.onload = function() {
            twaver.Util.registerImage(name, image, 32, 32);
            image.onload = null;
            network.invalidateElementUIs();
        }; }
    
    function doLayout (overview,type) {
        if (overview) {
            autoLayouter.doLayout(type, function () {
            network.zoomOverview(false);
                                  });
        } else {
            autoLayouter.doLayout(type);
        }
    }
    
    function loadVirOnus(){
        box.clear();
       
       for (var i = 0, n = 1; i < n; i++) {
           var group = new twaver.Node({name: ''+tp[0].olt_id});group.setImage('olt');box.add(group);
           var spilt = new twaver.Node({name: 'spilt'});spilt.setImage('spilt');box.add(spilt);
           var link = new twaver.Link(group, spilt);box.add(link);
           
           for (var j = 0; j < tp.length; j++) {
               var node = new twaver.Node({name: ''+tp[j].onu_id+'  '+tp[j].onu_type});
               node.setImage('onu');
               group.addChild(node);
               box.add(node);
               var link = new twaver.Link(spilt, node);
               group.addChild(link);
               box.add(link);
           }
       }
        autoLayouter.doLayout('topbottom');
        
    }
    
      function loadAll(){
        box.clear();
       
       for (var i = 0, n = tp.length; i < n; i++) {
           //alert("111????");
           var group = new twaver.Node({name:''+tp[i][0].olt_id});group.setImage('olt');box.add(group);
           var spilt = new twaver.Node({name: 'spilt'});spilt.setImage('spilt');box.add(spilt);
           var link = new twaver.Link(group, spilt);box.add(link);
           
           for (var j = 0; j < tp[i].length; j++) {
               var node = new twaver.Node({name: ''+tp[i][j].onu_id+'  '+tp[i][j].onu_type});
               node.setImage('onu');
               group.addChild(node);
               box.add(node);
               var link = new twaver.Link(spilt, node);
               group.addChild(link);
               box.add(link);
           }
       }
        autoLayouter.doLayout('topbottom');
        
    }
    
    
    
    </script>
	
	
</body>
  

<%-- <script type="text/javascript" src="<%=path%>/static/js/alarm.js"></script>  --%>
</html>
