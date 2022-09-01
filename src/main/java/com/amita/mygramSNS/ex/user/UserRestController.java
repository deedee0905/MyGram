package com.amita.mygramSNS.ex.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.mygramSNS.ex.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 입력된 정보를 바탕으로 회원가입을 진행하는 기능 api
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			){
		
		int count = userBO.addSignup(loginId, password, name, email);
		
//		성공시	{"result":"success"}
//		실패시	{"result":"fail"}
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 아이디 중복검사 기능 api
	@GetMapping("/signup/duplicate")
	public Map<String, Boolean> isDuplicate(@RequestParam("loginId") String loginId){
		
		boolean isDuplicate = userBO.isDuplicateId(loginId);
//		중복시	{"id_duplicate":true}
//		중복이 아닐 경우	{"id_duplicate":false}
		
		Map<String, Boolean> map = new HashMap<>();
		
		if(isDuplicate) {
//			중복시	{"id_duplicate":true}
			map.put("is_duplicate", true);
		} else {
//			중복이 아닐 경우	{"id_duplicate":false}	
			map.put("is_duplicate", false);
		}
		
		return map;
		
	}
	
	
	// 로그인 기능 수행 api
	@PostMapping("/signin")
	public Map<String, String> singin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest Request
			){
		
	}
	

}
