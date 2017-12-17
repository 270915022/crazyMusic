package com.crazyMusic.commonbean;

import java.math.BigDecimal;

/**
 * z支付bean
 * @author Administrator
 *
 */
public class PayBean {
	
	public String seria_id;//支付流水id
	
	public String orderId;//订单id 
	
	public int type;// 1 余额支付 2 微信支付 3 支付宝支付
	
	public String userId;//用户id
	
	public BigDecimal money;//支付金额
	
	public int useType;//支付用途 1 余额充值  2 商品购买 3 视频购买

	public PayBean(String seria_id,String orderId, int type, String userId, BigDecimal money, int useType) {
		this.orderId = orderId;
		this.seria_id = seria_id;
		this.type = type;
		this.userId = userId;
		this.money = money;
		this.useType = useType;
	}
}
