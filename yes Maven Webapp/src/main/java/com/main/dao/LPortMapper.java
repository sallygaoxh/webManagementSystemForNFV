package com.main.dao;

import java.util.List;

import com.main.model.LPort;

public interface LPortMapper {
    int deleteByPrimaryKey(String inter);

    int insert(LPort record);

    int insertSelective(LPort record);

    LPort selectByPrimaryKey(String inter);
    
    LPort selectByInterAndDpid(String inter,String dpid);
    
   // LPort updateByInterAndDpid(String inter,String dpid);

    int updateByPrimaryKeySelective(LPort record);

    int updateByPrimaryKey(LPort record);
    
    List<LPort> selectAll();
    
    List<String>  selectDistinct(String fdname);
}