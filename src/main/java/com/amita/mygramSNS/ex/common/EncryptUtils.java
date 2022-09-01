package com.amita.mygramSNS.ex.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	
	// 비밀번호 암호화 기능
	
	public static String md5(String message) {
		
		String resultData = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			for(int i = 0; i < digest.length; i++) {
				resultData += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		
		return resultData;
		
	}

}
