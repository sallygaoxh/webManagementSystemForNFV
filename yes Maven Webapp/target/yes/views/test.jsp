<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=path%>/static/js/ajaxrequest.js">  </script>
	<script src="<%=path%>/static/js/jquery-1.8.2.min.js">  </script>
	<script type="text/javascript" src="<%=path%>/static/js/twaver.js"></script>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body onLoad="init()">
    <div>
    <section><input type="button" id="but01" value="查询所有"/></section>
    
    <section>virId:<input type="text" name="virId1" id="virId1"/></section>
    <section><input type="button" id="but02" value="查询vir"/></section>
    
    <section>onuId:<input type="text" name="onuId1" id="onuId1"/></section>
    <section><input type="button" id="but03" value="删除byId"/></section>
    <!--  
    <section>onuName:<input type="text" name="onuName1" id="onuName1"/></section>
    <section><input type="button" id="but04" value="删除byName"/></section>
    -->
    
    <!--  
    <section>onuName:<input type="text" name="onuName" id="onuName"/></section>
    <section>oltId:<input type="text" name="oltId" id="oltId"/></section>
    <section>virId:<input type="text" name="virId" id="virId"/></section>
    <section><input type="button" id="but05" value="增加"/></section>
 	</div>
 	<div id="content"></div>x
  </body>
  	-->
  
  
  
  
  <script type="text/javascript">
  		var tp;
  		 $("#but01").click(function(){
			$.post("<%=basePath%>admin/showall.do",{userId:"111"},function(mm){
		
				tp=mm;
				//alert(tp.length);
				//alert(tp[0].length);
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
        view.style.left = '300px';
        view.style.top = '0px';
        view.style.right = '0px';
        view.style.bottom = '0px';
        document.body.appendChild(view);
        window.onresize = function () {
            split.invalidate();
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
           var split = new twaver.Node({name: 'spilt'});split.setImage('spilt');box.add(split);
           var link = new twaver.Link(group, split);box.add(link);
           
           for (var j = 0; j < tp.length; j++) {
               var node = new twaver.Node({name: ''+tp[j].onu_id+'  '+tp[j].onu_type});
               node.setImage('onu');
               group.addChild(node);
               box.add(node);
               var link = new twaver.Link(split, node);
               group.addChild(link);
               box.add(link);
           }
       }
        autoLayouter.doLayout('topbottom');
        
    }
    
      function loadAll(){
        box.clear();
       
       for (var i = 0, n = tp.length; i < n; i++) {
           var group = new twaver.Node({name:''+tp[i][0].olt_id});group.setImage('olt');box.add(group);
           var split = new twaver.Node({name: 'spilt'});split.setImage('spilt');box.add(split);
           var link = new twaver.Link(group, split);box.add(link);
           
           for (var j = 0; j < tp[i].length; j++) {
               var node = new twaver.Node({name: ''+tp[i][j].onu_id+'  '+tp[i][j].onu_type});
               node.setImage('onu');
               group.addChild(node);
               box.add(node);
               var link = new twaver.Link(split, node);
               group.addChild(link);
               box.add(link);
           }
       }
        autoLayouter.doLayout('topbottom');
        
    }
    
    
    
    </script>
    
</html>
