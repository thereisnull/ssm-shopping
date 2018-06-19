package com.buy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buy.mapper.UserMapper;
import com.buy.pojo.User;
import com.buy.pojo.UserExample;
import com.buy.pojo.UserExample.Criteria;
import com.buy.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User getUser(String username) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> user = userMapper.selectByExample(example);
		if(user.size()==0)
			return null;
		return user.get(0);
	}

	@Override
	public int register(User user) {
		int result = userMapper.insert(user);
		return result;
	}

}
