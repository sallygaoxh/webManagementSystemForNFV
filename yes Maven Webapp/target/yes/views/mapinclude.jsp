<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
<div>
        <ul class="TabbedPanelsTabGroup2">
         <a href="<%=basePath%>views/main2.jsp" ><li class="TabbedPanelsTab2 TabbedPanelsTabSelected2" tabindex="0">全网拓扑</li></a>
         <a href="<%=basePath%>tableShow/getTable.do"> <li class="TabbedPanelsTab2 " tabindex="0">表格显示</li></a>
         <a href="<%=basePath%>TuopuShow/getPage.do" ><li class="TabbedPanelsTab2" tabindex="0">逻辑拓扑</li></a>
         <a href="<%=basePath%>views/rate.jsp"> <li class="TabbedPanelsTab2" tabindex="0">端口速率</li></a> 
        </ul>
        
        <div class="TabbedPanelsContentGroup2">
			<div class="TabbedPanelsContent2">
			
          <div id="allmap"></div>
          <script type="text/javascript">
			// 百度地图API功能
			var map = new BMap.Map("allmap", {enableMapClick:false,minZoom:12,maxZoom:19});    // 创建Map实例
			document.getElementById("allmap").style.display='block';
			document.getElementById("allmap").style.poistion='absolute';
			map.centerAndZoom(new BMap.Point(116.404, 39.915), 15);  // 初始化地图,设置中心点坐标和地图级别
			//map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
			//map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
			map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
			//---------------地图设置---------------------------------------------------------------
			
			//--------------OLT的设置---------------------------------------------------------------
			//下面是信息窗格，主要写明点击交换机之后的弹窗内容
			var OLTINFO =
			"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>OLTINFO</h4>" + 
			"<img style='float:right;margin:4px' id='cisco' src='../static/img/cisco.jpg' width='120' height='120' title='cisco'/>" + 
			"<p style='margin:0;line-height:1.5;font-size:13px'>名字：思科<br>ID：44944<br>上行：10M/s<br>下行：100M/s</p>" + 
			"</div>";
			var OLTPOINT = new BMap.Point(116.404, 39.915);
			var OLTICON = new BMap.Icon("../static/img/router.png", new BMap.Size(50,50));
			var OLT = new BMap.Marker(OLTPOINT,{icon:OLTICON});
			var OLTinfoWindow = new BMap.InfoWindow(OLTINFO);  // 创建信息窗口对象
			
			
			//e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）OLT表示绑定的OLT
			//e（如果自己没有传参数的话表示表示覆盖物（有经纬度）  ee为undefined OLT表示绑定的OLT
			
			
			var removeMarker = function(e,ee,OLT){
				map.removeOverlay(OLT);
			}
			
			OLT.addEventListener("click", function(){          
			   this.openInfoWindow(OLTinfoWindow);
			   //图片加载完毕重绘infowindow
			   document.getElementById('cisco').onload = function (){
				   OLTinfoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			   }
			});	//左键click动作
			
			//创建右键菜单
			var OLTMENU = new BMap.ContextMenu();
			OLTMENU.addItem(new BMap.MenuItem('配置',removeMarker.bind(OLT)));
			OLTMENU.addItem(new BMap.MenuItem('删除',removeMarker.bind(OLT)));
			OLTMENU.addItem(new BMap.MenuItem('重启',removeMarker.bind(OLT)));
			OLTMENU.addItem(new BMap.MenuItem('关闭',removeMarker.bind(OLT)));
			
			OLT.addContextMenu(OLTMENU);
			map.addOverlay(OLT);
			OLT.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			//--------------OLT结束-----------------------------------------------------------------
			
			
			//--------------ONU的设置---------------------------------------------------------------
			//下面是信息窗格，主要写明点击交换机之后的弹窗内容
			var ONUINFO =
			"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>ONUINFO</h4>" + 
			"<img style='float:right;margin:4px' id='cisco' src='../static/img/cisco.jpg' width='120' height='120' title='cisco'/>" + 
			"<p style='margin:0;line-height:1.5;font-size:13px'>名字：思科<br>ID：44945<br>上行：10M/s<br>下行：100M/s</p>" + 
			"</div>";
			var ONUPOINT = new BMap.Point(116.404, 39.885);
			var ONUICON = new BMap.Icon("../static/img/switch1.png", new BMap.Size(50,50));
			var ONU = new BMap.Marker(ONUPOINT,{icon:ONUICON});
			var ONUinfoWindow = new BMap.InfoWindow(ONUINFO);  // 创建信息窗口对象
			
			
			//e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）ONU表示绑定的ONU
			//e（如果自己没有传参数的话表示表示覆盖物（有经纬度）  ee为undefined ONU表示绑定的ONU
			
			
			var removeMarker2 = function(e,ee,ONU){
				map.removeOverlay(ONU);
			}
			
			ONU.addEventListener("click", function(){          
			   this.openInfoWindow(ONUinfoWindow);
			   //图片加载完毕重绘infowindow
			   document.getElementById('cisco').onload = function (){
				   ONUinfoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			   }
			});	//左键click动作
			
			//创建右键菜单
			var ONUMENU = new BMap.ContextMenu();
			ONUMENU.addItem(new BMap.MenuItem('配置',removeMarker2.bind(ONU)));
			ONUMENU.addItem(new BMap.MenuItem('删除',removeMarker2.bind(ONU)));
			ONUMENU.addItem(new BMap.MenuItem('重启',removeMarker2.bind(ONU)));
			ONUMENU.addItem(new BMap.MenuItem('关闭',removeMarker2.bind(ONU)));
			
			ONU.addContextMenu(ONUMENU);
			map.addOverlay(ONU);
			ONU.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			//--------------ONU结束-----------------------------------------------------------------
			
			//--------------ONU2的设置---------------------------------------------------------------
			//下面是信息窗格，主要写明点击交换机之后的弹窗内容
			var ONUINFO2 =
			"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>ONUINFO</h4>" + 
			"<img style='float:right;margin:4px' id='cisco' src='../static/img/cisco.jpg' width='120' height='120' title='cisco'/>" + 
			"<p style='margin:0;line-height:1.5;font-size:13px'>名字：思科<br>ID：44947<br>上行：1M/s<br>下行：20M/s</p>" + 
			"</div>";
			var ONUPOINT2 = new BMap.Point(116.434, 39.885);
			var ONUICON2 = new BMap.Icon("../static/img/switch1.png", new BMap.Size(50,50));
			var ONU2 = new BMap.Marker(ONUPOINT2,{icon:ONUICON2});
			var ONUinfoWindow2 = new BMap.InfoWindow(ONUINFO2);  // 创建信息窗口对象
			
			
			//e（如果自己有传参数的话表示自己传过来的参数  ee表示覆盖物（有经纬度）ONU表示绑定的ONU
			//e（如果自己没有传参数的话表示表示覆盖物（有经纬度）  ee为undefined ONU表示绑定的ONU
			
			
			var removeMarker3 = function(e,ee,ONU){
				map.removeOverlay(ONU2);
			}
			
			ONU2.addEventListener("click", function(){          
			   this.openInfoWindow(ONUinfoWindow2);
			   //图片加载完毕重绘infowindow
			   document.getElementById('cisco').onload = function (){
				   ONUinfoWindow2.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			   }
			});	//左键click动作
			
			//创建右键菜单
			var ONUMENU2 = new BMap.ContextMenu();
			ONUMENU2.addItem(new BMap.MenuItem('配置',removeMarker3.bind(ONU2)));
			ONUMENU2.addItem(new BMap.MenuItem('删除',removeMarker3.bind(ONU2)));
			ONUMENU2.addItem(new BMap.MenuItem('重启',removeMarker3.bind(ONU2)));
			ONUMENU2.addItem(new BMap.MenuItem('关闭',removeMarker3.bind(ONU2)));
			
			ONU2.addContextMenu(ONUMENU2);
			map.addOverlay(ONU2);
			//ONU2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			//--------------ONU2结束-----------------------------------------------------------------
			
			//--------------添加连线效果-----------------------------------------------------------------
			var polyline1 = new BMap.Polyline([OLTPOINT, ONUPOINT], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
			var polyline2 = new BMap.Polyline([OLTPOINT, ONUPOINT2], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
			map.addOverlay(polyline1);
			map.addOverlay(polyline2);
		</script>
			</div>
        </div>
 </div>
 
