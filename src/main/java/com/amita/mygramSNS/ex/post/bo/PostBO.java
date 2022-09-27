package com.amita.mygramSNS.ex.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.mygramSNS.ex.common.FileManagerService;
import com.amita.mygramSNS.ex.post.bookmark.bo.BookmarkBO;
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
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	
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
			
			int likeCount = likeBO.likeCount(post.getId());
			boolean isLike = likeBO.isLike(loginUserId, post.getId());
			
			
			List<CommentDetail> commentList = commentBO.getCommentList(post.getId());
			
			boolean isBookmark = bookmarkBO.isBookmark(loginUserId, post.getId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setUser(user);
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			postDetail.setCommentList(commentList);
			postDetail.setBookmark(isBookmark);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	
	public int deletePost(int postId, int userId) {
		
		Post post = postDAO.selectPostByInAndUserId(postId, userId);
		
		if(post == null) {
			return 0;
		}
		
		
		// 게시글과 연결된 파일 삭제
		FileManagerService.removeFile(post.getImagePath());
		
		// 좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
		// 댓글 삭제
		commentBO.deleteComment(postId);
		
		
		
		return postDAO.deletePost(postId);
				
	}
	
	
}
