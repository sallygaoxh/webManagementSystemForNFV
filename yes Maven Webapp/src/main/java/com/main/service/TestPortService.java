package com.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.TestPortMapper;
import com.main.model.TestPort;

@Service
public class TestPortService {
	
	@Resource
	TestPortMapper testPortMapper;
	public int insert(TestPort record) {
		if(record.getName()== null || record.getName()== ""){
			record.setName("defName");
		}
		if(record.getBw()== null ){
			record.setBw(1000);
		}
		if(record.getDelay()== null ){
			record.setDelay(1000);
		}
		if(record.getStatus()== null ){
			record.setStatus(true);
		}
		if(record.getType()== null|| record.getName()== "" ){
			record.setType("defType");
		}
		if(record.getInter()== null|| record.getInter()== "" ){
			record.setInter("f0/0");
		}
		if(record.getStatus()== null ){
			record.setStatus(true);
		}
		if(record.getVir()== null ){
			record.setVir(0);
		}
		if(record.getVlanid()== null ){
			record.setVlanid(0);
		}

		return testPortMapper.insertSelective(record);
	}
	
	
	public TestPort selectByPrimaryKey(Integer id) {
		return testPortMapper.selectByPrimaryKey(id);
	}
	
	public List<TestPort> select(){
		return testPortMapper.select();
	}

}
