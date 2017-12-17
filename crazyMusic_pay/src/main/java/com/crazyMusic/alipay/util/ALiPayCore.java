package com.crazyMusic.alipay.util;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.crazyMusic.alipay.config.ALiPayConfig;


/* *
 *类名：ALiPayCore
 *功能：拼接支付宝参数、验证支付宝异步通知信息
 *详细：固定模块，一般情况下无需修改
 *版本：1.0
 *日期：2017-03-21
 *说明：
 */
public class ALiPayCore {
	
	private static Logger log = Logger.getLogger(ALiPayCore.class);
	
	/**
	 * 拼接支付宝支付必要参数，加签，并返回字符串
	 * @param out_trade_no	传入商户内部订单号，必须唯一；
	 * @param total_fee	所要支付的金额，格式必须为0.00，单位为元。
	 * @return App端调起支付所需要的参数
	 */
	public static String createAliPayStr(String out_trade_no,String total_fee){
		//声明存储待签名字符串的map
		HashMap<String,String> waitSignStr = new HashMap<String, String>();
		
		//公共参数
		waitSignStr.put("app_id", ALiPayConfig.appid);//支付宝分配给开发者的应用ID
		
		waitSignStr.put("method", ALiPayConfig.method);//接口名称
		
		waitSignStr.put("format", "JSON");//仅支持JSON
		
		waitSignStr.put("charset", ALiPayConfig.input_charset);	//商户网站使用的编码格式，固定为UTF-8
		
		waitSignStr.put("sign_type", ALiPayConfig.pay_sign_type);//签名类型，目前仅支持RSA、RSA2。
		
		waitSignStr.put("version", ALiPayConfig.version);//调用的接口版本，固定为：1.0
		
		waitSignStr.put("timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));//发送请求的时间
		
		waitSignStr.put("notify_url", ALiPayConfig.notify_url);//支付宝服务器主动通知商户网站里指定的页面http路径。
		
		//业务参数
		String biz_content = "{\"subject\":\""+ALiPayConfig.subject+"\",\"out_trade_no\":\""+out_trade_no+"\",\"total_amount\":\""+total_fee+"\",\"product_code\":\""+ALiPayConfig.product_code+"\"}";
		waitSignStr.put("biz_content", biz_content);
		
		String sign = "";
		
		try {
			sign = AlipaySignature.rsaSign(waitSignStr, ALiPayConfig.private_key, ALiPayConfig.input_charset);
		} catch (Exception e) {
			log.error("支付宝签名异常，错误信息为：" + e.getMessage());
		}
		
		waitSignStr.put("sign", sign);
		
		//声明一个新的map用于存放将URL进行编码。
		HashMap<String,String> newWaitSign = new HashMap<String, String>();
		
		//循环map
		Set<String> sets = waitSignStr.keySet();
		for (String string : sets) {
			try {
				newWaitSign.put(string,URLEncoder.encode(waitSignStr.get(string),"UTF-8"));
			} catch (Exception e) {
				log.error("*********************拼接支付宝参数进行url编码出错，错误信息为："+e.getMessage()+"**********************");
			}
		}
		//这一步只是为了避嫌，手动在末尾将sign拼了起来
		String urlSign = newWaitSign.get("sign");
		
		newWaitSign.remove("sign");
		
		String newSign = ALiPayCore.createLinkString(newWaitSign) + "&sign=" + urlSign;
		
		return newSign;
	}

    /** 
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     * @param params 需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    public static String createLinkString(Map<String, String> params) {
        List<String> keys = new ArrayList<String>(params.keySet());
        
        Collections.sort(keys);//排序

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr;
    }
    
    
    /**
     * 检测支付宝异步反馈是否真实
     * @param request
     * @return null 验证失败  不为null即成功
     */
    public static Map<String, String> checkAliPayParam(HttpServletRequest request){
    	
    	boolean flag = false;//初始参数
    	
    	Map<String, String> params = GetInfoFromALiPay(request);//获取支付宝POST过来反馈信息
		
		try {
			flag = AlipaySignature.rsaCheckV1(params, ALiPayConfig.ali_public_key, "UTF-8");//支付宝jar包进行验签
		} catch (AlipayApiException e) {
			log.error("验签出错了，错误原因为：" + e.getMessage());
		}
		
		if(flag){
			//验证一些基本参数是否是自己的
			if(ALiPayConfig.partner.equals(params.get("seller_id")) && ALiPayConfig.appid.equals(params.get("app_id"))){
				
				//查看支付宝是否是通知成功
				if("TRADE_FINISHED".equals(params.get("trade_status")) || "TRADE_SUCCESS".equals(params.get("trade_status"))){
					return params;
				}else{
					return null;
				}
			}else{
				return null;
			}
		}else{
			return null;
		}
    }
    
    @SuppressWarnings("unchecked")
	public static Map<String, String> GetInfoFromALiPay(HttpServletRequest request) {
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i]
				                                                                               + ",";
			}
			params.put(name, valueStr);
		}
		return params;
	}
    
}
