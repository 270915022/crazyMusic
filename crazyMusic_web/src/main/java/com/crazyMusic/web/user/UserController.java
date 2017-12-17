package com.crazyMusic.web.user;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.common.util.TokenUtil;
import com.crazyMusic.commonbean.User;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.msg.IMsgService;
import com.crazyMusic.user.IUserService;
import com.crazyMusic.util.RandomUtil;
import com.crazyMusic.util.RequestUtils;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.util.SerializeUtil;
import com.crazyMusic.web.base.BaseController;

import redis.clients.jedis.JedisCluster;

@Controller()
@RequestMapping("/user")
public class UserController extends BaseController{
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IMsgService msgService;
	
	@Autowired
	private JedisCluster jedisCluster;
	
	private Logger logger = Logger.getLogger(UserController.class);
	//找回密码验证码前缀 
	private String FWDCODEPREFIX = "FINDPWDCODE_";
	//注册用户验证码前缀
	private String REGISTCODEPREFIX = "REGISTCODE_";
	
	
	/**
	 * 获取用户技能列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getUserSkillList")
	@ResponseBody
	public void getUserSkillList(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.mySkilledList(paramJson);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 获取所有技能列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/skilledList")
	@ResponseBody
	public void skilledList(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			ServiceResult serviceResult = userService.skilledList(paramJson);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 修改用户技能
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateUserSkilled")
	@ResponseBody
	public void updateUserSkilled(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			if(!checkParams(paramJson, "skilleds")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.updateUserSkilled(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	
	
	/**
	 * 修改用户基本信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateUserInfo")
	@ResponseBody
	public void updateUserInfo(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.updateUserInfo(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 修改用户密码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateUserPwd")
	@ResponseBody
	public void updateUserPwd(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			if(!checkParams(paramJson, "password")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.updateUserPwd(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 添加或修改用户收货地址
	 * @param request
	 * @param response
	 */
	@RequestMapping("/addUpdateUserConfirmAddr")
	@ResponseBody
	public void addUpdateUserConfirmAddr(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			if(!checkParams(paramJson, "name","phone")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.addUpdateUserConfirmAddr(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 获取用户收货地址列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getUserConfirmAddrs")
	@ResponseBody
	public void getUserConfirmAddrs(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.getUserConfirmAddrs(paramJson);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 获取用户默认收货地址
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getUserDefaulAddr")
	@ResponseBody
	public void getUserDefaulAddr(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.getUserDefaulAddr(paramJson);
			resultJSON = serviceToResultData(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 删除用户收货地址
	 * @param request
	 * @param response
	 */
	@RequestMapping("/deleteUserConfirmAddr")
	@ResponseBody
	public void deleteUserConfirmAddr(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			if(!checkParams(paramJson, "region_id")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.deleteUserConfirmAddr(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 设置用户默认收货地址
	 * @param request
	 * @param response
	 */
	@RequestMapping("/setUserConfirmDefaultAddr")
	@ResponseBody
	public void setUserConfirmDefaultAddr(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			if(!checkParams(paramJson, "region_id")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.setUserConfirmDefaultAddr(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 新增和修改用户地址信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateSaveUserRegion")
	@ResponseBody
	public void updateSaveUserRegion(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJson);
			ServiceResult serviceResult = userService.updateSaveUserRegion(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	
	
	/**
	 * 获取找回密码验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findPwdCode")
	@ResponseBody
	public void findPwdCode(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			String phone = paramJson.getString("phone");
			if(!checkParams(paramJson, "phone")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			if(!userService.isExistUserFromPhone(phone)) {
				resultJSON = getFailJSON("手机号暂未注册");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			String code = jedisCluster.get(FWDCODEPREFIX+phone);
			if(StringUtils.isNotEmpty(code)) {//已存在
				resultJSON = getFailJSON("验证码发送过于频繁");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			String newCode = RandomUtil.createSixCode();
			ServiceResult service = msgService.sendCodeMsg(phone, newCode,true);
			if(service.isSuccess()) {
				jedisCluster.set(FWDCODEPREFIX+phone, newCode);
				jedisCluster.expire(FWDCODEPREFIX+phone, Const.codeExpireTime);
				resultJSON = getSuccessJSONKeyVal("code",newCode);
			}else {
				resultJSON = getFailJSON(Const.SYSTEM_BUSY);
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 修改密码通过验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updatePwdByCode")
	@ResponseBody
	public void updatePwdByCode(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			String phone = paramJson.getString("phone");
			if(!checkParams(paramJson, "phone","password","code")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			String code = jedisCluster.get(FWDCODEPREFIX+phone);
			String recieveCode = paramJson.getString("code");
			if(StringUtils.isEmpty(code) || !code.equals(recieveCode)) {//验证失败
				resultJSON = getFailJSON("验证码不正确或已过期");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			ServiceResult serviceResult = userService.updateUserPwd(paramJson);
			resultJSON = serviceToResult(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 获取注册验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/registCode")
	@ResponseBody
	public void registCode(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			String phone = paramJson.getString("phone");
			if(!checkParams(paramJson, "phone")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			if(userService.isExistUserFromPhone(phone)) {
				resultJSON = getFailJSON("该手机号已注册");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			String code = jedisCluster.get(REGISTCODEPREFIX+phone);
			if(StringUtils.isNotEmpty(code)) {//已存在
				resultJSON = getFailJSON("验证码发送过于频繁");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			logger.info("新用户申请手机号注册："+phone);
			String newCode = RandomUtil.createSixCode();
			ServiceResult service = msgService.sendCodeMsg(phone, newCode,true);
			if(service.isSuccess()) {
				jedisCluster.set(REGISTCODEPREFIX+phone, newCode);
				jedisCluster.expire(REGISTCODEPREFIX+phone, Const.codeExpireTime);
				resultJSON = getSuccessJSONKeyVal("code", newCode);
			}else {
				resultJSON = getFailJSON(Const.SYSTEM_BUSY);
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 验证 传入验证码 成功并创建用户
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validCodeAndCreate")
	@ResponseBody
	public void registValidCode(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			String phone = paramJson.getString("phone");
			if(!checkParams(paramJson, "code","phone","password")) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			String recieveCode = paramJson.getString("code");
			String code = jedisCluster.get(REGISTCODEPREFIX+phone);
			if(StringUtils.isEmpty(code) || !code.equals(recieveCode)) {//验证失败
				resultJSON = getFailJSON("验证码不正确或已过期");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			//成功后清除验证码
			jedisCluster.del(REGISTCODEPREFIX+phone);
			//验证成功
			String regist_ip = RequestUtils.getRemoteHost(request);
			paramJson.put("regist_ip", regist_ip);
			ServiceResult serviceResult = userService.registByPhone(paramJson);
			if(serviceResult.isSuccess()) {//注册成功  自动登录
				serviceResult = userService.login(paramJson);
				User user = serviceResult.resultJSON.getObject("user", User.class);
				String tokenId = loginSuccess(user);
				JSONObject userJSON = user.userBasicInfoToMap();
				userJSON.put("token", tokenId);
				serviceResult.resultJSON = userJSON;
			}
			resultJSON = serviceToResultData(serviceResult);
		} catch (Exception e) {
			logger.error(e);
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 登录成功后
	 * @param user
	 * @return
	 */
	private String loginSuccess(User user) {
		logger.info("用户请求登陆,手机号:"+user.getPhone());
		String tokenId = TokenUtil.generyToken();
		//加入redis缓存 
		jedisCluster.set(tokenId.getBytes(),SerializeUtil.serialize(user));
		return tokenId;
	}
	
	/**
	 * 登陆
	 * @param request
	 * @param response
	 */
	@RequestMapping("/login")
	@ResponseBody
	public void login(HttpServletRequest request, HttpServletResponse response){
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJson = getAesJsonParams(request);
			String phone = paramJson.getString("phone");
			String password = paramJson.getString("password");
			if(StringUtils.isEmpty(phone) || StringUtils.isEmpty(password)){
				ResponseUtils.putRSAJsonResponse(response, getFailJSON("手机号或密码不能为空！"));
				return;
			}
			ServiceResult result = userService.login(paramJson);
			if(result.isSuccess()) {
				User user = result.resultJSON.getObject("user", User.class);
				String tokenId = loginSuccess(user);
				JSONObject userJSON = user.userBasicInfoToMap();
				userJSON.put("token", tokenId);
				result.resultJSON = userJSON;
			}
			resultJSON = serviceToResultData(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage()); 
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
}
