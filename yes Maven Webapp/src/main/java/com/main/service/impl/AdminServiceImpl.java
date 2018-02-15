package com.main.service.impl;

import java.io.IOException;   
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.httpclient.*;   
import org.apache.commons.httpclient.methods.*;  
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.main.model.DataPath;
import com.main.service.AdminService;
import com.main.service.DpService;

@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService{
	
	@Resource
	DpService DpService;
	
	@Override
	public String connect (String command){
		  HttpClient client = new HttpClient(); 
	      // 设置代理服务器地址和端口        
	      //client.getHostConfiguration().setProxy("proxy_host_addr",proxy_port);   
	      // 使用 GET 方法 ，如果服务器需要通过 HTTPS 连接，那只需要将下面 URL 中的 http 换成 https 
		 // urladdress = "http://www.baidu.com";
	      HttpMethod method=new GetMethod("http://10.108.0.200:8080/"+command);  
		  //HttpMethod method=new GetMethod("http://fanyi.youdao.com/openapi.do?keyfrom=YES-test&key=274123816&type=data&doctype=json&version=1.1&q=good"); 
	      //使用POST方法  
	      //HttpMethod method = new PostMethod("http://java.sun.com");  
	      try {
			//HttpResponse res= 
					client.executeMethod(method);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	  
	      //打印服务器返回的状态  
	     // JsonParser parser = new JsonParser();
	     // JsonObject object =(JsonObject) parser.parse(method.getStatusLine().toString());
	      //System.out.println(method.getStatusLine());
	     // System.out.println("1="+object.get("1").getAsString());
	      String message = "";
	      //打印返回的信息  
	      try {
			System.out.println(method.getResponseBodyAsString());
			message= method.getResponseBodyAsString();
		} catch (IOException e) {
			e.printStackTrace();
		}  
	      //释放连接  
	      method.releaseConnection();
	      //AdminServiceImpl.Http2json(message);
		  return message;
	}
	
	
	

}	
