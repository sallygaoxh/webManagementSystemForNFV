package com.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.main.model.ONU;

@Repository
public interface ONUDao {
	
	List<ONU> selectVir(int vir_id);
	List<ONU> selectOLT(int olt_id);
	List<ONU> selectAll();
	int insertONU(ONU onu);
	int deleteById(int onu_id);
	List<Integer> findDistinct(String fdname);
	ONU selectById(int onu_id);
    int updateOnu(ONU onu);
	List<ONU> queryOnu(ONU onu);

	

}
