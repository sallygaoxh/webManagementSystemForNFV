package com.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.OLTDao;
import com.main.dao.ONUDao;
import com.main.model.OLT;
import com.main.model.ONU;


@Service
public class OLTService {
	
	@Resource
	OLTDao oltDao;
	
	@Resource
	ONUDao onuDao;
	
	public void insertOlt(OLT olt){
			
		oltDao.insertOlt(olt);
		for(ONU a:olt.getOnus()){
			onuDao.insertONU(a);
		}
		
	}

}
