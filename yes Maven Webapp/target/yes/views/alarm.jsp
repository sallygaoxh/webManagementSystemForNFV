<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>TWaver HTML5 Demo - Alarm</title>
    <script type="text/javascript" src="<%=path%>/static/js/twaver.js"></script>
    <script type="text/javascript">
        var box, network, nameFinder;
        function init(){
            network = new twaver.network.Network();
            box = network.getElementBox();
            nameFinder = new twaver.QuickFinder(box, "name");
            
            var networkDom = network.getView();
            networkDom.style.width = "100%";
            networkDom.style.height = "100%";
            document.body.appendChild(networkDom);
            
            if (!window.WebSocket && window.MozWebSocket)
                window.WebSocket=window.MozWebSocket;
            if (!window.WebSocket){
                alert("WebSocket not supported by this browser");
                return;
            }
            var websocket = new WebSocket("ws://127.0.0.1:8080/yes/alarmServer");
            websocket.onopen = onopen;
            websocket.onclose = onclose;
            websocket.onmessage = onmessage;
            
            network.addInteractionListener(function(evt){
                console.log("interaction event - " + evt.kind);
                var moveEnd = "MoveEnd";
                if(evt.kind.substr(-moveEnd.length) == moveEnd){
                    var nodes = [];
                    var selection = box.getSelectionModel().getSelection();
                    selection.forEach(function(element){
                        if(element instanceof twaver.Node){
                            var xy = element.getCenterLocation();
                            nodes.push({name: element.getName(), x: xy.x, y: xy.y});
                        }
                    });
                    websocket.send(jsonToString({action: "node.move", data: nodes}));
                }
            });
        }
        function alertInfo(text){
            var textNode = new twaver.Node();
            textNode.setImage(null);
            textNode.setSize(0, 0);
            textNode.setName(text);
            textNode.setCenterLocation(parseFloat(network.getView().clientWidth)/2, parseFloat(network.getView().clientHeight)/2);
            box.add(textNode);
        }
        function onopen(evt){
            box.clear();
            alertInfo("Loading...");
        }
        function onclose(evt){
            box.clear();
            alertInfo("Server Closed");
        }
        function onmessage(evt){
            var data = evt.data;
            if(!data){
                return;
            }
            data = stringToJson(data);
            if(!data){
                return;
            }
            var action = data.action;
            if(!action){
                return;
            }
            if(action == "alarm.clear"){
                box.getAlarmBox().clear();
                return;
            }
            data = data.data;
            if(!data){
                return;
            }
            if(action == "reload"){
                reloadDatas(data);
                return;
            }
            if(action == "alarm.add"){
                newAlarm(data)
                return;
            }
            if(action == "node.move"){
                modeMove(data);
                return;
            }
        }
        
        function reloadDatas(datas){
            box.clear();
            var nodes = datas.nodes;
            var links = datas.links;
            var alarms = datas.alarms;
            
            for(var i=0,l=nodes.length; i < l; i++){
                var data = nodes[i];
                var node = new twaver.Node();
                node.setName(data.name);
                node.setCenterLocation(parseFloat(data.x), parseFloat(data.y));
                box.add(node);
            }
            
            for(var i=0,l=links.length; i < l; i++){
                var data = links[i];
                var from = findFirst(data.from);
                var to = findFirst(data.to);
                var link = new twaver.Link(from, to);
                link.setName(data.name);
                link.setStyle("link.width", parseInt(data.width));
                box.add(link);
            }
            
            var alarmBox = box.getAlarmBox();
            for(var i=0,l=alarms.length; i < l; i++){
                newAlarm(alarms[i]);
            }
        }
        function findFirst(name){
            return nameFinder.findFirst(name);
        }
        function newAlarm(data){
            var element = findFirst(data.elementName);
            var alarmSeverity = twaver.AlarmSeverity.getByName(data.alarmSeverity);
            if(!element || !alarmSeverity){
                return;
            }
            addAlarm(element.getId(), alarmSeverity, box.getAlarmBox());
        }
        function addAlarm(elementID,alarmSeverity,alarmBox){
            var alarm = new twaver.Alarm(null, elementID,alarmSeverity);
            alarmBox.add(alarm);
        }
        
        function modeMove(datas){
            for(var i=0,l=datas.length; i<l; i++){
                var data = datas[i];
                var node = findFirst(data.name);
                if(node){
                    var x = parseFloat(data.x);
                    var y = parseFloat(data.y);
                    node.setCenterLocation(x, y);
                }
            }
        }
        
        function jsonToString(json){
            return JSON.stringify(json);
        }
        function stringToJson(str){
            try{
//                return eval("(" + str + ")");
                str = str.replace(/\'/g, "\"");
                return JSON.parse(str);
            }catch(error){
                console.log(error);
            }
        }
    </script>
</head>
<body onload="init()" style="margin:0;"></body>
</html>
