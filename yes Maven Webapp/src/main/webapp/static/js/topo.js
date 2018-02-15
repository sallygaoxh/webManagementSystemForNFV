/*var ports="<%=session.getAttribute("ports")%>";
var vlans="<%=session.getAttribute("vlans")%>";
alert(vlans);
alert(ports);*/
var box = new twaver.ElementBox();
var network = new twaver.vector.Network(box);
/*$("#but01").click(function(){
	$.post("<%=basePath%>admin/showall.do",{userId:"111"},function(mm){

		tp=mm;
		alert(tp.length);
		alert(tp[0].length);
		loadAll();
		
		}, "json");
	});*/
function init() {
    registerImage();
    initNetwork();
    initDataBox();
}

function registerImage() {
    registerNormalImage('../static/img/router.png','router');
    registerNormalImage('../static/img/switch1.png','switch1');
}

function registerNormalImage(url, name) {
    var image = new Image();
    image.src = url;
    image.onload = function() {
        twaver.Util.registerImage(name, image, 32, 32);
        image.onload = null;
        network.invalidateElementUIs();
    }; }

function initNetwork() {
    var view = network.getView();
    document.getElementById('topo').appendChild(view);
    network.adjustBounds({x: 0, y: 0, width: 1300, height: 600});
    
    network.getToolTip = function (element) {
        
        if(element instanceof twaver.Node){
            var name = element.getName();
            var name2 = element.getName2();
            var clientProperty = element.getClient('vlan');
            return 'name:' + name + '<br>' + 'brand:' + name2 +'<br>'
            + 'vlan:' + element.getClient('vlan');
        }
        else if(element instanceof twaver.Link){
            var name = element.getName();
            var client = element.getClient('clientProperty');
            return 'name:' + name + '<br>' + 'client:' + client;
        }
        
    }
    twaver.Styles.setStyle('label.color','#ec6c00');
    twaver.Styles.setStyle('label2.color','#57ab9a');
    twaver.Styles.setStyle('select.color','#ef8200');
}

function initDataBox() {
    var switch1 = new twaver.Node({
                                  name: 'switch1',
                                  name2: 'Cisco',
                                  location: {
                                  x: 300,
                                  y: 300
                                  }
                                  });
    switch1.setImage('switch1');
    box.add(switch1);
    
    var switch2 = new twaver.Node({
                                  name: 'switch2',
                                  name2: 'Cisco',
                                  location: {
                                  x: 700,
                                  y: 300
                                  }
                                  });
    switch2.setImage('switch1');
    box.add(switch2);
    
    var router1 = new twaver.Node({
                                  name: 'router1',
                                  name2: 'Huawei',
                                  location: {
                                  x: 300,
                                  y: 100
                                  }
                                  });
    box.add(router1);
    router1.setImage('router');
    
    var router2 = new twaver.Node({
                                  name: 'router2',
                                  name2: 'Huawei',
                                  location: {
                                  x: 700,
                                  y: 100
                                  }
                                  });
    box.add(router2);
    router2.setImage('router');
    
    var port1 = [];
    var link1 = [];
    var count = 0;
    for (var i=0;i<objPorts.length;i++){
    	for(var j=0; j<objPorts[i].length;j++){
    		//alert(objPorts[i].length);
    		if (objPorts[i][j].switype== 0){
    			port1[count] = new twaver.Node({
    	                                   name: objPorts[i][j].inter,
    	                                   location:{
    	                                   x: (160 + 40*count),
    	                                   y: 500
    	                                   }
    	                                   });
    	        box.add(port1[count]);
    	        port1[count].setClient('vlan', 'vlan'+objPorts[i][j].vlans);
    	        link1[count] = new twaver.Link(switch1,port1[count]);
    	        box.add(link1[count]);
    	        count++;
    		}
    	    	   		
    	}
        
    }
    
    var port2 = [];
    var link2 = [];
    var count = 0;
    for (var i=0;i<objPorts.length;i++){
    	for(var j=0; j<objPorts[i].length;j++){
    		//alert(objPorts[i].length);
    		if (objPorts[i][j].switype== 1){
		        port2[count] = new twaver.Node({
		                                   name: objPorts[i][j].inter,
		                                   location:{
		                                   x: (560 + 40*count),
		                                   y: 500
		                                   }
		                                   });
		        box.add(port2[count]);
		        port2[count].setClient('vlan','vlan'+objPorts[i][j].vlans);
		        link2[count] = new twaver.Link(switch2,port2[count]);
		        box.add(link2[count]);
		        count++;
    		}
    	}
    }
    
    for (var i=0;i<port1.length;i++){
        link1[i].setStyle("link.color",setColor(port1[i]));
    }
    for (var i=0;i<port2.length;i++){
    	link2[i].setStyle("link.color",setColor(port2[i]));
    }
    
    var link1 = new twaver.Link(router1, switch1);
    link1.setClient('clientProperty',switch1);
    box.add(link1);
    
    var link2 = new twaver.Link(router2, switch2);
    link2.setClient('clientProperty',switch2);
    box.add(link2);
    
    var link = new twaver.Link(router2, router1);
    link.setStyle("link.width", 5);
    link.setStyle("link.color", '#CD3333');
    
    box.add(link);
}

function setColor(element){
    if(element instanceof twaver.Node){
        if(element.getClient('vlan')=='vlan1'){
            return '#BFBFBF';
        }else if(element.getClient('vlan')=='vlan2'){
            return '#66ff99';
        }else if(element.getClient('vlan')=='vlan3'){
            return '#AB82FF';
        }else{
            return '#ff3399';
        }
    }
}