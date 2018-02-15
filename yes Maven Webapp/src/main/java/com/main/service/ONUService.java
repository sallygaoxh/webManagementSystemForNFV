package com.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.ONUDao;

import com.main.model.ONU;

@Service
public class ONUService {

	@Resource
	ONUDao ONUDao;
	
	public List<ONU> selectAll(){
		return  ONUDao.selectAll();
	}
	
	public List<ONU> selectOLT(int olt_id){
		return  ONUDao.selectOLT(olt_id);
	}
	
	public List<ONU> selectVir(int vir_id){
		return  ONUDao.selectVir(vir_id);
	}
	
	public int insertONU(ONU onu){
		return ONUDao.insertONU(onu);
	}
	
	public int deleteById(int onu_id){
		return ONUDao.deleteById(onu_id);
     }
	
	public List<Integer> findDistinct(String fdname){
	      return ONUDao.findDistinct(fdname);
     }
	
	public ONU selectById(int onu_id){
		return ONUDao.selectById(onu_id);
	}

	public int updateOnu(ONU onu) {
		return ONUDao.updateOnu(onu);
	}

	public List<ONU> queryOnu(ONU onu) {
		// TODO Auto-generated method stub
		return ONUDao.queryOnu(onu);
	}
}
