package com.crazyMusic.web.base;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.commonbean.PageBean;
import com.crazyMusic.commonbean.User;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.exception.NullCurrentUserException;
import com.crazyMusic.util.RequestUtils;
import com.crazyMusic.util.SerializeUtil;

import redis.clients.jedis.JedisCluster;

public class BaseController {
	
	/**
	 * 成功返回模板JSON
	 * @param jsonObject
	 * @return
	 */
	public JSONObject getSuccessJSON(JSONObject jsonObject){
		JSONObject newJSON = new JSONObject();
		newJSON.put("code", Const.SUCCESS_CODE);
		newJSON.put("msg",Const.SUCCESS_MSG);
		newJSON.put("data", jsonObject==null?new JSONObject():jsonObject);
		return newJSON;
	}
	
	public JSONObject getSuccessJSONKeyVal(String key,Object value) {
		JSONObject successJSON = getSuccessJSON(null);
		JSONObject data = successJSON.getJSONObject("data");
		data.put(key, value);
		return successJSON;
	}
	
	public JSONObject getFailJSON(String msg){
		JSONObject newJSON = new JSONObject();
		newJSON.put("msg",StringUtils.isEmpty(msg)?Const.SUCCESS_MSG:msg);
		newJSON.put("code", Const.FAIL_CODE);
		return newJSON;
	}
	
	public JSONObject putSucMapJSON(Map<String,Object> dataMap){
		JSONObject sucJson = getSuccessJSON(null);
		JSONObject dataJson = (JSONObject) sucJson.get("data");
		dataJson.putAll(dataMap);
		return sucJson;
	}
	
	public JSONObject getSucList(List<Map<String,Object>> dataList){
		JSONObject jsonObj = getSuccessJSON(null);
		jsonObj.put("data", dataList);
		return jsonObj;
	}
	
	public String getCurrentToken(JSONObject paramJSON) {
		return paramJSON.getString(Const.TOKEN);
	}
	
	public JSONObject getSucListJSON(List<JSONObject> dataList){
		JSONObject jsonObj = getSuccessJSON(null);
		jsonObj.put("data", dataList);
		return jsonObj;
	}
	
	public JSONObject getSucListJSON(List<JSONObject> dataList,PageBean pageBean){
		JSONObject jsonObj = getSuccessJSON(null);
		jsonObj.put("data", dataList);
		jsonObj.put("page", pageBean);
		return jsonObj;
	}
	
	public JSONObject getAesJsonParams(HttpServletRequest req) throws IOException{
		return RequestUtils.getAesParams(req);
	}
	
	
	protected User getCurrentUser(JSONObject paramJSON,JedisCluster jedisCluster) {
		String currentUserId = getCurrentUserId(paramJSON);
		if(StringUtils.isEmpty(currentUserId))
			return null;
		byte[] bs = jedisCluster.get(currentUserId.getBytes());
		if(bs == null || bs.length == 0) {
			return null;
		}
		User user = null;
		try {
			user = SerializeUtil.unserialize(bs,User.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 获取当前用户 如果为空抛异常
	 * @return
	 * @throws NullCurrentUserException 
	 */
	protected User getCurrentUserThrowIfNull(JSONObject paramJSON,JedisCluster jedisCluster) throws NullCurrentUserException {
		User currentUser = getCurrentUser(paramJSON, jedisCluster);
		if(currentUser == null) {
			throw new NullCurrentUserException();
		}
		return currentUser;
	}
	
	/**
	 * 获取当前登录用户id
	 * @param paramJSON
	 * @return
	 */
	public String getCurrentUserId(JSONObject paramJSON) {
		return "1";
	}
	
	/**
	 * 获取当前用户登录Id并放入参数中
	 */
	public String getCurrentUserIdAndPut(JSONObject paramJSON) {
		String currentUserId = getCurrentUserId(paramJSON);
		paramJSON.put("userId", currentUserId);
		return currentUserId;
	} 
	
	public JSONObject serviceToResult(ServiceResult result) {
		if(result.isSuccess()) {
			return getSuccessJSON(null);
		}else {
			return getFailJSON(result.msg);
		}
	}
	
	public JSONObject serviceToResultData(ServiceResult result) {
		if(result.isSuccess()) {
			return getSuccessJSON(result.resultJSON);
		}else {
			return getFailJSON(result.msg);
		}
	}
	
	public JSONObject serviceToResultList(ServiceResult result) {
		if(result.isSuccess()) {
			return getSucListJSON(result.resultList,result.pageBean);
		}else {
			return getFailJSON(result.msg);
		}
	}
	
	public boolean checkParams(JSONObject paramJSON,String ...keys) {
		boolean flag = true;
		for (String key : keys) {
			if(StringUtils.isEmpty(paramJSON.getString(key))) {
				flag = false;
				break;
			}
		}
		return flag;
	}
}
