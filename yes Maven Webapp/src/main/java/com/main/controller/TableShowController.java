package com.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.model.LPort;
import com.main.model.ONU;
import com.main.service.LPortService;
import com.main.service.ONUService;

@Controller
@RequestMapping("/tableShow")
public class TableShowController {
	@Resource
	ONUService onuService;
	@Resource
	LPortService lPortService;
	
	
	@RequestMapping("/getTable.do")
	public String getTableShow(HttpServletRequest request){
		List<LPort> LPorts=lPortService.selectAll();
		request.setAttribute("LPorts", LPorts);
		return "/tableShow3";
		
	}
	
	@RequestMapping("/queryOnu.do")
	public String queryOnu(ONU onu,HttpServletRequest request){
		List<ONU> onushow=onuService.queryOnu(onu);
		request.setAttribute("onushow", onushow);
		return "/tableShow3";
		
	}
	
	@RequestMapping("/deleteById.do")
	public String deleteById(Integer Id, Model model){
		int sucss=0;
		
		try {
			sucss= onuService.deleteById(Id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (sucss>0) {
			model.addAttribute("info", "ONU信息删除成功");
		} else {
			model.addAttribute("info", "ONU信息删除失败");
		}
		return "/onuInfo";
	}
	
	@RequestMapping("/loadUpdate.do")
	public String loadUpdate(Integer Id, Model model){

		ONU onu = onuService.selectById(Id);
		model.addAttribute("onu", onu);
		
		return "/updateOnu";
	}
	
	
	@RequestMapping("/updateOnu.do")
	public String updateOnu(ONU onu, Model model){

		System.out.println("onu:" + onu.getOlt_id());
		System.out.println("onu:" + onu.getOnu_state());
		int succs = 0;
		try {
			succs = onuService.updateOnu(onu);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (succs>0) {
			model.addAttribute("info", "ONU信息修改成功");
		} else {
			model.addAttribute("info", "ONU信息修改失败");
		}

		return "/onuInfo";

	}
	
	@RequestMapping("/addOnu.do")
	public String addOnu(ONU onu, Model model){
		int succs = 0;
		try {
			succs = onuService.insertONU(onu);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (succs>0) {
			model.addAttribute("info", "ONU信息修改成功");
		} else {
			model.addAttribute("info", "ONU信息修改失败");
		}

		return "/onuInfo";

	}
	
	
}
