package com.crazyMusic.constant;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.commonbean.PageBean;

/**
 * service返回结果集
 * @author Administrator
 *
 */
public class ServiceResult implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3677141822252635602L;

	public int code = 0;// 0 操作成功  -1操作 失败 
	
	public String msg = "操作成功";//返回结果信息
	
	public JSONObject resultJSON = new JSONObject();//单个结果
	
	public List<JSONObject> resultList = new ArrayList<JSONObject>();//结果集
	
	public PageBean pageBean;
	
	public ServiceResult getSuccessResult(){
		return new ServiceResult();
	}
	
	public ServiceResult getFailResult(String msg){
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.msg = msg;
		serviceResult.code = -1;
		return serviceResult;
	}
	
	public ServiceResult getFailResult(JSONObject resultJSON){
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.resultJSON = resultJSON;
		serviceResult.code = -1;
		serviceResult.msg = "操作失败";
		return serviceResult;
	}
	
	public ServiceResult getFailResult(int code,String msg){
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.code = code;
		serviceResult.msg = msg;
		return serviceResult;
	}
	
	public ServiceResult getSuccessResult(JSONObject resultJSON) {
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.resultJSON = resultJSON; 
		return serviceResult;
	}
	
	public ServiceResult getSuccessResult(List<JSONObject> resultListJSON) {
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.resultList = resultListJSON;
		return serviceResult;
	}
	
	public ServiceResult getSuccessResult(List<JSONObject> resultListJSON,PageBean pageBean) {
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.resultList = resultListJSON;
		serviceResult.pageBean = pageBean;
		return serviceResult;
	}
	
	public ServiceResult getSuccessResult(JSONObject resultJSON,List<JSONObject> resultListJSON) {
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.resultJSON = resultJSON; 
		serviceResult.resultList = resultListJSON;
		return serviceResult;
	}
	
	public boolean isSuccess() {
		return code==0?true:false;
	}
	
	protected String getCurrentUserId(JSONObject paramJSON) {
		String userId = paramJSON.getString("userId");
		if(StringUtils.isEmpty(userId)) {
			throw new RuntimeException("用户ID不能为空！");
		}
		return userId;
	}
	
	public ServiceResult getSuccessMap(Map<String,?> resultMap) {
		ServiceResult successResult = getSuccessResult();
		successResult.resultJSON.putAll(resultMap);
		return successResult;
	}
	
	public ServiceResult getSuccessKeyVal(String key,Object value) {
		ServiceResult successResult = getSuccessResult();
		successResult.resultJSON.put(key, value);
		return successResult;
	}
}
