package com.amita.mygramSNS.ex.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\남상우\\Desktop\\상아\\spring_project\\mygram\\upload";
	
	public static String saveFile(int userId, MultipartFile file) {
		
		//서버에 저장할 위치를 잡기
		
		// 저장되는 파일의 이름은 사용자id + 현재시간(유닉스타임을 활용할 예정)으로 설정하려고 함
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			// 디렉토리 생성 실패
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			
			String fileFullPath = filePath + file.getOriginalFilename();
			Path path = Paths.get(fileFullPath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 저장 실패
			return null;
		}
		
		
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	

}
