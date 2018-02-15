package com.main.model;

import java.util.List;

public class OLT {
	
	private int olt_id;
	private String olt_type;
	private int vir_id;
	private boolean is_active;
	private String state;
	private int vlan_id;
	private String manager_ip;
	private String business_board;
	private String uplink_port;
	private String network_gate;
	private List<ONU> onus;
	
	
	
	public List<ONU> getOnus() {
		return onus;
	}
	public void setOnus(List<ONU> onus) {
		this.onus = onus;
	}
	public int getOlt_id() {
		return olt_id;
	}
	public void setOlt_id(int olt_id) {
		this.olt_id = olt_id;
	}
	public String getOlt_type() {
		return olt_type;
	}
	public void setOlt_type(String olt_type) {
		this.olt_type = olt_type;
	}
	public int getVir_id() {
		return vir_id;
	}
	public void setVir_id(int vir_id) {
		this.vir_id = vir_id;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getVlan_id() {
		return vlan_id;
	}
	public void setVlan_id(int vlan_id) {
		this.vlan_id = vlan_id;
	}
	public String getManager_ip() {
		return manager_ip;
	}
	public void setManager_ip(String manager_ip) {
		this.manager_ip = manager_ip;
	}
	public String getBusiness_board() {
		return business_board;
	}
	public void setBusiness_board(String business_board) {
		this.business_board = business_board;
	}
	public String getUplink_port() {
		return uplink_port;
	}
	public void setUplink_port(String uplink_port) {
		this.uplink_port = uplink_port;
	}
	public String getNetwork_gate() {
		return network_gate;
	}
	public void setNetwork_gate(String network_gate) {
		this.network_gate = network_gate;
	}
	@Override
	public String toString() {
		return "OLT [olt_id=" + olt_id + ", olt_type=" + olt_type + ", vir_id="
				+ vir_id + ", is_active=" + is_active + ", state=" + state
				+ ", vlan_id=" + vlan_id + ", manager_ip=" + manager_ip
				+ ", business_board=" + business_board + ", uplink_port="
				+ uplink_port + ", network_gate=" + network_gate + ", onus="
				+ onus + "]";
	}
	
	
	
	
	
}
