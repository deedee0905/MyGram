package com.amita.mygramSNS.ex.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.mygramSNS.ex.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId
			,@Param("postId") int postId
			,@Param("text") String text
			);

	public List<Comment> selectCommentList(@Param("postId") int postId);
	
}
