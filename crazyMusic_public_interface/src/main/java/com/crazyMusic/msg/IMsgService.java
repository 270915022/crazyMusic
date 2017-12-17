package com.crazyMusic.msg;

import com.crazyMusic.constant.ServiceResult;

/**
 * 消息服务接口
 * @author Administrator
 *
 */
public interface IMsgService {
	
	/**
	 * 发送验证消息 
	 * @param phone
	 * @param code
	 * @return
	 */
	public ServiceResult sendCodeMsg(String phone,String code,boolean isAsync);
}
