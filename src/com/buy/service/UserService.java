package com.buy.service;


import com.buy.pojo.User;

public interface UserService {
	User getUser(String username);
	int register(User user);
}
