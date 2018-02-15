package com.main.model;

import com.main.model.Data;
import com.main.model.IJSON;

public class Link extends Data implements IJSON{
	public Link(String name, String from, String to, int width){
		super(name);
		this.from =from;
		this.to = to;
		this.width = width;
	}
	String from;
	String to;
	int width = 2;
	public String toJSON(){
		return "{\"name\":\"" + name + "\", \"from\":\"" + from + "\", \"to\":\"" + to + "\", \"width\":\"" + width + "\"}";
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	
}