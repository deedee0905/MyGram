package com.amita.mygramSNS.ex.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.mygramSNS.ex.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int checkLike(int userId, int postId) {
		
		return likeDAO.insertLike(userId, postId);
	}

	public int uncheckLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	// 게시글별 좋아요 개수를 얻는 기능
	public int likeCount(int postId) {
		return likeDAO.selectCountLike(postId);
		
	}
	
	// 특정사용자가 특정 게시글에 좋아요 여부 확인 기능
	public boolean isLike(int userId, int postId) {
		int count = likeDAO.selectCountLikeByUserId(userId, postId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}

	

}
