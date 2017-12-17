package com.crazyMusic.util;

import java.util.UUID;

/**
 * uuid util
 * @author hsq
 *
 */
public class UUIDUtil {
	
	
	/**
	 * 生成主键
	 * @return
	 */
	public synchronized static String generateKey(){
		return  UUID.randomUUID().toString().replaceAll("-", "");
	}
}
