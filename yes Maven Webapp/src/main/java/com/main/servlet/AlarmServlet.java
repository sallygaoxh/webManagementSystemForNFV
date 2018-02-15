package com.main.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jetty.util.ajax.JSON;
import org.eclipse.jetty.websocket.WebSocket;

import com.main.model.ONU;
import com.main.service.ONUService;


public class AlarmServlet extends org.eclipse.jetty.websocket.WebSocketServlet {
	private final Set<AlarmWebSocket> clients;
	
	
	public AlarmServlet() {
		/*
		ONUService onu=new ONUService();
		List<ONU> all=onu.selectAll();
		List<ONU> olt=onu.selectOLT(1);
		List<ONU> vir=onu.selectVir(1);
		System.out.println("before");
		System.out.println(all);
		System.out.println("\n");
		System.out.println(olt);
		System.out.println("\n");
		System.out.println(vir);
		System.out.println("\n");
		System.out.println("after");
		*/
		
		
		
		initDatas();
		clients = new CopyOnWriteArraySet<AlarmWebSocket>();
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				if(random.nextInt(10) == 9){
					alarms.clear();
					sendMessage ("alarm.clear", "");
					return;
				}
				sendMessage("alarm.add", randomAlarm());
			}
		}, 0, 2000);
	}
	
	public WebSocket doWebSocketConnect(HttpServletRequest request, String protocol) {
		
		return new AlarmWebSocket();
	}
    
	public void sendMessage(String action, String message) {
		for(AlarmWebSocket client : clients){
			sendMessage(client, action, message);
		}
	}
	
	private void sendMessage(AlarmWebSocket client, String action, String message){
		try {
			if(message == null || message.isEmpty()){
				message = "\"\"";
			}
			if(action != null){
				message = "{\"action\":\"" + action + "\", \"data\":" + message + "}";
			}
			client.connection.sendMessage(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private Random random = new Random();
	private Data getRandomElement(){
		if(random.nextBoolean()){
			return nodes.get(random.nextInt(nodes.size()));
		}
		return links.get(random.nextInt(links.size()));
	}
	String[] alarmSeverities = new String[]{"Critical", "Major", "Minor", "Warning", "Indeterminate"};
	private String randomAlarm(){
		Alarm alarm = new Alarm(getRandomElement().name, alarmSeverities[random.nextInt(alarmSeverities.length)]);
		alarms.add(alarm);
		return alarm.toJSON();
	}
	
	Map<String, Data> elementMap = new HashMap<String, AlarmServlet.Data>();
	List<Node> nodes = new ArrayList<AlarmServlet.Node>();
	List<Link> links = new ArrayList<AlarmServlet.Link>();
	List<Alarm> alarms = new ArrayList<AlarmServlet.Alarm>();
	
	private String loadDatas(){
		StringBuffer result = new StringBuffer();
		result.append("{\"nodes\":");
		listToJSON(nodes, result);
		result.append(", \"links\":");
		listToJSON(links, result);
		result.append(", \"alarms\":");
		listToJSON(alarms, result);
		result.append("}");
		return result.toString();
	}

	public void initDatas() {
		int i = 0;
		double cx = 350, cy = 230, a = 250, b = 180;
		nodes.add(new Node("center", cx, cy));
		double angle = 0, perAngle = 2 * Math.PI/10;
		while(i++ < 10){
			Node node = new Node("node_" + i, cx + a * Math.cos(angle), cy + b * Math.sin(angle));
			elementMap.put(node.name, node);
			nodes.add(node);
			angle += perAngle;
		}
		i = 0;
		while(i++ < 10){
			Link link = new Link("link_" + i, "center", "node_" + i, 1 + random.nextInt(10));
			elementMap.put(link.name, link);
			links.add(link);
		}
	}

    private static StringBuffer listToJSON(List<? extends IJSON> jsonItems, StringBuffer result){
    	if(result == null){
    		result = new StringBuffer();
    	}
    	if(jsonItems.isEmpty()){
    		result.append("[]");
    		return result;
    	}
		result.append("[");
		result.append(jsonItems.get(0).toJSON());
		for(int i = 1, size = jsonItems.size(); i < size; i++){
			result.append(", " + jsonItems.get(i).toJSON());
		}
		result.append("]");
		return result;
    }
    class AlarmWebSocket implements WebSocket.OnTextMessage
    {
    	WebSocket.Connection connection;
		public void onOpen(Connection connect) {
			this.connection = connect;
			clients.add(this);
			sendMessage(this, "reload", loadDatas());
		}
		public void onClose(int code, String message) {
			clients.remove(this);
		}
		public void onMessage(String message) {
			Object json = JSON.parse(message);
			if(!(json instanceof Map)){
				return;
			}
			Map map = (Map)json;
			Object action = map.get("action");
			Object data = map.get("data");
			if("node.move".equals(action)){
				if(!(data instanceof Object[])){
					return;
				}
				Object[] nodes = (Object[])data;
				for(Object nodeData : nodes){
					if(!(nodeData instanceof Map) || !((Map)nodeData).containsKey("name") || !((Map)nodeData).containsKey("x") || !((Map)nodeData).containsKey("y")){
						continue;
					}
					String name = ((Map)nodeData).get("name").toString();
					Data element = elementMap.get(name);
					if(!(element instanceof Node)){
						continue;
					}
					double x = Double.parseDouble(((Map)nodeData).get("x").toString());
					double y = Double.parseDouble(((Map)nodeData).get("y").toString());
					((Node)element).x = x;
					((Node)element).y = y;
				}
				
			}else{
				return;
			}
			for(AlarmWebSocket client : clients){
				if(this.equals(client)){
					continue;
				}
				sendMessage(client, null, message);
			}
		}
	}
    interface IJSON{
    	String toJSON();
    }
    class Data{
    	String name;
    	public Data(String name){
    		this.name = name;
    	}
    }
    class Node extends Data implements IJSON{
    	public Node(String name, double x, double y){
    		super(name);
    		this.x = x;
    		this.y = y;
    	}
    	double x, y;
    	public String toJSON(){
    		return "{\"name\":\"" + name + "\", \"x\":\"" + x + "\",\"y\":\"" + y + "\"}";
    	}
    }
    class Link extends Data implements IJSON{
    	public Link(String name, String from, String to, int width){
    		super(name);
    		this.from =from;
    		this.to = to;
    		this.width = width;
    	}
    	String from;
    	String to;
    	int width = 2;
    	public String toJSON(){
    		return "{\"name\":\"" + name + "\", \"from\":\"" + from + "\", \"to\":\"" + to + "\", \"width\":\"" + width + "\"}";
    	}
    }
    class Alarm implements IJSON{
    	public Alarm(String elementName, String alarmSeverity){
    		this.alarmSeverity = alarmSeverity;
    		this.elementName = elementName;
    	}
    	String alarmSeverity;
    	String elementName;
		public String toJSON() {
			return "{\"elementName\": \"" + elementName + "\", \"alarmSeverity\": \"" + alarmSeverity + "\"}";
		}
    }
	/*public static void main(String[] args) {
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				System.out.println(new Date());
			}
		}, 500, 500);
	}*/
}
