package com.main.dao;

import java.util.List;

import com.main.model.LoVlan;

public interface LoVlanMapper {
 

	int deleteByPrimaryKey(Integer id);

    int insert(LoVlan record);

    int insertSelective(LoVlan record);

    LoVlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoVlan record);

    int updateByPrimaryKey(LoVlan record);
    
    List<LoVlan> selectAll();
}