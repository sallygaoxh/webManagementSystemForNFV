package com.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.LoPortMapper;
import com.main.model.LoPort;

@Service
public class LoPortService {
	
	@Resource
	LoPortMapper loPortMapper;

	public int insertSelective(LoPort record){
		return loPortMapper.insertSelective(record);	
	}

	List<LoPort> selectAll() {
		return loPortMapper.selectAll();
	}
	
	public int updateByPrimaryKeySelective(LoPort record){
		return loPortMapper.updateByPrimaryKeySelective(record);		
	}

}
