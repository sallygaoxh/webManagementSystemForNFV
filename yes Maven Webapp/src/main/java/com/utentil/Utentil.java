package com.utentil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.eclipse.jetty.util.ajax.JSON;

import sun.org.mozilla.javascript.internal.regexp.SubString;

import com.google.gson.Gson;
import com.main.model.LVlan;
//
public class Utentil {
	
	public static void main(String args[]){
		/*List<Integer> a=new ArrayList<Integer>();
		a.add(0);
		a.add(1);
		System.out.println(addForm(a));*/
		/*LVlan vlan=new LVlan();
		vlan.setId(1);
		vlan.setName("sdf");
		vlan.setSwitype(2);
		vlan.setVby1("sdf");
		vlan.setVby2("aaa");
		vlan.setVby3(21);
		vlan.setVby4(33);
		//lVlanService.insertSelective(vlan);
		List<Integer> a=new ArrayList<Integer>();
		a.add(1);
		a.add(2);
		vlan.setPorts(a);
		System.out.println(jsonFormChange(JSONObject.fromObject(vlan).toString()));*/
		JSONObject  a=new JSONObject();
		a.put("inter", "vlan  ");
		System.out.println(deleteSpace(a.toString()));
		
	}
	
	public static String ipInt2Str(int ip)
	{
	     final StringBuilder sb = new StringBuilder();
	     sb.append(String.valueOf(ip>>>24)).append(".");
	     sb.append(String.valueOf(ip&0xFFFFFF>>>16 )).append(".");	    
	     sb.append(String.valueOf(ip&0xFFFF>>>8 )).append(".");
	     sb.append(String.valueOf(ip&0xFF)).append(".");
	     return sb.toString();
	}
	public static List<String> addForm(List<Double> port){
		List<String> newPorts=new ArrayList<String> ();
		for(int i=0;i<port.size();i++){
			double o=port.get(i);
			int a=(int)o;
			newPorts.add("G0/"+a);
		}
		System.out.println("vlanport is"+newPorts);
		return newPorts;		
	}
	
	public static String deleteSpace(String portString){
		//List<String> newPorts=new ArrayList<String> ();
		JSONObject  a=JSONObject.fromObject(portString);
		String value = a.optString("inter");
		value=value.substring(0, 4);
		a.remove("inter");
		a.put("inter", value);
		if(!value.substring(0,3).equals("G0/"))
			return "1";
		else				
		return a.toString();			
	}
	
	public static String jsonFormChange(String ori){
		List<String> newPorts=new ArrayList<String> ();
		JSONObject  a=JSONObject.fromObject(ori);
		String value = a.optString("ports");
		Gson G = new Gson(); 
		List<Double> port= G.fromJson(value, List.class);
		newPorts=addForm(port);
		a.remove("ports");
		a.put("ports", newPorts);
		
		
		
		return a.toString();
		
	}
	
	

}
