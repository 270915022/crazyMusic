package com.crazyMusic.exception;

import com.crazyMusic.constant.ServiceResult;

/**
 * 异常通用接口类
 * @author hsq
 *
 */
public interface IExceptionTransfer extends IExceptionConst{
	
	public ServiceResult exceptionToResult();
	
}
