package com.buy.service;

import java.util.List;

import com.buy.pojo.Comment;

public interface CommentService {
	
	List<Comment> getCommentByPid(String pid);

}
