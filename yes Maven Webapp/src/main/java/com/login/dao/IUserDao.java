package com.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.login.model.User;


public interface IUserDao {
	
	static final String KEY_PO="us";

    User user(Map<String,Object> map);
    List<User> selectAllAdmin();
	
}
