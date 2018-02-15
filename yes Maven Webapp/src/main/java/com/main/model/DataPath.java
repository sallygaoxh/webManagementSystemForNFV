package com.main.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;



@JsonIgnoreProperties(ignoreUnknown = true)
public class DataPath {
	private int dpid;
	private String state;
	private boolean is_active;
	private List<Port> ports;
	private List<Integer> supported_ofp_version;
	private List<String> address;
	public String  supported_ofp_version_copy;
	public String  address_copy;
	
	
	
	
	public DataPath() {
		super();
		// TODO Auto-generated constructor stub
	}
	/*
	public DataPath(int dpid, String state, boolean is_active, List<Port> ports,
			String supported_ofp_version_copy, String address_copy) {
		super();
		this.dpid = dpid;
		this.state = state;
		this.is_active = is_active;
		this.ports = ports;
		this.supported_ofp_version_copy = supported_ofp_version_copy;
		this.address_copy = address_copy;
	}

	public DataPath(int dpid, String state, boolean is_active, List<Port> ports,
			List<Integer> supported_ofp_version, List<String> address,
			String supported_ofp_version_copy, String address_copy) {
		super();
		this.dpid = dpid;
		this.state = state;
		this.is_active = is_active;
		this.ports = ports;
		this.supported_ofp_version = supported_ofp_version;
		this.address = address;
		this.supported_ofp_version_copy = supported_ofp_version_copy;
		this.address_copy = address_copy;
	}
    */ 
	public String getSupported_ofp_version_copy() {
		return supported_ofp_version_copy;
	}	

	//
	public void setSupported_ofp_version_copy(String supported_ofp_version_copy) {
		this.supported_ofp_version_copy = supported_ofp_version_copy;
		if(this.supported_ofp_version==null)
			this.setSupported_ofp_version(Json2IntList(supported_ofp_version_copy));
	}

	public String getAddress_copy() {
		return address_copy;
	}
	
	//
	public void setAddresscopy(String addresscopy) {
		this.address_copy = addresscopy;
		if(this.address==null)
			this.setAddress(Json2StringList(addresscopy));
	}

	public int getDpid() {
		return dpid;
	}
	public void setDpid(int dpid) {
		this.dpid = dpid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public List<Port> getPorts() {
		return ports;
	}
	public void setPorts(List<Port> ports) {
		this.ports = ports;
	}
	public List<Integer> getSupported_ofp_version() {
		return supported_ofp_version;
	}
	//
	public void setSupported_ofp_version(List<Integer> supported_ofp_version) {
		this.supported_ofp_version = supported_ofp_version;
		if(this.supported_ofp_version_copy==null)
		this.setSupported_ofp_version_copy(int2Json(supported_ofp_version));
	}
	public List<String> getAddress() {
		return address;
	}
	//
	public void setAddress(List<String> address) {
		this.address = address;
		if(this.address_copy==null)
		this.setAddresscopy(string2Json(address));
	}
	
	public String int2Json(List<Integer> a){
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(a);
		return jsonArray1.toString();
	}
	
	public String string2Json(List<String> b){
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(b);
		return jsonArray1.toString();
	}

	
	public List<String> Json2StringList(String stringJson){
		  List<String> as=new ArrayList<String>();
		  Gson gson = new Gson();
		  List<JsonElement> list=new ArrayList();
		  JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(stringJson);  //将json字符串转换成JsonElement
		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
		  Iterator it=jsonArray.iterator();  //Iterator处理
		  while(it.hasNext()){  //循环
		   jsonElement=(JsonElement) it.next(); //提取JsonElement
		   stringJson=jsonElement.toString();  //JsonElement转换成String
		   String a=gson.fromJson(stringJson, String.class); //String转化成JavaBean
		   as.add(a);  //加入List
		  }
		return as;
	}
	
	public List<Integer> Json2IntList(String intJson){
		  List<Integer> as=new ArrayList<Integer>();
		  Gson gson = new Gson();
		  List<JsonElement> list=new ArrayList();
		  JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(intJson);  //将json字符串转换成JsonElement
		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
		  Iterator it=jsonArray.iterator();  //Iterator处理
		  while(it.hasNext()){  //循环
		   jsonElement=(JsonElement) it.next(); //提取JsonElement
		   intJson=jsonElement.toString();  //JsonElement转换成String
		   Integer a=gson.fromJson(intJson, Integer.class); //String转化成JavaBean
		   as.add(a);  //加入List
		  }
		return as;
	}

	@Override
	public String toString() {
		return "DataPath [dpid=" + dpid + ", state=" + state + ", is_active="
				+ is_active + ", ports=" + ports + ", supported_ofp_version="
				+ supported_ofp_version + ", address=" + address
				+ ", supported_ofp_version_copy=" + supported_ofp_version_copy
				+ ", address_copy=" + address_copy + "]";
	}




	
	
	
	/*
	public String toString() {
		return "Device [dpid=" + dpid + ", state=" + state + ", is_active="
				+ is_active + ", ports=" + ports + ", supported_ofp_version="
				+ supported_ofp_version + ", address=" + address + "]";
	}*/
	
	
	
	
	
	
	
	
	

}
