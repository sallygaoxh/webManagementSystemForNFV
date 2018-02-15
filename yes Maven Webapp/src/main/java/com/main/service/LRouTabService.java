package com.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.LRoutabMapper;
import com.main.model.LRoutab;

@Service
public class LRouTabService {
	@Resource
	LRoutabMapper lRouTabMapper;
	
	public List<LRoutab> selectAll(){
		 return lRouTabMapper.selectAll();
	 }
	 
	 public int insertSelective(LRoutab record){
		 if(record.getCost()==null)
			 record.setCost(-1);
		 if(record.getDest()==null)
			 record.setDest("def");
		 if(record.getInter()==null)
			 record.setInter("def");
		 if(record.getNexthop()==null)
			 record.setNexthop("def");
		 if(record.getPre()==null)
			 record.setPre(-1);
		 if(record.getRby1()==null)
			 record.setRby1("def");
		 if(record.getRby2()==null)
			 record.setRby2("def");
		 if(record.getRby3()==null)
			 record.setRby3(-1);
		 if(record.getRby4()==null)
			 record.setRby4(-1);
		 if(record.getSwitype()==null)
			 record.setSwitype(-1);	 			
		 return lRouTabMapper.insertSelective(record);
	 }
	 
	 public LRoutab selectByPrimaryKey(String dest){
		 return lRouTabMapper.selectByPrimaryKey(dest);
	 }
	 
	 public int updateByPrimaryKeySelective(LRoutab record){
		return lRouTabMapper.updateByPrimaryKeySelective(record);
		 
	 }
}
