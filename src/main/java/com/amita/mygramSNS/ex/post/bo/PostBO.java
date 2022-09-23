package com.amita.mygramSNS.ex.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.mygramSNS.ex.common.FileManagerService;
import com.amita.mygramSNS.ex.post.comment.bo.CommentBO;
import com.amita.mygramSNS.ex.post.comment.model.CommentDetail;
import com.amita.mygramSNS.ex.post.dao.PostDAO;
import com.amita.mygramSNS.ex.post.like.bo.LikeBO;
import com.amita.mygramSNS.ex.post.model.Post;
import com.amita.mygramSNS.ex.post.model.PostDetail;
import com.amita.mygramSNS.ex.user.bo.UserBO;
import com.amita.mygramSNS.ex.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = null;
		if(file != null) { // 저장 성공
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) { // 저장 실패
				return 0;
			}
		}
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<PostDetail> getPostList(int loginUserId){
		
		// 게시글 하나당 작성자 정보를 조합하는 과정
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			User user = userBO.getUserById(userId);
			
			int likeCount = likeBO.countLike(post.getId());
			boolean isLike = likeBO.isLike(loginUserId, post.getId());
			
			
			List<CommentDetail> commentList = commentBO.getCommentList(post.getId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setUser(user);
			postDetail.setCountLike(likeCount);
			postDetail.setLike(isLike);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	
	
	
}
