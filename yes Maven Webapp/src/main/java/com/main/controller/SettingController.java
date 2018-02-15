package com.main.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.login.model.User;
import com.main.service.AdminService;
import com.main.service.Http2JsonService;
import com.main.service.HttpService;
import com.main.service.OLTService;
import com.main.service.ONUService;
import com.main.service.DpService;
import com.main.service.PortService;
import com.main.model.ONU;


@Controller
@RequestMapping("/Setting")
public class SettingController {
	@Resource
	HttpService  httpService0;
		
		@RequestMapping("/manualSet.do")
		public String getSettingPage(){
			//httpService0.manulSet("getAll");	
			return "/setting3";
		}

		@RequestMapping("/autoSet.do")
		public String getSettingPage1(){
			//httpService0.manulSet("getAll");	
			return "/autoSetting";
		}
		
		@RequestMapping("/set1.do")
		public void set1(String interName,String vlanName, int vlanNum, HttpServletRequest request){
			System.out.println(""+interName+" "+vlanName+" "+vlanNum);
			//httpService0.setting(1,interName,vlanName,vlanNum);			
		}
		
		@RequestMapping("/send.do")
		public void set(HttpServletRequest request,HttpServletResponse response){
			String command= request.getParameter("message");
			System.out.println(""+command);
			httpService0.manulSet(command);	
			
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
