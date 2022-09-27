package com.amita.mygramSNS.ex.post.bookmark.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookmarkDAO {
	
	public int insertBookmark(@Param("userId")int userId, @Param("postId") int postId);

}
