package com.amita.mygramSNS.ex.post.model;

import java.util.List;

import com.amita.mygramSNS.ex.post.comment.model.Comment;
import com.amita.mygramSNS.ex.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private int countLike;
	private boolean isLike;
	private List<Comment> commentList;
	
	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

}
