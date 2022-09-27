package com.amita.mygramSNS.ex.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.amita.mygramSNS.ex.common.FileManagerService;
import com.amita.mygramSNS.ex.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	
	// 서버 특정 경로의 파일을 설정한 경로로 외부에서 접근 가능하도록 설정
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	
	// 로그인 상태 유무에 따라 페이지 권한을 처리하는 interceptor 처리
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") // 기본적으로 모든 페이지를 다 한번씩 처리하기
		.excludePathPatterns("/static/**", "/images/**", "/user/signout"); // 단, 예외적으로 처리하지 않는 url 설정하기
		
		
	}
	

}
