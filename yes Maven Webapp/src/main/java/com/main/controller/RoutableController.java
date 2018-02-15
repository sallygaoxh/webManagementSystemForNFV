package com.main.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.main.model.LRoutab;
import com.main.service.LRouTabService;

@RestController
@RequestMapping("/routale")
public class RoutableController {
	@Resource
	LRouTabService lRouTabService;
	@RequestMapping("/newTable.do")
	public void configPort( String mac,String ip,String port,
			HttpServletResponse response){
		
		//System.out.println(mac+ip+port);
		//String command="dpid"+"\n"+
		
		LRoutab lRoutab=new LRoutab();
		lRoutab.setDest("192.168.0.1");
		lRoutab.setCost(1);
		lRoutab.setInter("G0/1");
		lRoutab.setNexthop("192.168.0.1");
		lRoutab.setPre(0);
		lRoutab.setSwitype(1);
		lRoutab.setRby2("24");
		lRouTabService.insertSelective(lRoutab);
		
		LRoutab lRoutab1=new LRoutab();
		lRoutab1.setDest("192.168.0.9");
		lRoutab1.setCost(2);
		lRoutab1.setInter("G0/2");
		lRoutab1.setNexthop("192.168.1.0");
		lRoutab1.setPre(0);
		lRoutab1.setSwitype(1);
		lRoutab1.setRby2("24");
		lRouTabService.insertSelective(lRoutab1);
		
		
		try {
			
			
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println("已完成配置");
		    out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
