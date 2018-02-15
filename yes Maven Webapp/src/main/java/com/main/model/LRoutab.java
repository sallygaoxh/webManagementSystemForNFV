package com.main.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class LRoutab {
    private String dest;

    private Integer pre;

    private Integer cost;

    private String nexthop;

    private String inter;

    private Integer switype;

    private String rby1;

    private String rby2;

    private Integer rby3;

    private Integer rby4;

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    public Integer getPre() {
        return pre;
    }

    public void setPre(Integer pre) {
        this.pre = pre;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public String getNexthop() {
        return nexthop;
    }

    public void setNexthop(String nexthop) {
        this.nexthop = nexthop;
    }

    public String getInter() {
        return inter;
    }

    public void setInter(String inter) {
        this.inter = inter;
    }

    public Integer getSwitype() {
        return switype;
    }

    public void setSwitype(Integer switype) {
        this.switype = switype;
    }

    public String getRby1() {
        return rby1;
    }

    public void setRby1(String rby1) {
        this.rby1 = rby1;
    }

    public String getRby2() {
        return rby2;
    }

    public void setRby2(String rby2) {
        this.rby2 = rby2;
    }

    public Integer getRby3() {
        return rby3;
    }

    public void setRby3(Integer rby3) {
        this.rby3 = rby3;
    }

    public Integer getRby4() {
        return rby4;
    }

    public void setRby4(Integer rby4) {
        this.rby4 = rby4;
    }

	@Override
	public String toString() {
		return "LRoutab [dest=" + dest + ", pre=" + pre + ", cost=" + cost
				+ ", nexthop=" + nexthop + ", inter=" + inter + ", switype="
				+ switype + ", rby1=" + rby1 + ", rby2=" + rby2 + ", rby3="
				+ rby3 + ", rby4=" + rby4 + "]";
	}
    
}