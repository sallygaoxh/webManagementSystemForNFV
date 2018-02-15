package com.main.model;

import java.util.List;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

public class LoPort {

	private Integer id;

    private Integer valid;

    private Integer status;

    private String ipadd;

    private String inter;

    private String prol;

	private Integer vir;

    private Integer method;

    private Integer bw;

    private String vlcy;
    
    private List<Integer> vlans;

   
    public List<Integer> getVlans() {		
    	return vlans;
	}

	public void setVlans(List<Integer> vlans) {
		this.vlans = vlans;
		if(this.vlcy==null)
			this.setVlcy(JSONArray.fromObject(vlans).toString());
	}
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getValid() {
        return valid;
    }

    public void setValid(Integer valid) {
        this.valid = valid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getIpadd() {
        return ipadd;
    }

    public void setIpadd(String ipadd) {
        this.ipadd = ipadd;
    }

    public String getInter() {
        return inter;
    }

    public void setInter(String inter) {
        this.inter = inter;
    }

    public String getProl() {
        return prol;
    }

    public void setProl(String prol) {
        this.prol = prol;
    }

    public Integer getVir() {
        return vir;
    }

    public void setVir(Integer vir) {
        this.vir = vir;
    }

    public Integer getMethod() {
        return method;
    }

    public void setMethod(Integer method) {
        this.method = method;
    }

    public Integer getBw() {
        return bw;
    }

    public void setBw(Integer bw) {
        this.bw = bw;
    }

    public String getVlcy() {
        return vlcy;
    }

    public void setVlcy(String vlcy) {
        this.vlcy = vlcy;
        if(this.vlans==null)
			this.setVlans(JSONArray.fromObject(vlcy));
    }

	@Override
	public String toString() {
		return "LoPort [id=" + id + ", valid=" + valid + ", status=" + status
				+ ", ipadd=" + ipadd + ", inter=" + inter + ", prol=" + prol
				+ ", vir=" + vir + ", method=" + method + ", bw=" + bw
				+ ", vlcy=" + vlcy + ", vlans=" + vlans + "]";
	}
    
    
}