package com.main.model;

public class TestPort {
    private Integer id;

    private String name;

    private Boolean status;

    private String inter;

    private Integer vir;

    private String type;

    private Integer bw;

    private Integer delay;

    private Integer vlanid;

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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getInter() {
        return inter;
    }

    public void setInter(String inter) {
        this.inter = inter;
    }

    public Integer getVir() {
        return vir;
    }

    public void setVir(Integer vir) {
        this.vir = vir;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public Integer getVlanid() {
        return vlanid;
    }

    public void setVlanid(Integer vlanid) {
        this.vlanid = vlanid;
    }

	@Override
	public String toString() {
		return "TestPort [id=" + id + ", name=" + name + ", status=" + status
				+ ", inter=" + inter + ", vir=" + vir + ", type=" + type
				+ ", bw=" + bw + ", delay=" + delay + ", vlanid=" + vlanid
				+ "]";
	}
    
    
}