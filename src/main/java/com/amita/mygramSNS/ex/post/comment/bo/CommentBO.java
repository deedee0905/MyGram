package com.amita.mygramSNS.ex.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.mygramSNS.ex.post.comment.dao.CommentDAO;
import com.amita.mygramSNS.ex.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String text) {
		return commentDAO.insertComment(userId, postId, text);
	}
	
	// 게시글 대응하는 댓글 리스트 가져오는 기능
	public List<Comment> getCommentList(int postId){
		return commentDAO.selectCommentList(postId);
	}

}
