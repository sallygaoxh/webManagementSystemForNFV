package com.main.dao;

import java.util.List;

import com.main.model.LRoutab;

public interface LRoutabMapper {
    int deleteByPrimaryKey(String dest);

    int insert(LRoutab record);

    int insertSelective(LRoutab record);

    LRoutab selectByPrimaryKey(String dest);

    int updateByPrimaryKeySelective(LRoutab record);

    int updateByPrimaryKey(LRoutab record);
    
    List<LRoutab> selectAll();
}