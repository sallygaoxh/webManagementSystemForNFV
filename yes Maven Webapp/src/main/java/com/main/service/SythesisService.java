package com.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.LVlanMapper;
import com.main.model.LPort;
import com.main.model.LVlan;
@Service
public class SythesisService {
	@Resource
	LVlanService lVlanService;
	@Resource
	LPortService lPortService;
	
	public void SysPortByVlan(){
		List<LPort> refPorts= lPortService.selectAll();
		List<LVlan> vlans=lVlanService.selectAll();
		
	}
	
	public void SysVlanByPort(){
		 List<LPort> refPorts= lPortService.selectAll();
		 List<LVlan> vlans=lVlanService.selectAll();
		 for(LVlan vlan:vlans){
			 List<String> clearP =vlan.getPorts();
			 clearP.clear();
			 vlan.setPorts(clearP);
			 int a=lVlanService.updateByPrimaryKey(vlan);
			 System.out.println("uodat"+a);
		 }
		 for(LPort refPort:refPorts){
			 for(LVlan vlan:vlans){
				 if(refPort.getVlans().get(0)==vlan.getId()){
					 List<String> iters= vlan.getPorts();
					 iters.add(refPort.getInter());
					 vlan.setPorts(iters);
					 lVlanService.updateByPrimaryKey(vlan);
				 }
					 
			 }
		 }
	}
}
