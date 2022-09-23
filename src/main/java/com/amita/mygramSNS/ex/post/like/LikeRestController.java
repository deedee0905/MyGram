package com.amita.mygramSNS.ex.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.mygramSNS.ex.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	// 좋아요 insert API
		@GetMapping("/like/insert")
		public Map<String, String> addLike(
				HttpServletRequest request
				,@RequestParam("postId") int postId
				  ){
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			
			Map<String, String> map = new HashMap<>();
			
			int count = likeBO.checkLike(postId, userId);
			
			if(count == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
			
			return map;
		}
		
		// 좋아요 delete API
		@GetMapping("/like/delete")
		public Map<String, String> removeLike(
				HttpServletRequest request
				,@RequestParam("postId") int postId){
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			
			Map<String, String> map = new HashMap<>();
			int count = likeBO.uncheckLike(userId, postId);
			
			if(count == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
					
			return map;
		}

}
