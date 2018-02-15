package com.login.service.impl;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.login.dao.IUserDao;
import com.login.model.User;
import com.login.service.IUserService;


@Service("userServiceImpl")
public class UserServiceImpl implements IUserService{

	@Autowired
	private IUserDao iusd;

	@Override
	public User user(User us) {
		Map<String, Object> paras = new HashMap<String, Object>();
		paras.put(iusd.KEY_PO, us);
		return iusd.user(paras);
	}

	public List<User> selectAllAdmin() {
		return iusd.selectAllAdmin();
	}

	/* (non-Javadoc)
	 * @see com.login.service.IUserService#selectAll()
	 */
	
	

	}
	
