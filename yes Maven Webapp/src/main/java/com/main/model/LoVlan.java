package com.main.model;

import java.util.List;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

public class LoVlan {

	private Integer id;

    private String name;

    private String ptcy;
    
    private List<String> ports;
    
	public List<String> getPorts() {		
    	return ports;
	}

	public void setPorts(List<String> ports) {
		this.ports = ports;
		if(this.ptcy==null)
			this.setPtcy(JSONArray.fromObject(ports).toString());
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
        if(this.ports==null){
			Gson G = new Gson();
        	System.out.println(ptcy);
        	this.setPorts(G.fromJson(ptcy, List.class));
			
        }
    
    }

	@Override
	public String toString() {
		return "LoVlan [id=" + id + ", name=" + name + ", ptcy=" + ptcy
				+ ", ports=" + ports + "]";
	}
}