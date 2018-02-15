package com.main.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.model.LPort;
import com.main.model.LVlan;
import com.main.model.ONU;
import com.main.service.LPortService;
import com.main.service.LVlanService;
import com.main.service.ONUService;

@Controller
@RequestMapping("/TuopuShow")
public class TuopuController {
	@Resource
	ONUService onuService;
	@Resource
	LVlanService lVlanService;
	@Resource
	LPortService lPortService;
	
	
	
	@RequestMapping("/getPage.do")
	public String getPage(HttpServletRequest request){
		HttpSession session=request.getSession();
		List<String> distinct_vlan=lPortService.selectDistinct("vlCy");
		//System.out.println("distinct:"+distinct_vlan);
		List<Integer> distinct_vlan_int = new ArrayList<Integer>();
		for(int i=0;i<distinct_vlan.size();i++){
			String change=distinct_vlan.get(i);
			int index=change.indexOf('[');
			distinct_vlan_int.add( Integer.parseInt(String.valueOf(change.charAt(index+1))));
		}
		//System.out.println("distinct_vlan_int:"+distinct_vlan_int);
		ArrayList<ArrayList<LPort>> listall = new ArrayList<ArrayList<LPort>>();
		List<LPort> ori_ports = lPortService.selectAll();
		for (int i:distinct_vlan_int){
			ArrayList<LPort> add=new ArrayList<LPort>();
			for(LPort port:ori_ports){
			  if(i==port.getVlans().get(0))
				  add.add(port);
			}
			listall.add(add);
		}
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(listall);
		System.out.println(jsonArray1.toString());
		session.setAttribute("ports", jsonArray1.toString());
		/*List<LVlan> vlans =lVlanService.selectAll();
		//System.out.println("In getPage.do ,select All()"+vlans);
		List<LPort> ori_ports = lPortService.selectAll();
		//System.out.println("In getPage.do ,select All()"+ports);
		ArrayList<ArrayList<LPort>> listall = new ArrayList<ArrayList<LPort>>();
		for(LVlan a:vlans){
			ArrayList<LPort> port_vlan=new ArrayList<LPort>();
			List<String> portS=a.getPorts();
			for(String iter:portS){
				for(LPort port:ori_ports){
					if(port.getInter().equals(iter)&&port.getPby1().equals(a.getVby1()))
						port_vlan.add(port);
				}
			}
			System.out.println("1cide:  "+port_vlan);
			listall.add(port_vlan);
			
		}
		
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(listall);
		System.out.println(jsonArray1.toString());
		session.setAttribute("ports", jsonArray1.toString());*/
		
		//session.setAttribute("vlans", vlans);
		
	
		return "/tuopu3";
	}
	
	@RequestMapping("/showall.do")
	public @ResponseBody ArrayList<ArrayList<ONU>> showAll(Integer userId){
		List<ONU> all=onuService.selectAll();
		System.out.println(all);
		net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray.fromObject(all);
		System.out.println(jsonArray.toString());
		List<Integer> dis=onuService.findDistinct("olt_id");
		ArrayList<ArrayList<ONU>> listall = new ArrayList<ArrayList<ONU>>();
		
		for (int i:dis){
			ArrayList<ONU> add=new ArrayList<ONU>();
			for(ONU aa:all){
			  if(i==aa.getOlt_id())
				  add.add(aa);
			}
			listall.add(add);
		}
		
		net.sf.json.JSONArray jsonArray1 = net.sf.json.JSONArray.fromObject(listall);
		System.out.println(jsonArray1.toString());
		
		return listall;
		
	}
	
	@RequestMapping("/showvir.do")
	public @ResponseBody List<ONU> showVir(Integer virId){
		System.out.println(virId);
		List<ONU> all=onuService.selectVir(virId);
		System.out.println(all);
		net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray.fromObject(all);
		System.out.println(jsonArray.toString());
		
		return all;
	}
	
	@RequestMapping("/deleteById.do")
	public void deleteById(Integer Id,HttpServletResponse response){
		System.out.println(Id);
		onuService.deleteById(Id);
		try {
			// 响应
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println("删除成功");
		    out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	@RequestMapping("/insertONU.do")
	public void insert(String onuName,Integer oltId,Integer vir_Id,HttpServletResponse response){
		
		
		try {
			// 响应
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println("添加成功");
		    out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ONU onu=new ONU();
		onu.setName(onuName);
		onu.setOltid(oltId);
		if(oltId==1){
			onu.setOltName("olta");
		}else if(oltId==2){
			onu.setOltName("oltb");
		}else{
			onu.setOltName("oltc");
		}
		
		onu.setVirid(virId);
		
		if(virId==1){
			onu.setVirName("virtele1");
		}else if(virId==2){
			onu.setVirName("virtele2");
		}else{
			onu.setVirName("virtele3");
		}
		
		onuService.insertONU(onu);
		
		}
		*/
}
