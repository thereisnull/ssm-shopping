package com.buy.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.buy.pojo.NormalResult;
import com.buy.pojo.User;
import com.buy.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request){
		
		//删除登录信息
		request.getSession().removeAttribute("ActiveUser");
		request.getSession().invalidate();
		return "redirect:index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		System.out.println("来自："+request.getMethod());
		return "login";
	}
	
	
	@RequestMapping(value="/plogin",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult putlogin(@RequestParam("username")String username,
			@RequestParam("password") String password,HttpServletRequest request){
			User user = userService.getUser(username);
			if(user!=null && user.getPassword().equals(password)){
				NormalResult result = NormalResult.OK("登录成功!");
				request.getSession().setAttribute("isLogin", 1);
				request.getSession().setAttribute("ActiveUser", user);
				return result;
			}
		return NormalResult.Error("用户名或密码错误");
		
	}
	@RequestMapping(value="/register")
	public String register(){
		return "register";
	}
	@RequestMapping(value="/pregister",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult putRegister(User user){
		user.setUid(UUID.randomUUID().toString().replace("-", ""));
		user.setStatus(1);
		int result = 0;
		try {
			result = userService.register(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			
			return NormalResult.OK("注册成功!");
		}
		return NormalResult.Error("注册失败!");
	}
	
	@RequestMapping(value="/volidatename",method=RequestMethod.POST)
	@ResponseBody
	public NormalResult volidata(@RequestParam("username")String username){
		User user = userService.getUser(username);
		if(user == null){
			return NormalResult.OK("可以用");
		}
		return NormalResult.Error("已被使用");
		
	}


}
