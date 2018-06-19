package com.buy.service;

import java.util.List;

import com.buy.pojo.Cart;

public interface CartService {
	
	List<Cart> getCartByUid(String uid);
	List<Cart> getCartItemExist(String pid,String uid);
	int removeCartItem(String pid,String uid);
	int updateCartItem(String pid ,String uid,Integer number);
	int addCartItem(Cart cart);

}
