package com.amita.mygramSNS.ex.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	//메인 페이지 view
	@GetMapping("/mainStream/view")
	public String mainView() {
		return "post/mainStream";
	}

}
