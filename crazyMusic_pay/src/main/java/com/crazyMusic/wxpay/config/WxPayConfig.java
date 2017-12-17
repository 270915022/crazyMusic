package com.crazyMusic.wxpay.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 微信支付所需的必要参数
 * 理想情况下只需配置此处
 */
@Component
public class WxPayConfig {
	//应用ID
	@Value("${appid}")
	public static String appid = "wx---------------4";
	//商户号
	@Value("${mch_id}")
	public static String mch_id = "1------------2";
	
	/**
	 * 设置地址在微信商户平台，key设置路径：微信商户平台-->账户设置-->API安全-->密钥设置
	 * 密码生成地址：http://www.sexauth.com/ 
	 */
	@Value("${Key}")
	public static String Key = "";
	
	/**
	 * 接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
	 */
	@Value("${notify_url}")
	public static String notify_url = "";
	
	/**
	 * 商品描述交易字段格式根据不同的应用场景按照以下格式：
	 * APP——需传入应用市场上的APP名字-实际商品名称，天天爱消除-游戏充值。
	 */
	@Value("${body}")
	public static String body = "";
	
	
	//客户端ip，固定为此值
	public static String spbill_create_ip = "127.0.0.1";
	
	//支付类型  固定值 APP
	public static String trade_type = "APP";
	
	//固定值 Sign=WXPay
	public static String PACKAGE = "Sign=WXPay";
	
	/**
	 * 微信统一下单接口请求地址   固定值
	 */
	public static String wxUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	
}
