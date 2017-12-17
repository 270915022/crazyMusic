package com.crazyMusic.mall;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;

/**
 * 订单服务
 * @author Administrator
 *
 */
public interface IOrderService {
	/**
	 * 创建订单
	 * @param paramJSON
	 * @return
	 * @throws Exception 
	 */
	public ServiceResult createOrder(JSONObject paramJSON) throws Exception;
	
	/**
	 * 获取订单列表
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult getOrderList(JSONObject paramJSON) throws Exception;
	
	/**
	 * 删除订单
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult deleteOrder(JSONObject paramJSON) throws Exception;
	
	/**
	 * 成功支付订单操作
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public boolean successPayOrder(JSONObject jsonParam) throws Exception;
	
	/**
	 * 申请退款
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult applyRefund(JSONObject jsonParam) throws Exception;
	
	/**
	 * 确认订单
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult confirmOrder(JSONObject jsonParam) throws Exception;
}
