package com.amita.mygramSNS.ex.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
	//GetMapping("/signout")
		public String signout(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			session.removeAttribute("userId");
			session.removeAttribute("userName");
			
//			중복시	{"id_duplicate":true}
//			중복이 아닐 경우	{"id_duplicate":false}
			
			return "redirect:/user/signin/view";
			
		}
	
	
	
	
}
