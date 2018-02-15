package com.login.model;

public class User {


	private  String username; //账号
	private  String password;//密码
	private  String rank;//用户等级
	private  int vlan;

	public User (){}
	
	public User(String uname,String password)
	{
		this.username=uname;
		this.password=password;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getVlan() {
		return vlan;
	}

	public void setVlan(int vlan) {
		this.vlan = vlan;
	}

	public User(String uname,String password,String rank)
	{
		this.username=uname;
		this.password=password;
		this.rank=rank;
	}
	
	
	public String getUname() {
		return username;
	}

	public void setUname(String uname) {
		this.username = uname;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password
				+ ", rank=" + rank + ", vlan=" + vlan + "]";
	}
	
	
}
