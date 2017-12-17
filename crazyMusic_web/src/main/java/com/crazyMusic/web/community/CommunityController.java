package com.crazyMusic.web.community;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.community.ICommunityService;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.web.base.BaseController;

@Controller
@RequestMapping("/community")
public class CommunityController extends BaseController{

	@Autowired
	private ICommunityService communityService;
	
	private static Logger logger = Logger.getLogger(CommunityController.class);
	
	/**
	 * 社区发帖
	 * @param request
	 * @param response
	 */
	@RequestMapping("/communityAdd")
	@ResponseBody
	public void communityAdd(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(StringUtils.isEmpty(paramJSON.getString("content"))) {
				resultJSON = getFailJSON("发帖内容不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.createNote(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 社区修改
	 * @param request
	 * @param response
	 */
	@RequestMapping("/communityUpdate")
	@ResponseBody
	public void communityUpdate(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(!checkParams(paramJSON, "community_id","content")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.communityUpdate(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 帖子删除
	 * @param request
	 * @param response
	 */
	@RequestMapping("/comunityDel")
	@ResponseBody
	public void comunityDel(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(StringUtils.isEmpty(paramJSON.getString("community_id"))) {
				resultJSON = getFailJSON("发帖内容不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.comunityDel(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 社区帖子列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/communityList")
	@ResponseBody
	public void communityList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.listCommunitys(paramJSON);
			resultJSON = serviceToResultList(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 社区帖子评论数据集合
	 * @param request
	 * @param response
	 */
	@RequestMapping("/communityEvaluateList")
	@ResponseBody
	public void communityEvaluateList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(!checkParams(paramJSON, "community_id")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.communityEvaluateList(paramJSON);
			resultJSON = serviceToResultList(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 帖子评论
	 * @param request
	 * @param response
	 */
	@RequestMapping("/evaluateAdd")
	@ResponseBody
	public void evaluateAdd(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(!checkParams(paramJSON, "community_id","content")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.communityEvaluateAdd(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 评论删除
	 * @param request
	 * @param response
	 */
	@RequestMapping("/evaluateDel")
	@ResponseBody
	public void evaluateDel(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(!checkParams(paramJSON, "evaluate_id","community_id")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.communityEvaluateDel(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 点赞
	 * @param request
	 * @param response
	 */
	@RequestMapping("/communityPerfect")
	@ResponseBody
	public void communityPerfect(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(!checkParams(paramJSON, "community_id")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.perfectCommunity(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 取消点赞
	 * @param request
	 * @param response
	 */
	@RequestMapping("/cancelCommunityPerfect")
	@ResponseBody
	public void cancelCommunityPerfect(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if(!checkParams(paramJSON, "community_id")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult result = communityService.cancelPerfectCommunity(paramJSON);
			resultJSON = serviceToResult(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
}
