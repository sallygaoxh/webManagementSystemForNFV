package com.main.model;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.Gson;

@JsonIgnoreProperties(ignoreUnknown = true)
public class LVlan {
    private Integer id;

    private String name;

    private String ptcy;
    
    private List<String> ports;

    private Integer switype;

    private String vby1;

	private String vby2;

    private Integer vby3;

    private Integer vby4;

    
    public List<String> getPorts() {
  		return ports;
  	}

  	public void setPorts(List<String> ports) {
  		this.ports = ports;
  		//System.out.println("进入setport");
  		//System.out.println("qptcy"+this.ptcy);
  		if(this.ptcy==null||(!this.ptcy.equals(JSONArray.fromObject(ports).toString()))){
  			//System.out.println("由port设定ptcy");
  			this.setPtcy(JSONArray.fromObject(ports).toString());
  		}
  		//System.out.println("hptcy"+this.ptcy);
  	}
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPtcy() {
        return ptcy;
    }

    public void setPtcy(String ptcy) {
        	this.ptcy = ptcy;
        
        	Gson G = new Gson();      
        	
        	this.setPorts(G.fromJson(ptcy, List.class));
        	//System.out.println("in ptcy"+this.ptcy);
        
    }

    public Integer getSwitype() {
        return switype;
    }

    public void setSwitype(Integer switype) {
        this.switype = switype;
    }

    public String getVby1() {
        return vby1;
    }

    public void setVby1(String vby1) {
        this.vby1 = vby1;
    }

    public String getVby2() {
        return vby2;
    }

    public void setVby2(String vby2) {
        this.vby2 = vby2;
    }

    public Integer getVby3() {
        return vby3;
    }

    public void setVby3(Integer vby3) {
        this.vby3 = vby3;
    }

    public Integer getVby4() {
        return vby4;
    }

    public void setVby4(Integer vby4) {
        this.vby4 = vby4;
    }

	@Override
	public String toString() {
		return "LVlan [id=" + id + ", name=" + name + ", ptcy=" + ptcy
				+ ", ports=" + ports + ", switype=" + switype + ", vby1="
				+ vby1 + ", vby2=" + vby2 + ", vby3=" + vby3 + ", vby4=" + vby4
				+ "]";
	}
    
}