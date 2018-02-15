package com.main.dao;

import java.util.List;

import com.main.model.LVlan;

public interface LVlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LVlan record);

    int insertSelective(LVlan record);

    LVlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LVlan record);

    int updateByPrimaryKey(LVlan record);
    
    List<LVlan> selectAll();
}