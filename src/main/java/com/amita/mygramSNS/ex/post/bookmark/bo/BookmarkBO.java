package com.amita.mygramSNS.ex.post.bookmark.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.mygramSNS.ex.post.bookmark.dao.BookmarkDAO;

@Service
public class BookmarkBO {
	
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	public int addBookmark(int userId, int postId) {
		return bookmarkDAO.insertBookmark(userId, postId);
		
	}

}
