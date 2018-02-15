package com.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.main.model.OLT;

@Repository
public interface OLTDao {
	
	public List<OLT> selectOLT(int olt_id);
	public void insertOlt(OLT olt);
	
}
