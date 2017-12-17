package com.crazyMusic.pay;
//支付接口

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;

public interface IPayService {
	
	/**
	 * 发起支付
	 * @param paramJSON
	 * @return
	 */
	public ServiceResult wxPrePay(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 微信回调
	 */
	public ServiceResult wxAfterPay(JSONObject paramJSON)throws Exception;
	
	
	/**
	 * 阿里发起支付
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult aliPrePay(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 阿里支付回调
	 */
	public ServiceResult aliAfterPay(JSONObject paramJSON)throws Exception;
}
