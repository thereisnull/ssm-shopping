package com.buy.mapper;

import java.util.List;

import com.buy.pojo.Comment;

public interface CommentMapper {
	
	List<Comment> selectComments(String pid);
	int insertComment(Comment comment);

}
