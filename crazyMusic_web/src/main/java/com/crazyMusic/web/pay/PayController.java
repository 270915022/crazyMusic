package com.crazyMusic.web.pay;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.commonbean.PayBean;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.mall.IOrderService;
import com.crazyMusic.pay.IPayService;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.web.base.BaseController;

@Controller
@RequestMapping("/pay")
public class PayController extends BaseController{
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IPayService payService;
	
	private static Logger logger = Logger.getLogger(PayController.class);
	
	/**
	 * 发起预支付
	 * @param request
	 * @param response
	 */
	@RequestMapping("/prePay")
	@ResponseBody
	public void prePayParam(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJSON);
			String money = paramJSON.getString("money");
			if(StringUtils.isEmpty(money)) {
				resultJSON = getFailJSON("发起支付金额不能为空或为0");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			int useType = paramJSON.getIntValue("useType");//支付用途 1 余额充值  2 商品购买 3 视频购买
			if(useType == 0) {
				resultJSON = getFailJSON("发起支付需要支付用途");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			int payType = paramJSON.getIntValue("payType");//支付类型  1 余额支付 2 微信支付 3 支付宝支付
			if(payType == 0) {
				resultJSON = getFailJSON("需要支付类型！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			String orderId = null;
			if(useType == 2) {//商品购买
				orderId = paramJSON.getString("orderId");
				if(StringUtils.isEmpty(orderId)) {
					resultJSON = getFailJSON("订单id为空！");
					ResponseUtils.putRSAJsonResponse(response, resultJSON);
					return;
				}
			}
			if(payType == 2) {//微信支付
				ServiceResult result = payService.wxPrePay(paramJSON);
				resultJSON = serviceToResultData(result);
			}else if(payType == 3) {
				ServiceResult result = payService.aliPrePay(paramJSON);
				resultJSON = serviceToResultData(result);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 成功支付 提供给各类支付回调
	 * @param request
	 * @param response
	 */
	@RequestMapping("/successPay")
	@ResponseBody
	public void successPay(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = new JSONObject();
			paramJSON.put("request", request);
			ServiceResult result = payService.wxAfterPay(paramJSON);
			if(result.code == -1) {
				resultJSON = getFailJSON(Const.SYSTEM_BUSY);
			}else {
				if(result.resultJSON == null || result.resultJSON.isEmpty()) {
					resultJSON = getFailJSON(Const.SYSTEM_BUSY);
				}else {
					if(result.resultJSON.getObject("payBean", PayBean.class) == null) {
						resultJSON = getFailJSON(Const.SYSTEM_BUSY);
					}else {
						PayBean payBean = result.resultJSON.getObject("payBean", PayBean.class);
						if(payBean.useType == 2) {//商品购买
							JSONObject orderJSON = new JSONObject();
							orderJSON.put("orderId",payBean.orderId);
							orderJSON.put("payType", payBean.type);
							orderJSON.put("pay_seria_id", payBean.seria_id);
							if(!orderService.successPayOrder(orderJSON)) {
								throw new Exception("订单已支付，但是订单状态修改失败！请检查。当前支付用户ID：" + payBean.userId+" 用户支付订单："+payBean.orderId + ""
										+ " 用户支付流水号："+payBean.seria_id);
							}else {
								resultJSON = getSuccessJSON(resultJSON);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			resultJSON = getFailJSON("服务器开小差啦！如遇付款后订单失败，请拨打我们的客服电话为您处理，敬请谅解 ");
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
}
