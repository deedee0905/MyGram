package com.amita.mygramSNS.ex.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amita.mygramSNS.ex.post.bo.PostBO;
import com.amita.mygramSNS.ex.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	//메인 페이지 view (내 개인 프로젝트)
	@GetMapping("/mainStream/view")
	public String mainView( Model model
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPostList(userId);
				
		model.addAttribute("postList", postList);
		
		
		return "post/mainStream";
	}
	
	// New post view (내 개인 프로젝트)
	@GetMapping("/create/view")
	public String creatPostView() {
		return "post/Newpost";
	}
	
	
	
	// 메인 페이지 view (기본 프로젝트)
	@GetMapping("/timeline/view")
	public String timelineView() {
		return "post/timeline";
	}
	
	

}
