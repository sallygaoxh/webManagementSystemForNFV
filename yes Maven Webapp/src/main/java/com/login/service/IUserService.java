package com.login.service;

import java.util.List;

import com.login.model.User;

public interface IUserService {

	User user(User us);
	List<User> selectAllAdmin();
	
}