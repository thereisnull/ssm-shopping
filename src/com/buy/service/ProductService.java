package com.buy.service;

import java.util.List;

import com.buy.pojo.Product;

public interface ProductService {
	List<Product> getCagtegoryList(String categoryName,String sort,String orderBy);
	List<Product> getProductsByKey(String keyword,String sort,String orderBy,String categoryBy,String priceBetween);
	String getCategory(String pid);
	Product getProductInfo(String pid);
	List<Product> getProductRelative(String pid);
	List<Product> getProductRandom();
	int updateProduct(Product product);
}
