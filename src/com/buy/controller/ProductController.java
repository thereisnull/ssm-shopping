package com.buy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.buy.pojo.Comment;
import com.buy.pojo.Product;
import com.buy.service.CommentService;
import com.buy.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		List<Product> productTop = productService.getProductRandom();
		mv.addObject("productTop", productTop);
		List<Product> productSpe = productService.getProductRandom();
		mv.addObject("productSpe", productSpe);
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(value="/")
	public ModelAndView defaultIndex(){
		
		return  index();
	}
	/**
	 * 按分类取出商品信息 并分页
	 * categoryName:分类名
	 * sort：排序条件
	 * orderAttr：排序方式，desc ，asc
	 * page:第几页
	 * @return ModelAndView 
	 */
	@RequestMapping(value="/category")
	public ModelAndView productList(@RequestParam(value="categoryName",defaultValue="休闲零食")String name,
			@RequestParam(value="sort",defaultValue="price")String sort,
			@RequestParam(value="orderAttr",defaultValue="ASC") String orderBy,
			@RequestParam(value="page",defaultValue="1")Integer page){
		
		ModelAndView mv = new ModelAndView();
		List<Product> list;
		List<Product> products = productService.getCagtegoryList(name,sort,orderBy);
		
		//分页，十条每页
		if((page-1)*10 +1 <= products.size()){
			int end = products.size()>=10*page?10*page:products.size();			
			list = products.subList((page-1)*10, end);
		}else{
			list=products;
		}					
		mv.addObject("productList", list);
		mv.addObject("currentUrl", name);
		mv.addObject("currentPage", page);
		mv.addObject("totalPage", (int)(products.size()/11+1));
		mv.addObject("sort", sort);
		mv.addObject("orderAttr", orderBy);
		mv.setViewName("category");		
		return mv;
	}
	/**
	 * 按照条件和关键字搜索对应的产品信息并进行分页
	 * @param key 搜索关键字
	 * @param sort 排序字段
	 * @param orderBy 排序方式，desc ，asc
	 * @param page 页码数
	 * @param categoryBy 按什么分类  标准输入:休闲零食_水果  
	 * @param priceBetween 价格区间
	 * @return
	 */
	@RequestMapping(value="/search",produces="text/html;charset=UTF-8")
	public ModelAndView search(@RequestParam("kw")String key,
			@RequestParam(value="sort",defaultValue="price")String sort,
			@RequestParam(value="orderAttr",defaultValue="ASC") String orderBy,
			@RequestParam(value="page",defaultValue="1")Integer page,
			@RequestParam(value="categoryArray",required=false)String categoryBy,
			@RequestParam(value="priceArray",required=false)String priceBetween){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search");	
		/*如果查询条件为空，重定向首页*/
		if(StringUtils.isEmpty(key)){			
			mv.setViewName("redirect:index");
		}
		List<Product> list;
		List<Product> products = productService.getProductsByKey(key, sort, orderBy, categoryBy, priceBetween);

		//分页，9条每页
		if((page-1)*9 +1 <= products.size()){
			int end = products.size()>=9*page?9*page:products.size();			
			list = products.subList((page-1)*9, end);
		}else{
			list=products;
		}
		//填充数据
		mv.addObject("productList", list);
		mv.addObject("currentUrl", "search");
		mv.addObject("currentPage", page);
		mv.addObject("totalPage", (int)(products.size()/11+1));
		mv.addObject("sort", sort);
		mv.addObject("orderAttr", orderBy);
		//回填筛选条件
		if(!StringUtils.isEmpty(categoryBy))
			mv.addObject("categoryArray", categoryBy);
		if(!StringUtils.isEmpty(priceBetween))
			mv.addObject("priceArray", priceBetween.replace("_", " - ￥"));
		if(priceBetween!=null&&priceBetween!=""){
			String[] priceArray = priceBetween.split("_");
			if(priceArray.length!=0){
				mv.addObject("sp", priceArray[0]);	
				mv.addObject("ep", priceArray[1]);	
			}
		}
		if(categoryBy!=null&&categoryBy!="") {
			String[] categoryArray = categoryBy.split("_");
			if(categoryArray.length != 0){
				for(int i =0 ;i<categoryArray.length;i++){
					switch (categoryArray[i]) {
						case "休闲零食":
							mv.addObject("xxls", 1);
							break;
						case "饼干糕点":
							mv.addObject("bggd", 1);
							break;
						case "茶水饮料":
							mv.addObject("csyl", 1);
							break;
						case "生鲜果蔬":
							mv.addObject("sxgs", 1);
							break;
						default:
							break;
						}
				}
			}
			
		}
		
		return mv;
	}
	/***
	 * 根据产品id去取出信息
	 * @param pid 产品id 
	 * @return
	 */
	@RequestMapping(value="/product")
	public ModelAndView detail(@RequestParam(value="pid",required=false)String pid){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("details");	
		Product productInfo = productService.getProductInfo(pid);
		List<Product> relative = productService.getProductRelative(pid);
		List<Comment> comments = commentService.getCommentByPid(pid);
		mv.addObject("productInfo", productInfo);
		mv.addObject("comments", comments);
		mv.addObject("relative", relative);
		return mv;
	}
}
