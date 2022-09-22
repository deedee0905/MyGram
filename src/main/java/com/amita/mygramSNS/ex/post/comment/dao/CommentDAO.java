package com.amita.mygramSNS.ex.post.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId
			,@Param("postId") int postId
			,@Param("text") String text
			);

}
