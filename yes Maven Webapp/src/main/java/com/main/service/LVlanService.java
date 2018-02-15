package com.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.main.dao.LPortMapper;
import com.main.dao.LVlanMapper;
import com.main.model.LPort;
import com.main.model.LVlan;

@Service
public class LVlanService {
	@Resource
	LVlanMapper lVlanMapper;
	@Resource
	LPortMapper lportMapper;
	
	
	public List<LVlan> selectAll(){
		return lVlanMapper.selectAll();		
	}
	
	public int insertSelective(LVlan record){
		//这句去掉
		if(record.getId()==null)
			record.setId(-1);
		if(record.getName()==null)
			record.setName("def");
		if(record.getSwitype()==null)
			record.setSwitype(-1);
		if(record.getVby1()==null)
			record.setVby1("def");
		if(record.getVby2()==null)
			record.setVby2("def");
		if(record.getVby3()==null)
			record.setVby3(-1);
		if(record.getVby4()==null)
			record.setVby4(-1);
		if(record.getPorts()!=null){
			LPort newPort;
			List<String> ports=record.getPorts();
			for(String port:ports){				
				//System.out.println(lportMapper.selectByPrimaryKey(port));
				if((newPort=lportMapper.selectByInterAndDpid(port,record.getVby1()))!=null){
					List<Integer> vlans= newPort.getVlans();
					vlans.clear();
					vlans.add(record.getId());
					newPort.setVlans(vlans);
					lportMapper.updateByPrimaryKeySelective(newPort);
					/*if(!vlans.contains(record.getId())){
						vlans.add(record.getId());
						newPort.setVlans(vlans);
						//newPort.setVlcy(JSONArray.fromObject(vlans).toString());
						System.out.println(vlans);
						int a=lportMapper.updateByPrimaryKeySelective(newPort);
						System.out.println(a);
					}*/
				}
			}
		}
		if(record.getPtcy()==null){
			List<Integer> in =new ArrayList<Integer>();
			in.add(-1);
			record.setPtcy(JSONArray.fromObject(in).toString());		
		}
			
		
		return lVlanMapper.insertSelective(record);
	}
	
	public int updateByPrimaryKeySelective(LVlan record){
		if(record.getId()==null)
			record.setId(-1);
		if(record.getName()==null)
			record.setName("def");
		if(record.getSwitype()==null)
			record.setSwitype(-1);
		if(record.getVby1()==null)
			record.setVby1("def");
		if(record.getVby2()==null)
			record.setVby2("def");
		if(record.getVby3()==null)
			record.setVby3(-1);
		if(record.getVby4()==null)
			record.setVby4(-1);
		if(record.getPorts()!=null){
			LPort newPort;
			List<String> ports=record.getPorts();
			for(String port:ports){				
				//System.out.println(lportMapper.selectByPrimaryKey(port));
				if((newPort=lportMapper.selectByInterAndDpid(port,record.getVby1()))!=null){
					List<Integer> vlans= newPort.getVlans();
					vlans.clear();
					vlans.add(record.getId());
					newPort.setVlans(vlans);
					lportMapper.updateByPrimaryKeySelective(newPort);
				/*	if(!vlans.contains(record.getId())){
						vlans.add(record.getId());
						newPort.setVlans(vlans);
						//newPort.setVlcy(JSONArray.fromObject(vlans).toString());
						System.out.println(vlans);
						int a=lportMapper.updateByPrimaryKeySelective(newPort);
						System.out.println(a);
					}*/
				}
			}
		}
		if(record.getPtcy()==null){
			List<Integer> in =new ArrayList<Integer>();
			in.add(-1);
			record.setPtcy(JSONArray.fromObject(in).toString());		
		}
		return lVlanMapper.updateByPrimaryKeySelective(record);
	}
	
	public int updateByPrimaryKey(LVlan record){
		if(record.getId()==null)
			record.setId(-1);
		if(record.getName()==null)
			record.setName("def");
		if(record.getSwitype()==null)
			record.setSwitype(-1);
		if(record.getVby1()==null)
			record.setVby1("def");
		if(record.getVby2()==null)
			record.setVby2("def");
		if(record.getVby3()==null)
			record.setVby3(-1);
		if(record.getVby4()==null)
			record.setVby4(-1);
		if(record.getPtcy()==null){
			List<Integer> in =new ArrayList<Integer>();
			in.add(-1);
			record.setPtcy(JSONArray.fromObject(in).toString());		
		}
		
		return lVlanMapper.updateByPrimaryKey(record);		
	}
	
	public LVlan selectByPrimaryKey(Integer id){
		return lVlanMapper.selectByPrimaryKey(id);
	}
}
