package com.amita.mygramSNS.ex.post.bookmark.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.mygramSNS.ex.post.bookmark.dao.BookmarkDAO;

@Service
public class BookmarkBO {
	
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	// 북마크 insert api
	public int addBookmark(int userId, int postId) {
		return bookmarkDAO.insertBookmark(userId, postId);
	}
	
	// 로그인한 사용자가 북마크를 했는지 안했는지 판단하는 기능
	public boolean isBookmark(int userId, int postId) {
		int count = bookmarkDAO.selectCheckBookmarkByUserId(userId, postId);
		
		// count == 0이면 북마크 X 상태
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	// 북마크 delete api
	public int uncheckBookmark(int userId, int postId) {
		return bookmarkDAO.deleteBookmark(userId, postId);
	}
	

}
