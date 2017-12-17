package com.crazyMusic.web.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.mall.IOrderService;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.web.base.BaseController;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{
	@Autowired
	private IOrderService orderService;
	
	private static Logger logger = Logger.getLogger(OrderController.class);
	
	/**
	 * 商城下单
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createOrder")
	@ResponseBody
	public void createOrder(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("productId"))) {
				resultJSON = getFailJSON("商品ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = orderService.createOrder(paramJSON);
			resultJSON = serviceToResultData(result);
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 申请退款
	 * @param request
	 * @param response
	 */
	@RequestMapping("/applyRefund")
	@ResponseBody
	public void applyRefund(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("orderId"))) {
				resultJSON = getFailJSON("订单ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = orderService.applyRefund(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 确认收货
	 * @param request
	 * @param response
	 */
	@RequestMapping("/confirmOrder")
	@ResponseBody
	public void confirmOrder(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("orderId"))) {
				resultJSON = getFailJSON("订单ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = orderService.confirmOrder(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 订单删除
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delOrder")
	@ResponseBody
	public void delOrder(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("orderId"))) {
				resultJSON = getFailJSON("商品ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = orderService.deleteOrder(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 订单列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/listOrders")
	@ResponseBody
	public void listOrders(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = orderService.getOrderList(paramJSON);
			resultJSON = serviceToResultList(result);
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
}
