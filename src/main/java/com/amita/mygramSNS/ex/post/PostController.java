package com.amita.mygramSNS.ex.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	//메인 페이지 view (내 개인 프로젝트)
	@GetMapping("/mainStream/view")
	public String mainView() {
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
