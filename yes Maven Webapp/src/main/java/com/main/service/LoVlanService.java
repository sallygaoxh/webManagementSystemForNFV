package com.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.LoPortMapper;
import com.main.dao.LoVlanMapper;
import com.main.model.LoVlan;



@Service
public class LoVlanService {
	
@Resource
LoVlanMapper loVlanMapper;
@Resource 
LoPortMapper loPortMapper;
	
	public int insertSelective(LoVlan record){
		return loVlanMapper.insertSelective(record);	
	}

	List<LoVlan> selectAll() {
		return loVlanMapper.selectAll();
	}
	
	public int updateByPrimaryKeySelective(LoVlan record){
		return loVlanMapper.updateByPrimaryKeySelective(record);
	}
	
	
}
