package com.main.model;

public class Port {
	
	private int portid;
	private String hw_addr;
	private String name;
	private int dp_id;
	//private int dpid;
	
	


	public int getPortid() {
		return portid;
	}
	public int getDp_id() {
		return dp_id;
	}
	public void setDp_id(int dp_id) {
		this.dp_id = dp_id;
	}
	public String getHw_addr() {
		return hw_addr;
	}
	public void setPortid(int portid) {
		this.portid = portid;
	}
	public void setHw_addr(String hw_addr) {
		this.hw_addr = hw_addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Port [portid=" + portid + ", hw_addr=" + hw_addr + ", name="
				+ name + ", dp_id=" + dp_id + "]";
	}
	public Port(int portid, String hw_addr, String name, int dp_id) {
		super();
		this.portid = portid;
		this.hw_addr = hw_addr;
		this.name = name;
		this.dp_id = dp_id;
	}
	public Port() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
