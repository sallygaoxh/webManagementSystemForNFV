package com.main.dao;

import java.util.List;

import com.main.model.LoPort;

public interface LoPortMapper {
  

	int deleteByPrimaryKey(Integer id);

    int insert(LoPort record);

    int insertSelective(LoPort record);

    LoPort selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoPort record);

    int updateByPrimaryKey(LoPort record);
    
    List<LoPort> selectAll();
}