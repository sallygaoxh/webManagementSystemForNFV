package com.main.model;

import com.main.model.Data;
import com.main.model.IJSON;

public class Node extends Data implements IJSON{
	public Node(String name, double x, double y){
		super(name);
		this.x = x;
		this.y = y;
	}
	double x, y;
	
	public String toJSON(){
		return "{\"name\":\"" + name + "\", \"x\":\"" + x + "\",\"y\":\"" + y + "\"}";
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	
}