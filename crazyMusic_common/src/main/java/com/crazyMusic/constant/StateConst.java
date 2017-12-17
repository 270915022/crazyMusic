package com.crazyMusic.constant;

/**
 * 状态常量
 * @author hsq
 *
 */
public class StateConst {
	
	/**
	 * 登陆注册类型
	 */
	public static final Integer PHONE_LOGREG = 1;//手机注册登陆
	
	public static final Integer WECHAT_LOGREG = 2;//微信注册登录
	
	
	/**
	 * 用户状态
	 */
	public static final Integer NORMALUSER = 0;//普通用户
	
	public static final Integer EXAMINEUSER = 1;//审核中用户
	
	public static final Integer TEACHER = 2;//普通老师
	
	public static final Integer PTAUTOUSER = 5;//平台自动生成用户
	
	public static final Integer PTAUTOTEACHER = 6;//平台自动生成老师
	
	/**
	 * 用户注册方式
	 */
	public static final Integer WEICHAT = 0;//微信注册
	
	public static final Integer PHONE = 1;//手机号注册
	
	public static final Integer PT = 5;//平台注册
	
	/**
	 * 审核状态常量
	 */
	public static final Integer EXAMINING = 0;//审核中
	
	public static final Integer EXAMINEPASS = 1;//审核通过
	
	public static final Integer EXAMINEFAIL = -1;//审核失败
	
	
	/**
	 * 商品图类型
	 */
	public static final Integer MAIN = 1;//商品主图
	
	public static final Integer NOTMAIN = 2;//非主图
	
	
	/**
	 * 商品属性
	 */
	public static final Integer PRODUCT_CLOR = 1;//颜色属性
	
	public static final Integer PRODUCT_SIZE = 2;//尺码属性
	
	
	/**
	 * 系统所有图片类型
	 */
	public static final Integer SYSTEM_PIC_MAIN = 1;//系统首页图片
	
	public static final Integer SYSTEM_PIC_MALL_MAIN = 2;//商城首页轮播图
	
	/**
	 * 购物车状态类型
	 */
	public static final Integer CARD_UNEXPIRE = 1;//未过期
	
	public static final Integer CARD_EXPIRE = 0;//过期
	
}
