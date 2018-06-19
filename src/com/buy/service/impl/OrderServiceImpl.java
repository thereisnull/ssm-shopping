package com.buy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buy.mapper.OrderMapper;
import com.buy.pojo.Order;
import com.buy.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;
	@Override
	public int addOrder(Order order) {
		
		return orderMapper.insert(order);
	}
	
}
