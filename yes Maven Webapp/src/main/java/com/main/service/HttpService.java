package com.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


import com.main.model.AddTest;
import com.main.model.DataPath;
import com.main.model.Port;



@Service
public class HttpService {
	
	@Resource 
	DpService dpService;
	
	public void getDp(String command){
		
		 RestTemplate restTemplate = new RestTemplate();
		 //"http://10.108.0.200:8080/"+command
		 DataPath[] dps = restTemplate.getForObject("http://localhost:8080/yes/RestService/DpInfo/0.do", DataPath[].class);
		 for(DataPath dp : dps){
			 dpService.insertDp(dp);
		 }
	}
	
	public void testAddFlow(){

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        headers.add("Accept", MediaType.APPLICATION_JSON.toString());
       
//      List<Integer> a=new ArrayList<Integer>();
//		a.add(1);
//		a.add(2);
		
//		List<String> b=new ArrayList<String>();
//		b.add("wang");
//		b.add("yu");
//		
//		Port pt= new Port();
//		pt.setDp_id(11);
//		pt.setHw_addr("1111");
//		pt.setName("23");
//		pt.setPortid(7);
//		
//		List<Port> pts= new ArrayList<Port>();
//		pts.add(pt);
//		
//		
//		DataPath dp = new DataPath();
//		dp.setSupported_ofp_version(a);
//		dp.setAddress(b);
//		dp.setDpid(11);
//		dp.setState("main");
//		dp.setIs_active(true);
//		dp.setPorts(pts);
//		List<DataPath> dps=new ArrayList<DataPath>();
//		dps.add(dp);
//      JSONArray jsonObj = JSONArray.fromObject(dps);
//      HttpEntity<String> formEntity = new HttpEntity<String>(jsonObj.toString(), headers);

		 //http://localhost:8080/yes/RestService/DpInfo/dpId.do
        //http://192.168.0.1:8080/bstatus/dps
//        String result = restTemplate.postForObject("http://localhost:8080/yes/RestService/DpInfo/dpId.do", formEntity, String.class);
//        System.out.println(result+"?");    
		
	}
	
	public void testAdd(){
		 RestTemplate restTemplate = new RestTemplate();
		 AddTest dps = restTemplate.getForObject("http://localhost:8080/yes/RestService/test.do", AddTest.class);
		 System.out.println(dps);
	}
	
	public void setting(int commandNum,String interName,String vlanName,int vlanNum){
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        headers.add("Accept", MediaType.APPLICATION_JSON.toString());
        HttpEntity<String> formEntity = new HttpEntity<String>(settingCom(commandNum,interName,vlanName,vlanNum), headers);
        String result = restTemplate.postForObject("http://localhost:8080/yes/RestService/DpInfo/dpId.do", formEntity, String.class);
        System.out.println(result+"?");    
		
	}
	
	public void manulSet(String msg){
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        headers.add("Accept", MediaType.APPLICATION_JSON.toString());
        
        HttpEntity<String> formEntity = new HttpEntity<String>(msg, headers);
        
        String result = restTemplate.postForObject("http://192.168.0.2:8080/cmd", formEntity, String.class);
        System.out.println("sendresult: "+result);  		
	}
	
	public void manulSetport(String msg){
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        headers.add("Accept", MediaType.APPLICATION_JSON.toString());
        
        HttpEntity<String> formEntity = new HttpEntity<String>(msg, headers);
        
        String result = restTemplate.postForObject("http://192.168.0.2:8080/cmd2dp", formEntity, String.class);
        System.out.println("sendresult: "+result);  		
	}
	
	public String settingCom(int commandNum,String interName, String vlanName, int vlanNum){
		String command = "";
		switch (commandNum){
		
		//初始化
		case 1:{
			command ="en"+"\n"+"show ip interface briefly"+"\n"+"show int "+interName+"\n"+"show vlan briefly"+"\n";// (提取vlan和端口的映射)
			break;
		}
		//创建并进入vlan 
		case 2:{
			command="conf t"+"\n"+"vlan "+vlanNum+"\n"+"name "+vlanName+"\n"+"show vlan brief"+"\n"+"exit"+"\n";
			break;
		}
		//将端口绑定至 vlan
		case 3:{
			command="conf t"+"\n"+"int "+interName+"\n"+"switch port access vlan "+vlanNum+"\n"+"show vlan brief"+"\n"+"exit"+"\n";
			break;
		}
		}
		System.out.printf(command);
		return command;
	}
	
}

