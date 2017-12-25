package com.crazyMusic.exception;

import com.crazyMusic.constant.ServiceResult;

public class NullCurrentUserException extends Exception implements IExceptionTransfer{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -229463570548518161L;

	public NullCurrentUserException() {
		super(nullCurrentUserMsg);
	};
	
	@Override
	public ServiceResult exceptionToResult() {
		ServiceResult sr = new ServiceResult();
		sr.code = nullCurrentUserCode;
		sr.msg = nullCurrentUserMsg;
		return sr;
	}
	
}
