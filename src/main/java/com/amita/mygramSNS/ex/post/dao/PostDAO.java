package com.amita.mygramSNS.ex.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.mygramSNS.ex.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			);
	
	public List<Post> selectPostList();
	
	public Post selectPostByInAndUserId(@Param("id") int id, @Param("userId") int userId);
	
	public int deletePost(@Param("postId") int postId);
	
	
}
