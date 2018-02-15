package com.main.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.login.model.User;
import com.login.service.IUserService;
import com.main.model.LPort;
import com.main.model.LRoutab;
import com.main.service.HttpService;
import com.main.service.LPortService;
import com.main.service.LRouTabService;
import com.main.service.SythesisService;



@Controller
@RequestMapping("/Database")
public class DataBaseAccessController {
	@Resource
	LPortService lPortService;
	@Resource
	SythesisService sythesisService;
	@Resource(name="userServiceImpl")
	private IUserService userservice;
	@Resource
	LRouTabService lRouTabService;
	@Resource
	HttpService httpService;
	
	
	@RequestMapping("/ConfigPort.do")
	public void configPort( int vlanChecked,@RequestParam("checkedValue1[]") List<String> checkedValue1
			,@RequestParam("checkedValue2[]") List<String> checkedValue2,
			HttpServletResponse response){
		System.out.println(""+checkedValue1);
		System.out.println(""+checkedValue2); 
		System.out.println(""+vlanChecked); 
		if(checkedValue1.get(0).equals("s"))
			checkedValue1.clear();
		if(checkedValue2.get(0).equals("s"))
			checkedValue2.clear();
		/*int succ=1;*/
		//两个dpid写死 
		for(String inter:checkedValue1){
			lPortService.upDatePortVlan(inter, vlanChecked,"20015998343868");
		}
		for(String inter:checkedValue2){
			lPortService.upDatePortVlan(inter, vlanChecked,"167633986132668");
		}
		//sythesisService.SysVlanByPort();
		/*String feedBack;
		if(succ==1)
			feedBack="添加成功";
		else
			feedBack="添加失败";*/
			
		
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
		
		for(int i=0;i<checkedValue1.size();i++){
			if(i==0){
			String command ="20015998343868"+"\n"+
					"vlan data\n" +
					"vlan "+vlanChecked+"\n"+
					"exit\n"+
					"conf t\n"+
					"interface "+checkedValue1.get(i)+"\n"+
					"switchport mode access" +"\n"+
					"switchport access vlan "+vlanChecked+"\n"+
					"exit\n";
			httpService.manulSetport(command);
			}
			else{
				String command ="20015998343868"+"\n"+
						"interface "+checkedValue1.get(i)+"\n"+
						"switchport mode access" +"\n"+
						"switchport access vlan "+vlanChecked+"\n"+
						"exit\n";
				httpService.manulSetport(command);
			}			
			
		}
		if(checkedValue1.size()!=0)
		httpService.manulSetport("20015998343868"+"\n"+
				"exit\nexit\nen\nen\n");	
		
		for(int i=0;i<checkedValue2.size();i++){
			if(i==0){
			String command ="167633986132668"+"\n"+
				"vlan data\n" +
				"vlan "+vlanChecked+"\n"+
				"exit\n"+
				"conf t\n"+
				"interface "+checkedValue2.get(i)+"\n"+
				"switchport mode access" +"\n"+
				"switchport access vlan "+vlanChecked+"\n"+
				"exit\n";
			httpService.manulSetport(command);
			}
			else{
				String command ="167633986132668"+"\n"+
						"interface "+checkedValue2.get(i)+"\n"+
						"switchport mode access" +"\n"+
						"switchport access vlan "+vlanChecked+"\n"+
						"exit\n";
					httpService.manulSetport(command);
			}
				
			}
			
		if(checkedValue2.size()!=0)
			httpService.manulSetport("167633986132668"+"\n"+
					"exit\nexit\nen\nen\n");	
		 
		
		//你在这加 然后调用 HttpService。manualset(STRING);
	}
	
	@RequestMapping("/getAllAdmin.do")
	public String getAllAdmin(HttpServletRequest request){
		List<User> user=userservice.selectAllAdmin();
		request.setAttribute("AdminUser", user);
		System.out.println(user);
		List<LPort> ports=lPortService.selectAll();
		request.setAttribute("idlport", ports);
		return "/vlan3";
	}
	
	@RequestMapping("/getRoutable.do")
	public String getRoutable(HttpServletRequest request){
		List<LRoutab> tables=lRouTabService.selectAll();
		request.setAttribute("tables",tables );
		System.out.println(tables);
		return "/route3";		
	}
	
	
	
	/*public String getTableShow(HttpServletRequest request){
		List<LPort> LPorts=lPortService.selectAll();
		request.setAttribute("LPorts", LPorts);
		return "/tableShow";
		
	}*/

}
