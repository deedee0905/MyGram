package com.amita.mygramSNS.ex.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amita.mygramSNS.ex.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create/posting")
	public Map<String, String> newpost(
				@RequestParam("content") String content
				, @RequestParam("file") MultipartFile file
				, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.addPost(userId, content, file);
		
		// 로그인 된 상태에서 db에 저장된 값 가져오기
		
		
		
		Map<String, String> result = new HashMap<>();
		
//		성공시	{"result":"success"}
//		실패시	{"result":"fail"}
		
		if(count == 1) { // 성공
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
	
		return result;
	}
	
	
	

}
