package com.test;

import java.util.List;

public class Device {
	private int dpid;
	private String state;
	private boolean is_active;
	private List<Port> ports;
	private List<Integer> supported_ofp_version;
	private List<String> address;
	
	
	
	public Device(int dpid, String state, boolean is_active, List<Port> ports,
			List<Integer> supported_ofp_version, List<String> address) {
		super();
		this.dpid = dpid;
		this.state = state;
		this.is_active = is_active;
		this.ports = ports;
		this.supported_ofp_version = supported_ofp_version;
		this.address = address;
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
	public void setSupported_ofp_version(List<Integer> supported_ofp_version) {
		this.supported_ofp_version = supported_ofp_version;
	}
	public List<String> getAddress() {
		return address;
	}
	public void setAddress(List<String> address) {
		this.address = address;
	}
	
	
	@Override
	public String toString() {
		return "Device [dpid=" + dpid + ", state=" + state + ", is_active="
				+ is_active + ", ports=" + ports + ", supported_ofp_version="
				+ supported_ofp_version + ", address=" + address + "]";
	}
	
	
	
	
	
	

}
