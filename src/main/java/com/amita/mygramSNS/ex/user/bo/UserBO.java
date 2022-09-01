package com.amita.mygramSNS.ex.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.mygramSNS.ex.common.EncryptUtils;
import com.amita.mygramSNS.ex.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	// 회원가입 insert BO
	public int addSignup(String loginId, String password, String name, String email) {
		
		//비밀번호 암호화!!
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertSignup(loginId, encryptPassword, name, email);
	}
	
	// 회원가입시 아이디 중복검사 BO
	public boolean isDuplicateId(String loginId) {
		int count = userDAO.selectCountId(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}

}
