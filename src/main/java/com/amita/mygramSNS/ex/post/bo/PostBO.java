package com.amita.mygramSNS.ex.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.mygramSNS.ex.common.FileManagerService;
import com.amita.mygramSNS.ex.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = null;
		if(file != null) { // 저장 성공
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) { // 저장 실패
				return 0;
			}
		}
		return postDAO.insertPost(userId, content, imagePath);
	}

}