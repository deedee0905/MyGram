package com.amita.mygramSNS.ex.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.mygramSNS.ex.common.FileManagerService;
import com.amita.mygramSNS.ex.post.dao.PostDAO;
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
	
	public List<PostDetail> getPostList(){
		
		// 게시글 하나당 작성자 정보를 조합하는 과정
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			User user = userBO.getUserById(userId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	public int checkLike(int userId, int postId) {
		
		return postDAO.insertLike(userId, postId);
	}

	public int uncheckLike(int userId, int postId) {
		return postDAO.deleteLike(userId, postId);
	}
	
}
