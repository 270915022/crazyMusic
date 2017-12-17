package com.crazyMusic.mall;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;

public interface IMallService {
	/**
	 * 获取列表
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult getList(JSONObject jsonParam) throws Exception;
	
	/**
	 * 商城首页数据获取
	 * @return
	 * @throws Exception
	 */
	public JSONObject indexData(JSONObject jsonParam) throws Exception;
	
	/**
	 * 商品详情
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public JSONObject productDetail(JSONObject jsonParam) throws Exception;
	
	/**
	 * 通过条件获取商品类型
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult listType(JSONObject jsonParam) throws Exception;
	
	
	/**
	 * 加入购物车
	 */
	public boolean joinCard(JSONObject jsonParam) throws Exception;
	
	
	/**
	 * 获取购物车列表
	 */
	public List<JSONObject> cardList(JSONObject jsonParam) throws Exception;
	
	/**
	 * 购物车删除
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public boolean cardDelete(JSONObject jsonParam) throws Exception;
	
	
	/**
	 * 评价新增
	 */
	public boolean evaluateAdd(JSONObject jsonParam) throws Exception;
	
	/**
	 * 评论列表 分页
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult evaluateList(JSONObject jsonParam) throws Exception;
	
	/**
	 * 添加商品收藏
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult collectAdd(JSONObject jsonParam) throws Exception;
	
	
	/**
	 * 添加商品收藏
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult collectDel(JSONObject jsonParam) throws Exception;
	
	
	/**
	 * 商品收藏列表
	 * @param jsonParam
	 * @return
	 * @throws Exception
	 */
	public ServiceResult collectList(JSONObject jsonParam) throws Exception;
	
}
