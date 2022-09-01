package com.amita.mygramSNS.ex.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	// 로그인 페이지 view
	@GetMapping("/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	// 회원가입 페이지 view
		@GetMapping("/signup/view")
		public String signupView() {
			return "user/signup";
		}
	
	
	
	
}
