package com.crazyMusic.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.user.ICouponService;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.web.base.BaseController;

@Controller()
@RequestMapping("/coupon")
public class CouponController extends BaseController{
	@Autowired
	private ICouponService couponService;
	
	/**
	 * 获取是否有优惠券
	 * @param request
	 * @param response
	 */
	@RequestMapping("/randomGetCoupons")
	@ResponseBody
	public void randomGetCoupons(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = couponService.randomGetCoupons(paramJson);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 获取用户优惠券列表  1 未使用  0 已使用  -1 过期
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getUserCoupons")
	@ResponseBody
	public void getUserCoupons(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = couponService.getUserCoupons(paramJson);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 认领优惠券
	 * @param request
	 * @param response
	 */
	@RequestMapping("/recieveCoupons")
	@ResponseBody
	public void recieveCoupons(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			if(!checkParams(paramJson, "couponId")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			ServiceResult serviceResult = couponService.recieveCoupons(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
}
