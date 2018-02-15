package com.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.main.model.DataPath;

@Repository
public interface DpDao {
	List<DataPath> selectDp(int dpid);
	void insertDp(DataPath dp);
	List<DataPath> selectAll();
}
