package com.amita.mygramSNS.ex.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	// 회원가입 insert DAO
	public int insertSignup(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email
			);
	
	// 회원가입 아이디 중복체크 DAO
	public int selectCountId(@Param("loginId") String loginId);
	
	
}