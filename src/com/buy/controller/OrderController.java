package com.buy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.buy.pojo.NormalResult;
import com.buy.pojo.Order;
import com.buy.pojo.Product;
import com.buy.pojo.User;
import com.buy.service.CartService;
import com.buy.service.OrderService;
import com.buy.service.ProductService;

@Controller
public class OrderController {
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult addOrder(@RequestBody Order[] orders,HttpServletRequest request){
		HttpSession session = request.getSession();
		User activeUser = (User) session.getAttribute("ActiveUser");
		Integer should = 0;//应付
		Integer sum = 0;//实付
		Integer discount = 0;//优惠
		session.removeAttribute("should");
		session.removeAttribute("sum");
		session.removeAttribute("discount");
		session.removeAttribute("orderList");
		if(activeUser==null){
			return NormalResult.Error("先登录");
		}
		int count=0;
		String msg = "";
		List<Order> list = new ArrayList<Order>();
		for(Order order : orders){
			
			//前1000立减3元
			Product productInfo = productService.getProductInfo(order.getPid());
			if(productInfo.getSku()<order.getNumber()){
				msg+=(productInfo.getPname()+":订单提交失败，原因：库存不足；");
				count++;
				break;
				//库存不充足提交失败
			}
			if(productInfo.getSales()<1000){
				Integer temp = order.getMoney()-300;
				discount+=300;
				sum+=(temp*order.getNumber());
				order.setMoney(temp);

			}else{
				order.setMoney(productInfo.getPrice());
				sum+=(productInfo.getPrice()*order.getNumber());
			}
			
			
			order.setImg(productInfo.getImg1());
			order.setPname(productInfo.getPname());
			//减库存
			Product product = new Product();
			product.setPid(order.getPid());
			product.setSales(order.getNumber());
			product.setSku(order.getNumber());
			productService.updateProduct(product);
			//生成订单
			order.setOid(UUID.randomUUID().toString().replace("-", ""));
			order.setUid(activeUser.getUid());
			order.setTime(new Date());
			int result = orderService.addOrder(order);
			if(result<=0){
				count++;
				break;
			}
			list.add(order);
			//删除购物项
			cartService.removeCartItem(product.getPid(), activeUser.getUid());
		}
		//should=sum+discount;
		session.setAttribute("should", should);
		session.setAttribute("sum", sum);
		session.setAttribute("discount", discount);
		session.setAttribute("orderList", list);
		if(count==0){
			return NormalResult.OK("结算成功!");
		}else{
			return NormalResult.Error("共有 "+count+" 笔订单失败!"+msg);
		}
		
	}
	@RequestMapping("/getPayInfo")
	public String payInfo(){
		return "getPayInfo";
		
	}
}
