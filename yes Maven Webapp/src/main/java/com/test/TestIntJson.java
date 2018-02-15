package com.test;

import java.util.ArrayList;
import java.util.List;

public class TestIntJson {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<Integer> a=new ArrayList<Integer>();
		a.add(1);
		a.add(2);
		List<String> b=new ArrayList<String>();
		b.add("wang");
		b.add("yu");
		System.out.println(TestIntJson.string2Json(b));
	}
	
	public static String int2Json(List<Integer> a){
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(a);
		return jsonArray1.toString();
	}
	
	public static String string2Json(List<String> b){
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(b);
		return jsonArray1.toString();
	}

}
