package com.crazyMusic.common.util;

import java.util.UUID;

/**
 * token 工具类
 * @author Administrator
 *
 */
public class TokenUtil {
	
	
	
	public static String generyToken() {
		return UUID.randomUUID().toString().replaceAll("-","");
	}
}
