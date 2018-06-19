package com.buy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buy.mapper.CommentMapper;
import com.buy.pojo.Comment;
import com.buy.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentMapper commentMapper;
	@Override
	public List<Comment> getCommentByPid(String pid) {
		List<Comment> comments = commentMapper.selectComments(pid);
		return comments;
	}
	

}
