package com.crazyMusic.user;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;

/**
 * 优惠券服务
 * @author Administrator
 *
 */
public interface ICouponService {
	
	/**
	 * 获取系统所有优惠券列表
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult getCouponList(JSONObject paramJSON) throws Exception;
	
	/**
	 * 获取用户优惠券列表
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult getUserCoupons(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 认领优惠券
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult recieveCoupons(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 消费优惠券
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult comsumeCoupons(JSONObject paramJSON) throws Exception;
	
	/**
	 * 获取随机优惠券
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult randomGetCoupons(JSONObject paramJSON) throws Exception;
	
}
