package com.main.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.main.model.DataPath;
import com.main.model.LPort;
import com.main.model.LRoutab;
import com.main.model.LVlan;
import com.main.model.OLT;
import com.main.model.Port;
import com.main.model.TestPort;
import com.utentil.Utentil;

@Service
public class Http2JsonService {
	
	@Resource 
	TestPortService testPortService;
	@Resource 
	LPortService lPortService;
	@Resource 
	LVlanService lVlanService;
	@Resource 
	LRouTabService lRouTabService;

	public void json2Object(String init, String condition,String dpid) {
		  Gson gson = new Gson();
		 /* JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(init);  //将json字符串转换成JsonElement
		  JsonObject jsonArray=jsonElement.getAsJsonObject();  //将JsonElement转换成JsonArray
		  TestPort port= new TestPort();*/

		switch(condition){
		//Cisco port
		case "00":{
			/*   //循环
			   init=jsonElement.toString();  //JsonElement转换成String
			   TestPort qq1=gson.fromJson(init, TestPort.class); //String转化成JavaBean
			   ports.add(qq1);  //加入List
			  }
			  for(int i = 0; i< ports.size();i ++)*/
			//TestPort qq1=gson.fromJson(init, TestPort.class);
			//testPortService.insert(qq1);
			//存到数据库的时候 cisco存0，huawei存1
			init=Utentil.deleteSpace(init);
			if(init.equals("1"))
				break;
			LPort port = gson.fromJson(init, LPort.class);
			port.setPby1(dpid);
			port.setSwitype(0);
			if(lPortService.selectByInterAndDpid(port.getInter(),dpid)==null)
			lPortService.insertSelective(port);
			else lPortService.updateByPrimaryKeySelective(port);
			break;
		}
		
		//Cisco vlan
		case "01":{
			init=Utentil.jsonFormChange(init);
			//System.out.println("in vlan restful:"+init);
			LVlan vlan=gson.fromJson(init, LVlan.class);	
			vlan.setPtcy(JSONArray.fromObject(vlan.getPorts()).toString());
			vlan.setSwitype(0);
			vlan.setVby1(dpid);
			System.out.println("in vlan restful: vlan"+vlan);
			if(lVlanService.selectByPrimaryKey(vlan.getId())==null)
			    lVlanService.insertSelective(vlan);
			else
				lVlanService.updateByPrimaryKeySelective(vlan);
			break;
		}
		
		//Huawei port
		case "10":{
			//TestPort qq1=gson.fromJson(init, TestPort.class);
			  //testPortService.insert(qq1);
			 init=Utentil.deleteSpace(init);
			 if(init.equals("1"))
					break;
			 LPort port = gson.fromJson(init, LPort.class);
			 port.setSwitype(1);
			 port.setPby1(dpid);
			 if(lPortService.selectByInterAndDpid(port.getInter(),dpid)==null)
					lPortService.insertSelective(port);
			else lPortService.updateByPrimaryKeySelective(port);
			 
			break;
		}
		
		//Huawei vlan
		case "11":{
			init=Utentil.jsonFormChange(init);
			LVlan vlan=gson.fromJson(init, LVlan.class);
			vlan.setPtcy(JSONArray.fromObject(vlan.getPorts()).toString());
			vlan.setSwitype(1);
			vlan.setVby1(dpid);
			if(lVlanService.selectByPrimaryKey(vlan.getId())==null)
				lVlanService.insertSelective(vlan);
			else
				lVlanService.updateByPrimaryKeySelective(vlan);
			break;
		}
		//Huawei table
		case "12":{
			//init=Utentil.jsonFormChange(init);
			LRoutab table=gson.fromJson(init, LRoutab.class);
			table.setSwitype(1);
			table.setRby1(dpid);
			if(lRouTabService.selectByPrimaryKey(table.getDest())==null)
				lRouTabService.insertSelective(table);
			else
				lRouTabService.updateByPrimaryKeySelective(table);
			break;
		}
		}
	}
	


//	public void DpJson(String command){
//		
//		 List<DataPath> qqs=new ArrayList<DataPath>();
//		  Gson gson = new Gson();
//		  List<JsonElement> list=new ArrayList();
//		  JsonParser jsonParser=new JsonParser();
//		  JsonElement jsonElement=jsonParser.parse(command);  //将json字符串转换成JsonElement
//		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
//		  Iterator it=jsonArray.iterator();  //Iterator处理
//		  while(it.hasNext()){  //循环
//		   jsonElement=(JsonElement) it.next(); //提取JsonElement
//		   command=jsonElement.toString();  //JsonElement转换成String
//		   DataPath qq1=gson.fromJson(command, DataPath.class); //String转化成JavaBean
//		   qqs.add(qq1);  //加入List
//		  }
//			
//		  for (DataPath i: qqs)
//		  {
//			  i.setSupported_ofp_version(i.getSupported_ofp_version());
//			  i.setAddress(i.getAddress());
//			  DpService.insertDp(i);
//		  }
//	}
	
	public void OLTJson(String command){
		  List<OLT> qqs=new ArrayList<OLT>();
		  Gson gson = new Gson();
		  List<JsonElement> list=new ArrayList();
		  JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(command);  //将json字符串转换成JsonElement
		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
		  Iterator it=jsonArray.iterator();  //Iterator处理
		  while(it.hasNext()){  //循环
		   jsonElement=(JsonElement) it.next(); //提取JsonElement
		   command=jsonElement.toString();  //JsonElement转换成String
		   OLT qq1=gson.fromJson(command, OLT.class); //String转化成JavaBean
		   qqs.add(qq1);  //加入List
		  }
			
/*		  for (OLT i: qqs)
		  {
			  oltService.insertOlt(i);
		  }*/
	}
	
	
	
}
