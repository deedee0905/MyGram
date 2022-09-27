package com.amita.mygramSNS.ex.post.bookmark.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookmarkDAO {
	
	// 북마크 insert
	public int insertBookmark(@Param("userId")int userId, @Param("postId") int postId);
	
	// 북마크 체크여부 판별
	public int selectCheckBookmarkByUserId(@Param("userId") int userId, @Param("postId") int postId);
	
	// 북마크 delete
	public int deleteBookmark(@Param("userId") int userId, @Param("postId") int postId);

}
