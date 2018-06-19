package com.buy.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buy.mapper.ProductMapper;
import com.buy.pojo.Product;
import com.buy.pojo.ProductExample;
import com.buy.pojo.ProductExample.Criteria;
import com.buy.service.ProductService;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper ;
	
	@Override
	public List<Product> getCagtegoryList(String categoryName, String sort,
			String orderBy) {
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		example.setOrderByClause("`"+sort+"`"+" "+orderBy);		
		criteria.andCategoryEqualTo(categoryName);
		List<Product> products = productMapper.selectByExample(example);
		return products;
	}

	@Override
	public List<Product> getProductsByKey(String keyword, String sort,
			String orderBy, String categoryBy, String priceBetween) {
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		if(priceBetween!=null&&priceBetween!=""){
			String[] priceArray = priceBetween.split("_");
			if(priceArray.length!=0){
				criteria.andPriceBetween(Integer.valueOf(priceArray[0])*100, Integer.valueOf(priceArray[1])*100);			
			}
		}
		if(categoryBy!=null&&categoryBy!="") {
			String[] categoryArray = categoryBy.split("_");
			if(categoryArray.length != 0){
				List<String> temp = Arrays.asList(categoryArray);
				criteria.andCategoryIn(temp);
			}
			
		}
		example.setOrderByClause("`"+sort+"`"+" "+orderBy);		
		criteria.andPnameLike("%"+keyword+"%");
		List<Product> products = productMapper.selectByExample(example);
		return products;
	}
	
	@Override
	public String getCategory(String pid) {
		String category = productMapper.selectByPrimaryKey(pid).getCategory();
		return category;
	}
	
	@Override
	public Product getProductInfo(String pid) {
		Product product = productMapper.selectByPrimaryKey(pid);
		return product;
	}

	@Override
	public List<Product> getProductRelative(String pid) {
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		//从同类商品种取出5个随机的商品进行推荐
		criteria.andCategoryEqualTo(getCategory(pid));
		example.setOrderByClause("RAND() LIMIT 5");
		criteria.andPidNotEqualTo(pid);
		List<Product> products = productMapper.selectByExample(example);
		return products;
	}

	@Override
	public List<Product> getProductRandom() {
		ProductExample example = new ProductExample();
		example.setOrderByClause("RAND() LIMIT 5");
		List<Product> products = productMapper.selectByExample(example);
		return products;
	}

	@Override
	public int updateProduct(Product product) {
		int result = productMapper.updateByPrimaryKeySelective(product);
		return result;
	}
	




}
