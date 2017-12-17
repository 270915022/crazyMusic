package com.crazyMusic.community;

import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;

/**
 * 社区服务
 * @author Administrator
 *
 */
public interface ICommunityService {
	
	/**
	 * 发帖子
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult createNote(JSONObject paramJSON) throws Exception;
	
	/**
	 * 帖子删除
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult comunityDel(JSONObject paramJSON) throws Exception;
	
	/**
	 * 帖子修改
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult communityUpdate(JSONObject paramJSON) throws Exception;
	
	/**
	 * 帖子详情 
	 * @param paramJSON
	 * @return
	 */
	public ServiceResult communityDetail(JSONObject paramJSON) throws Exception;
	
	/**
	 * 获取社区帖子列表集合
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult listCommunitys(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 社区帖子评论 包含子评论
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult communityEvaluateAdd(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 社区帖子评论删除
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult communityEvaluateDel(JSONObject paramJSON) throws Exception;
	
	/**
	 * 社区帖子评论列表 含分页
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult communityEvaluateList(JSONObject paramJSON) throws Exception;
	
	/**
	 * 更新帖子最新修改时间 其实包括新增评论更新
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult updateCommunityUpdate(JSONObject paramJSON) throws Exception;
	
	/**
	 * 点赞
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult perfectCommunity(JSONObject paramJSON) throws Exception; 
	
	
	/**
	 * 取消点赞
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult cancelPerfectCommunity(JSONObject paramJSON) throws Exception;
}
