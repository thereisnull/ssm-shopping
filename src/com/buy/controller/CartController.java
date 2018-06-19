package com.buy.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.buy.pojo.Cart;
import com.buy.pojo.NormalResult;
import com.buy.pojo.Product;
import com.buy.pojo.User;
import com.buy.service.CartService;
import com.buy.service.ProductService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	@RequestMapping(value="/addCart",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult addCart(@RequestParam("pid")String pid,
			@RequestParam(value="number",defaultValue="1")Integer number,HttpServletRequest request) {
		User activeUser = (User) request.getSession().getAttribute("ActiveUser");
		if(activeUser==null){
			return NormalResult.Error("登录后才能添加购物车!");
		}
		List<Cart> exist = cartService.getCartItemExist(pid, activeUser.getUid());
		//如果原来存在 +1
		if(exist.size()>0){
			cartService.updateCartItem(pid, activeUser.getUid(), exist.get(0).getNumber()+number);
			return NormalResult.OK("添加到购物车成功! 数量+"+number);
		}
		Cart cart = new Cart();
		cart.setCid(UUID.randomUUID().toString().replace("-", ""));
		if(number==null)
			number=1;
		cart.setNumber(number);
		cart.setPid(pid);
		cart.setUid(activeUser.getUid());
		int result = cartService.addCartItem(cart);
		if(result>0){
			return NormalResult.OK("添加到购物车成功!");
		}
		return NormalResult.Error("添加到购物车失败!");
		
		
	}
	@RequestMapping(value="/cart")
	public ModelAndView cart(HttpServletRequest request){
		User activeUser = (User) request.getSession().getAttribute("ActiveUser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
//		if(activeUser==null){
//			mv.setViewName("redirect:login");
//			return mv;
//		}
		List<Cart> carts = cartService.getCartByUid(activeUser.getUid());
		mv.addObject("cartList", carts);
		return mv;
	}
	
	@RequestMapping(value="/removeCart",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult remove(@RequestParam("pid")String pid,HttpServletRequest request){
		User activeUser = (User) request.getSession().getAttribute("ActiveUser");
		if(activeUser==null){
			return NormalResult.Error("登录状态异常或未登录");
		}
		int result = cartService.removeCartItem(pid, activeUser.getUid());
		if(result>0){
			return NormalResult.OK("删除成功!");
		}
		return NormalResult.Error("删除失败!");
	}
	@RequestMapping(value="/editCart",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult edit(@RequestParam("pid") String pid,
			@RequestParam("number")Integer number,
			HttpServletRequest request){
		User activeUser = (User) request.getSession().getAttribute("ActiveUser");
		if(activeUser==null){
			return NormalResult.Error("先登录");
		}

		Product productInfo = productService.getProductInfo(pid);
		if(productInfo.getSku()< number){
			
			return NormalResult.Error("购买的数量超出库存");
		}else{
			System.out.println(productInfo.getSales()+":"+number);
		}
		int result = cartService.updateCartItem(pid, activeUser.getUid(), number);
		if(result>0){
			return NormalResult.OK("编辑成功");
		}
		return NormalResult.Error("编辑失败");
	}

}
