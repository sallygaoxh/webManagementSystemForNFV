package com.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.main.model.TestPort;

@Repository
public interface TestPortMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TestPort record);

    int insertSelective(TestPort record);

    TestPort selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TestPort record);

    int updateByPrimaryKey(TestPort record);
    
    List<TestPort> select();
}