package com.amita.mygramSNS.ex.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		String uri = request.getRequestURI();
		
		// 로그인 되어있는 경우,
		// 타임라인 화면으로 이동하고
		// 로그아웃 전까지 signup/view, signin/view 페이지 접근 불가
		
		if(userId != null) {
			
			if(uri.startsWith("/user")) {
				response.sendRedirect("/post/mainStream/view");
				return false;
			}
			
		} else {
			
			// 로그인이 안 되어있다면,
			// post로 시작하는 모든 페이지 조회 불가
			
			if(uri.startsWith("/post")) {
				response.sendRedirect("/user/signin/view");
				return false;
			}
		}
		
		return true;
		
		 
		
	}

}
