package com.main.model;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

public class LPort {
    private String inter;

    private Integer valid;

    private Integer status;

    private String ipadd;

    private String prol;

    private Integer vir;

    private Integer method;

    private Integer bw;

    private Integer delay;

    private String inuti;

    private String oututi;

    private Long inerrors;

    private Long outerrors;

    private Integer switype;

    private String vlcy;

    private String tbcy;
    
    private List<Integer> vlans;
    
    
    public List<Integer> getVlans() {
		return vlans;
	}

	public void setVlans(List<Integer> vlans) {
		this.vlans = vlans;
		System.out.println("vlcy:"+this.vlcy);
		System.out.println("vlans:"+JSONArray.fromObject(vlans).toString());
		if(this.vlcy==null||!this.vlcy.equals(JSONArray.fromObject(vlans).toString()))
			this.setVlcy(JSONArray.fromObject(vlans).toString());			
	}

	public List<String> getTbs() {
		return tbs;
	}

	public void setTbs(List<String> tbs) {
		this.tbs = tbs;
		if(this.tbcy==null)
			this.setTbcy(JSONArray.fromObject(tbs).toString());
	}

	private List<String> tbs;

    private String pby1;

    private String pby2;

    private Integer pby3;

    private Integer pby4;

    public String getInter() {
        return inter;
    }

    public void setInter(String inter) {
        this.inter = inter;
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

    public Integer getDelay() {
        return delay;
    }

    public void setDelay(Integer delay) {
        this.delay = delay;
    }

    public String getInuti() {
        return inuti;
    }

    public void setInuti(String inuti) {
        this.inuti = inuti;
    }

    public String getOututi() {
        return oututi;
    }

    public void setOututi(String oututi) {
        this.oututi = oututi;
    }

    public Long getInerrors() {
        return inerrors;
    }

    public void setInerrors(Long inerrors) {
        this.inerrors = inerrors;
    }

    public Long getOuterrors() {
        return outerrors;
    }

    public void setOuterrors(Long outerrors) {
        this.outerrors = outerrors;
    }

    public Integer getSwitype() {
        return switype;
    }

    public void setSwitype(Integer switype) {
        this.switype = switype;
    }

    public String getVlcy() {
        return vlcy;
    }

    public void setVlcy(String vlcy) {
        this.vlcy = vlcy;
        
        	Gson G = new Gson();
        	List<Double> vlans=G.fromJson(vlcy, List.class);
        	List<Integer> newVlans=new ArrayList<Integer>();
        	for(double a:vlans){
        		int b=(int) a;      	
        		newVlans.add(b);
        	}
        	this.setVlans(newVlans);
        	//System.out.println("in setVlcy"+JSONArray.fromObject(vlans).toString());
        
    }

    public String getTbcy() {
        return tbcy;
    }

    public void setTbcy(String tbcy) {
        this.tbcy = tbcy;
        if(this.tbs==null){
        	Gson G = new Gson();
        	this.setTbs(G.fromJson(tbcy, List.class));
        }
    }

    public String getPby1() {
        return pby1;
    }

    public void setPby1(String pby1) {
        this.pby1 = pby1;
    }

    public String getPby2() {
        return pby2;
    }

    public void setPby2(String pby2) {
        this.pby2 = pby2;
    }

    public Integer getPby3() {
        return pby3;
    }

    public void setPby3(Integer pby3) {
        this.pby3 = pby3;
    }

    public Integer getPby4() {
        return pby4;
    }

    public void setPby4(Integer pby4) {
        this.pby4 = pby4;
    }

	@Override
	public String toString() {
		return "LPort [inter=" + inter + ", valid=" + valid + ", status="
				+ status + ", ipadd=" + ipadd + ", prol=" + prol + ", vir="
				+ vir + ", method=" + method + ", bw=" + bw + ", delay="
				+ delay + ", inuti=" + inuti + ", oututi=" + oututi
				+ ", inerrors=" + inerrors + ", outerrors=" + outerrors
				+ ", switype=" + switype + ", vlcy=" + vlcy + ", tbcy=" + tbcy
				+ ", vlans=" + vlans + ", tbs=" + tbs + ", pby1=" + pby1
				+ ", pby2=" + pby2 + ", pby3=" + pby3 + ", pby4=" + pby4 + "]";
	}
    
}