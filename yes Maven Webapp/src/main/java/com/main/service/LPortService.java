package com.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.main.dao.LPortMapper;
import com.main.model.LPort;

@Service
public class LPortService {
	@Resource
	LPortMapper lPortMapper;
	
	 public List<LPort> selectAll(){
		 return lPortMapper.selectAll();
	 }
	 
	 public int insertSelective(LPort record){
		 if(record.getBw()==null)
			 record.setBw(-1);
		 if(record.getDelay()==null)
			 record.setDelay(-1);
		 if(record.getInerrors()==null)
			 record.setInerrors(-1L);
		 if(record.getInter()==null)
			 record.setInter("def");
		 if(record.getInuti()==null)
			 record.setInuti("def");
		 if(record.getIpadd()==null)
			 record.setIpadd("def");
		 if(record.getMethod()==null)
			 record.setMethod(-1);
		 if(record.getOuterrors()==null)
			 record.setOuterrors(-1l);
		 if(record.getOututi()==null)
			 record.setOututi("def");
		 if(record.getPby1()==null)
			 record.setPby1("def");
		 if(record.getPby2()==null)
			 record.setPby2("def");
		 if(record.getPby3()==null)
			 record.setPby3(-1);
		 if(record.getPby4()==null)
			 record.setPby4(-1);
		 if(record.getProl()==null)
			 record.setProl("def");
		 if(record.getStatus()==null)
			 record.setStatus(-1);
		 if(record.getSwitype()==null)
			 record.setSwitype(-1);
		 if(record.getTbcy()==null){
			 List<String> ine=new ArrayList<String>();
			 ine.add("def");
			 record.setTbcy(JSONArray.fromObject(ine).toString());
		 }
		 if(record.getValid()==null)
			 record.setValid(-1);
		 if(record.getVir()==null)
			 record.setVir(-1);
		 if(record.getVlcy()==null){
			 List<Integer> in=new ArrayList<Integer>();
		 	in.add(1);
		 	record.setVlcy(JSONArray.fromObject(in).toString());
		  }
			 
		 return lPortMapper.insertSelective(record);
	 }
	 
	 int updateByPrimaryKeySelective(LPort record){
		 if(record.getBw()==null)
			 record.setBw(-1);
		 if(record.getDelay()==null)
			 record.setDelay(-1);
		 if(record.getInerrors()==null)
			 record.setInerrors(-1L);
		 if(record.getInter()==null)
			 record.setInter("def");
		 if(record.getInuti()==null)
			 record.setInuti("def");
		 if(record.getIpadd()==null)
			 record.setIpadd("def");
		 if(record.getMethod()==null)
			 record.setMethod(-1);
		 if(record.getOuterrors()==null)
			 record.setOuterrors(-1l);
		 if(record.getOututi()==null)
			 record.setOututi("def");
		 if(record.getPby1()==null)
			 record.setPby1("def");
		 if(record.getPby2()==null)
			 record.setPby2("def");
		 if(record.getPby3()==null)
			 record.setPby3(-1);
		 if(record.getPby4()==null)
			 record.setPby4(-1);
		 if(record.getProl()==null)
			 record.setProl("def");
		 if(record.getStatus()==null)
			 record.setStatus(-1);
		 if(record.getSwitype()==null)
			 record.setSwitype(-1);
		 if(record.getTbcy()==null){
			 List<String> ine=new ArrayList<String>();
			 ine.add("def");
			 record.setTbcy(JSONArray.fromObject(ine).toString());
		 }
		 if(record.getValid()==null)
			 record.setValid(-1);
		 if(record.getVir()==null)
			 record.setVir(-1);
		 if(record.getVlcy()==null){
			 List<Integer> in=new ArrayList<Integer>();
		 	in.add(1);
		 	record.setVlcy(JSONArray.fromObject(in).toString());
		  }
		 
		 
		 return lPortMapper.updateByPrimaryKeySelective(record);
		 
	 }
	 
	 public int upDatePortVlan(String inter,int vlanid,String dpid){
		
		 LPort port=lPortMapper.selectByInterAndDpid(inter, dpid);
		 List<Integer> vlans=port.getVlans();
		 vlans.clear();
		 vlans.add(vlanid);
		 port.setVlans(vlans);
		 int succ=lPortMapper.updateByPrimaryKeySelective(port);
		 
		 return succ;
		 
	 }
	 public LPort selectByPrimaryKey(String inter){
		 return lPortMapper.selectByPrimaryKey(inter);
	 }
	 
	 public LPort selectByInterAndDpid(String inter,String dpid){
		 return lPortMapper.selectByInterAndDpid(inter, dpid);
	 }
	 
	 public List<String> selectDistinct(String fdname){
		return lPortMapper.selectDistinct(fdname);
		 
	 }
	
	
}
