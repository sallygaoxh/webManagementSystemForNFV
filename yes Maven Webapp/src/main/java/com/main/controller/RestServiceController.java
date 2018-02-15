package com.main.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.main.model.AddTest;
import com.main.model.DataPath;
import com.main.model.TestPort;
import com.main.service.DpService;
import com.main.service.Http2JsonService;
import com.utentil.Utentil;

@RestController
@RequestMapping("/RestService")
public class RestServiceController {

	@Resource 
	Http2JsonService http2JsonService;
	
	@RequestMapping(value="/{sw}/{info}/{dpid}.do", method=RequestMethod.POST)
	public String test1(@RequestBody String init, @PathVariable String sw, @PathVariable String info, @PathVariable String dpid){
		String condition = sw + info;
		System.out.println("receive"+condition+"dpid"+dpid);
		System.out.println(init);
		//JSONObject  a=JSONObject.fromObject(init);
		//((Object) a.get("ipadd")).set();Utentil.ipInt2Str((int) a.get("ipadd"));
		http2JsonService.json2Object(init, condition,dpid);
		//System.out.println(init);
		
		/*List<Integer> a=new ArrayList<Integer>();
		a.add(1);
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(a);*/
		return "200";
		
   }
	
	
	
	
	@RequestMapping(value="/test.do" ,method=RequestMethod.GET)
	public AddTest Test(){
		
		String command="add route 255.255.255.0 192.168.0.1 24";
		int parameter=100;
		AddTest test= new AddTest(command,parameter);
		
		return test;
		
	}
	
	

	
	
	
	
	
}

