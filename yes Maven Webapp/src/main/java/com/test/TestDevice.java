package com.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class TestDevice {
	 public static void readDataFromJson(){
		  //读取json文件，保存到String json中
		  String fileName="d:/data2.json";
		  File file=new File(fileName);
		  StringBuffer sb = new StringBuffer() ;
		  String Json;
		  String line;
		  BufferedReader br=null;
		  try {
		   br=new BufferedReader(new FileReader(file));
		  } catch (FileNotFoundException e) {
		   e.printStackTrace();
		  }
		  try {
		   while((line=br.readLine())!=null){
		    sb.append(line);
		   }
		  } catch (IOException e) {
		   e.printStackTrace();
		  }
		  String json=sb.toString();
		//  System.out.println("json:"+json);

		  //利用com.google.gson 包将json转换成List

		  List devices=new ArrayList();
		  Gson gson = new Gson();
		  List<JsonElement> list=new ArrayList();
		  JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(json);  //将json字符串转换成JsonElement
		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
		  Iterator it=jsonArray.iterator();  //Iterator处理
		  while(it.hasNext()){  //循环
		   jsonElement=(JsonElement) it.next(); //提取JsonElement
		   json=jsonElement.toString();  //JsonElement转换成String
		   Device device=gson.fromJson(json, Device.class); //String转化成JavaBean
		   devices.add(device);  //加入List
		  }

		  System.out.println("ok");
		  
		  System.out.println(devices);

		 }
	 
	 public static void main(String args[]){
		 TestDevice.readDataFromJson();
	 }
	}


