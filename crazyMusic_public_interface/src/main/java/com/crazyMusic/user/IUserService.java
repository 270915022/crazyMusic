package com.crazyMusic.user;

import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;
public interface IUserService {
	
	/**
	 * 用户登陆   
	 * @param loginKey 登陆key
	 * @param password 密码
	 * @return
	 * @throws Exception
	 */
	public ServiceResult login(JSONObject wxUserJson) throws Exception;
	
	/**
	 * 用户注册通过手机号
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult registByPhone(JSONObject paramJSON) throws Exception;
	
	/**
	 * 判断用户是否已存在
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public boolean isExistUserFromPhone(String phone) throws Exception;
	
	/**
	 * 修改用户名密码
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult updateUserPwd(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 修改用户信息
	 * @param paramJson
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public ServiceResult updateUserInfo(JSONObject paramJson) throws Exception;
	
	/**
	 * 修改用户技能信息
	 * @param paramJson
	 * @return
	 * @throws Exception
	 */
	public ServiceResult updateUserSkilled(JSONObject paramJson) throws Exception;
	
	/**
	 * 获取所有技能信息
	 * @param paramJson
	 * @return
	 * @throws Exception
	 */
	public ServiceResult skilledList(JSONObject paramJson) throws Exception;
	
	/**
	 * 获取用户技能信息
	 * @param paramJson
	 * @return
	 * @throws Exception
	 */
	public ServiceResult mySkilledList(JSONObject paramJson) throws Exception;
	
	/**
	 * 添加用户收货地址
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult addUpdateUserConfirmAddr(JSONObject paramJSON) throws Exception;
	
	/**
	 * 获取用户收货地址列表
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult getUserConfirmAddrs(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 获取用户默认收货地址
	 * @param paramJSON
	 * @return
	 */
	public ServiceResult getUserDefaulAddr(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 删除用户收货地址
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult deleteUserConfirmAddr(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 设置用户默认收货地址
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult setUserConfirmDefaultAddr(JSONObject paramJSON) throws Exception;
	
	
	/**
	 * 修改用户地址
	 */
	public ServiceResult updateSaveUserRegion(JSONObject paramJSON) throws Exception;
	
	/**
	 * 通过用户id获取用户信息
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	public ServiceResult getUserById(JSONObject paramJSON) throws Exception;
	
	
	
	
}
