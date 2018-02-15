package com.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.PortDao;
import com.main.model.Port;

@Service
public class PortService {
	@Resource
	PortDao portDao;
	
	public void insertPt(Port pt){
		
		System.out.println(pt.getPortid());
		if(portDao.selectPt(pt.getPortid())==null)
			portDao.insertPt(pt);
		
	}	
	
	public Port selectPort(int portid){
		return portDao.selectPt(portid);
	}
	
}
