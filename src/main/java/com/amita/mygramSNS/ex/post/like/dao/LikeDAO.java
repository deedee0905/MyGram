package com.amita.mygramSNS.ex.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public int insertLike(@Param("userId") int userId, @Param("postId") int postId);

	public int deleteLike(@Param("userId") int userId, @Param("postId") int postId);
	
	// 좋아요 개수 체크
	public int selectCountLike(@Param("postId") int postId);
	
	// 특정사용자가 좋아요 했는지 체크
	public int selectCountLikeByUserId(
			@Param("userId") int userId
			, @Param("postId") int postId
			);
	

}
