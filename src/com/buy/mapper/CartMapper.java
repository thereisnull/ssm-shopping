package com.buy.mapper;

import java.util.List;

import com.buy.pojo.Cart;

public interface CartMapper {
	
	List<Cart> selectCartByUid(String uid);
	List<Cart> selectCartItemExist(String pid,String uid);
	int deleteCartItem(String pid,String uid);
	int updateCartItem(String pid ,String uid,Integer number);
	int insertCartItem(Cart cart);

}
