package com.crazyMusic.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.alipay.util.ALiPayCore;
import com.crazyMusic.commonbean.PayBean;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.dao.BaseDao;
import com.crazyMusic.pay.IPayService;
import com.crazyMusic.wxpay.util.WxPayCore;

@Service("payService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = IPayService.class,retries = 5,timeout = 120000)
public class PayService extends ServiceResult implements IPayService{
	
	//存储需要支付的对象 ，支付后清零
	private static ConcurrentHashMap<String,PayBean> payMap = new ConcurrentHashMap<String,PayBean>();
	
	private static final long serialVersionUID = -4430914574036952251L;
	
	private static Logger log = Logger.getLogger(PayService.class);
	
	@Autowired
	private BaseDao payDao;
	
	/**
	 * 发起微信支付
	 */
	@Override
	public ServiceResult wxPrePay(JSONObject paramJSON) {
		ServiceResult result = cachePay(paramJSON);
		if(!result.isSuccess()) {
			return result;
		}
		String seriaId = result.resultJSON.getString("seriaId");
		PayBean payBean = payMap.get(seriaId);
		SortedMap<Object,Object> wxAppparameters = WxPayCore.createWxPayParam(seriaId,payBean.money.toString());
		if(wxAppparameters == null) {
			return getFailResult("生成微信支付失败！");
		}
		JSONObject dataObj = new JSONObject();
		dataObj.put("wx_params",wxAppparameters);
		return getSuccessResult(dataObj);
	}
	
	/**
	 * 微信支付回调
	 */
	@Override
	@Transactional
	public ServiceResult wxAfterPay(JSONObject paramJSON) throws Exception {
		HttpServletRequest request = (HttpServletRequest) paramJSON.get("request");
		SortedMap<Object, Object> parameters = null;
		parameters = WxPayCore.checkWxPayParam(request);
		if(parameters == null) {
			return getFailResult("支付失败");
		}
		Object object = parameters.get("out_trade_no");
		if(object == null) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		String seriaId = (String) object;//支付流水id
		if(StringUtils.isEmpty(seriaId) || !payMap.containsKey(seriaId)) {
			return getFailResult("支付流水ID为空或不存在！");
		}
		PayBean payBean = payMap.get(seriaId);
		//先做支付流水保存
		if(payDao.execute("insert into pay_seria (id,user_id,money,create_date,pay_type,use_type) values (?,?,?,?,?,?)",
				seriaId,payBean.userId,payBean.money,new Date(),payBean.type,payBean.useType) == 0) {
			log.error("支付流水保存失败！");
			return getFailResult(Const.SYSTEM_BUSY);
		};
		JSONObject resultJSON = new JSONObject();
		resultJSON.put("payBean", payBean);
		return getSuccessResult(resultJSON);
	}

	@Override
	public ServiceResult aliPrePay(JSONObject paramJSON) throws Exception {
		ServiceResult result = cachePay(paramJSON);
		if(!result.isSuccess()) {
			return result;
		}
		String seriaId = result.resultJSON.getString("seriaId");
		PayBean payBean = payMap.get(seriaId);
		/**
		 * @param out_trade_no	String	传入商户内部订单号，必须唯一；
		 * @param total_fee	String	所要支付的金额，格式必须为0.00，单位为元。
		 */
		String orderString = ALiPayCore.createAliPayStr(seriaId,payBean.money.toString());
		/**
		 * 以resultdata对象的形式给App返回
		 */
		HashMap<String,Object> ordermap = new HashMap<String, Object>();

		ordermap.put("orderString", orderString);
		JSONObject rtnJSON = new JSONObject();
		rtnJSON.put("orderString", orderString);
		return getSuccessResult(rtnJSON);
	}

	@Override
	public ServiceResult aliAfterPay(JSONObject paramJSON) throws Exception {
		HttpServletRequest request = (HttpServletRequest) paramJSON.get("request");
		Map<String, String> aliParam = ALiPayCore.checkAliPayParam(request);
		if(aliParam == null) {
			return getFailResult("支付失败！");
		}
		return getSuccessMap(aliParam);
	}
	
	/**
	 * 缓存支付流水
	 * @param paramJSON
	 * @return
	 */
	public ServiceResult cachePay(JSONObject paramJSON) {
		String currentUserId = getCurrentUserId(paramJSON);
		if(StringUtils.isEmpty(currentUserId)) {
			return getFailResult("当前用户不能为空！");
		}
		String money = paramJSON.getString("money");
		if(StringUtils.isEmpty(money)) {
			return getFailResult("发起支付金额不能为空或为0");
		}
		String seriaId = payDao.generateKey();//支付流水
		int useType = paramJSON.getIntValue("useType");//支付用途
		if(useType == 0) {
			return getFailResult("发起支付需要支付用途");
		}
		String orderId = null;
		if(useType == 2) {//商品购买
			orderId = paramJSON.getString("orderId");
			if(StringUtils.isEmpty(orderId)) {
				return getFailResult("订单id为空！");
			}
		}
		DecimalFormat df = new  DecimalFormat("#0.00"); //用于格式化充值金额
		String forMoney = df.format(money);
		payMap.put(seriaId, new PayBean(seriaId, orderId, 1, currentUserId,new BigDecimal(forMoney), useType));//放入缓存
		return getSuccessKeyVal("seriaId", seriaId);
	}
}
