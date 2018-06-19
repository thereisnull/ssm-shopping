package com.buy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buy.mapper.CartMapper;
import com.buy.pojo.Cart;
import com.buy.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Autowired 
	private CartMapper cartMapper;
	@Override
	public List<Cart> getCartByUid(String uid) {
		List<Cart> carts = cartMapper.selectCartByUid(uid);
		return carts;
	}

	@Override
	public int removeCartItem(String pid, String uid) {
		int result = cartMapper.deleteCartItem(pid, uid);
		return result;
	}

	@Override
	public int updateCartItem(String pid, String uid, Integer number) {
		int result = cartMapper.updateCartItem(pid, uid, number);
		return result;
	}

	@Override
	public int addCartItem(Cart cart) {
		int result = cartMapper.insertCartItem(cart);
		return result;
	}

	@Override
	public List<Cart> getCartItemExist(String pid,String uid) {
		List<Cart> selectCartItemExist = cartMapper.selectCartItemExist( pid, uid);
		
		return selectCartItemExist;
	}



}
