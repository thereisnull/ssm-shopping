package com.buy.controller;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.buy.mapper.CommentMapper;
import com.buy.pojo.Comment;
import com.buy.pojo.NormalResult;
import com.buy.pojo.User;

@Controller
public class CommentController {
	@Autowired
	private CommentMapper commentMapper;
	
	@RequestMapping(value="/addComment",method = RequestMethod.POST)
	@ResponseBody
	public NormalResult addComment(Comment comment,HttpServletRequest request){
		comment.setCommentid(UUID.randomUUID().toString().replace("-", ""));
		comment.setTime(new Date());
		User activeuser = (User) request.getSession().getAttribute("ActiveUser");
		if(activeuser==null){
			return NormalResult.Error("登录后才能评价!");
		}
		comment.setUid(activeuser.getUid());
		int result = commentMapper.insertComment(comment);
		if(result>0){
			return NormalResult.OK("添加成功!");
		}
		return NormalResult.Error("添加失败!");
	}
}
