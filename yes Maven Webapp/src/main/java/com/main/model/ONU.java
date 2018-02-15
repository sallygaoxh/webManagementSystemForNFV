package com.main.model;

public class ONU {


	private int onu_id;
	private String onu_type;
	private int olt_id;
	private String mac_addr;
	private int vlan_id;
	private boolean onu_state;
	private int onu_bandwith;
	private int vir_id;
	
	
	public int getOnu_id() {
		return onu_id;
	}
	public void setOnu_id(int onu_id) {
		this.onu_id = onu_id;
	}
	public String getOnu_type() {
		return onu_type;
	}
	public void setOnu_type(String onu_type) {
		this.onu_type = onu_type;
	}
	public int getOlt_id() {
		return olt_id;
	}
	public void setOlt_id(int olt_id) {
		this.olt_id = olt_id;
	}
	public String getMac_addr() {
		return mac_addr;
	}
	public void setMac_addr(String mac_addr) {
		this.mac_addr = mac_addr;
	}
	public int getVlan_id() {
		return vlan_id;
	}
	public void setVlan_id(int vlan_id) {
		this.vlan_id = vlan_id;
	}
	public boolean getOnu_state() {
		return onu_state;
	}
	public void setOnu_state(boolean onu_state) {
		this.onu_state = onu_state;
	}
	public int getOnu_bandwith() {
		return onu_bandwith;
	}
	public void setOnu_bandwith(int onu_bandwith) {
		this.onu_bandwith = onu_bandwith;
	}
	public int getVir_id() {
		return vir_id;
	}
	public void setVir_id(int vir_id) {
		this.vir_id = vir_id;
	}
	
	
	@Override
	public String toString() {
		return "ONU [onu_id=" + onu_id + ", onu_type=" + onu_type + ", olt_id="
				+ olt_id + ", mac_addr=" + mac_addr + ", vlan_id=" + vlan_id
				+ ", onu_state=" + onu_state + ", onu_bandwith=" + onu_bandwith
				+ ", vir_id=" + vir_id + "]";
	}

	




}
