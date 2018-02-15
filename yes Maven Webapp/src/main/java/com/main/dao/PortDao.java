package com.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.main.model.Port;

@Repository
public interface PortDao {
	
	void insertPt(Port pt);
	public Port selectPt(int portid);
}
