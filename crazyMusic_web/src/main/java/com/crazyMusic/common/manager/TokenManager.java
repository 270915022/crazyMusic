package com.crazyMusic.common.manager;

import java.util.Date;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.catalina.util.MD5Encoder;
import org.apache.commons.lang3.StringUtils;

import com.crazyMusic.commonbean.Token;
import com.crazyMusic.commonbean.User;


public class TokenManager {
	
	private static ConcurrentHashMap<String,Token> tokenMap = new ConcurrentHashMap<>();
	
	/**
	 * 验证并刷新token
	 * @param tokenId
	 * @return
	 */
	public static boolean validAndRefresh(String tokenId) {
		if(StringUtils.isEmpty(tokenId)){
			return false;
		}
		if(tokenMap.contains(tokenId)) {
			return false;
		}
		Token token = tokenMap.get(tokenId);
		if(token.getCreateDate().getTime()+1000*60*30 < System.currentTimeMillis()) {
			return false;
		}else {
			token.setCreateDate(new Date());
			return true;
		}
	}
	
	public static boolean generyTokenAndCache(User user) {
		String token = MD5Encoder.encode(UUID.randomUUID().toString().getBytes());
		Token token2 = new Token(token, user);
		tokenMap.put(token, token2);
		return true;
	}
	
	
}
