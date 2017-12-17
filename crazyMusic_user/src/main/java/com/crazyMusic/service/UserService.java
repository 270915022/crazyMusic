package com.crazyMusic.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.commonbean.Skilled;
import com.crazyMusic.commonbean.User;
import com.crazyMusic.commonbean.UserRegion;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.constant.StateConst;
import com.crazyMusic.dao.UserDao;
import com.crazyMusic.user.IUserService;

@SuppressWarnings("serial")
@Service("userService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = IUserService.class,retries = 5,timeout = 120000)
public class UserService extends ServiceResult implements IUserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public ServiceResult login(JSONObject paramJSON) throws Exception {
		JSONObject json = userDao.queryForJsonObject("select * from user where phone = ? and password = ? and status = 1 ", paramJSON.getString("phone"),paramJSON.getString("password"));
		//先做简单的 用户名或密码错误
		if(json == null || json.isEmpty()){
			return getFailResult("用户名或密码错误！");
		}
		User user = User.jsonToUser(json);
		//登陆成功 修改用户最后一次登陆时间
		userDao.getJdbcTemplate().update("update user set login_date = ?,login_count = (login_count + 1) where phone = ? ",new Date(),paramJSON.getString("phone"));
		//获取用户收货地址数据
		List<JSONObject> regionList = userDao.queryForJsonList("select * from user_confirm_addr where user_id = ?",user.getId());
		JSONObject region = userDao.queryForJsonObject("select * from user_region where user_id = ?",user.getId());
		List<UserRegion> regionFromJson = UserRegion.regionFromJson(regionList);
		if(region != null && !region.isEmpty()) {
			List<UserRegion> userRegions = UserRegion.regionFromJson(new ArrayList<JSONObject>(Arrays.asList(region)));
			user.setUserRegion(userRegions.get(0));
		}
		//用户擅长内容
		List<JSONObject> skilleds = userDao.queryForJsonList("select s.* from user_skilled us LEFT JOIN skilled s on us.skilled_id = s.id where us.user_id = ?",user.getId());
		List<Skilled> skills = Skilled.SkilledsFromList(skilleds);
		user.setUserSkills(skills);
		user.setUserRegions(regionFromJson);
		return getSuccessKeyVal("user", user);
	}
	
	/**
	 * 修改用户登陆密码
	 */
	@Override
	public ServiceResult updateUserPwd(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String password = paramJSON.getString("password");
		String phone = paramJSON.getString("phone");
		int result = 0;
		if(StringUtils.isEmpty(phone)) {//通过id修改
			result = userDao.execute("update user set password = ? where id = ?", password,currentUserId);
		}else {
			result = userDao.execute("update user set password = ? where phone = ?", password,phone);
		}
		if(result <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessResult();
	}
	
	@Override
	public ServiceResult registByPhone(JSONObject paramJSON) throws Exception {
		String phone = paramJSON.getString("phone");
		String regist_ip = paramJSON.getString("regist_ip");
		String password = paramJSON.getString("password");
		Date regist_date = new Date();//注册时间
		Integer role_state = StateConst.NORMALUSER;//普通用户注册
		Integer regist_way = StateConst.PHONE;//手机号注册
		String sign = Const.USER_SIGN_DEFAULT;//用户默认签名
		String head_img  = Const.DEFAULT_HEAD_IMG_BOY;
		String nick_name = "帅哥_"+((new Date().getTime()+"").substring(0, 8));
		String id = userDao.generateKey();
		int execute = userDao.execute("insert into user (id,phone,password,regist_ip,regist_date,role_state,regist_way,head_img,sign,nick_name) values (?,?,?,?,?,?,?,?,?,?) ",
				id,phone,password,regist_ip,regist_date,role_state,regist_way,head_img,sign,nick_name);
		if(execute <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessKeyVal("user_id", id);
	}
	
	/**
	 * 验证用户是否存在通过手机号
	 */
	@Override
	public boolean isExistUserFromPhone(String phone) throws Exception {
		JSONObject userJson = userDao.queryForJsonObject("select phone from user where phone = ?",phone);
		if(userJson == null || userJson.isEmpty()) {
			return false;
		}
		return true;
	}
	
	/**
	 * 修改用户基本信息
	 */
	@Override
	@Transactional
	public ServiceResult updateUserInfo(JSONObject paramJson) throws Exception {
		String currentUserId = getCurrentUserId(paramJson);
		if(StringUtils.isEmpty(currentUserId)) {
			return getFailResult("用户编号不能为空！");
		}
		String head_img = paramJson.getString("head_img");
		String sign = paramJson.getString("sign");
		int sex = paramJson.getIntValue("sex");
		String nick_name = paramJson.getString("nick_name");
		
		if(userDao.execute("update user set head_img = ?,sign = ?,nick_name=?,sex=? where id = ?",
				head_img,sign,nick_name,sex,currentUserId) <= 0) {
			throw new RuntimeException("用户修改失败！");
		};
		
		return getSuccessResult();
	}
	
	/**
	 * 修改用户技能爱好
	 */
	@Override
	public ServiceResult updateUserSkilled(JSONObject paramJson) throws Exception {
		String currentUserId = getCurrentUserId(paramJson);
		if(StringUtils.isEmpty(currentUserId)) {
			return getFailResult("用户编号不能为空！");
		}
		userDao.execute("delete from user_skilled where user_id = ?", currentUserId);
		//设置技能爱好
		String skilleds = paramJson.getString("skilleds");
		if(StringUtils.isNotEmpty(skilleds)) {
			String[] skillArr = skilleds.split(",");
			for (String skillId : skillArr) {
				userDao.execute("insert into user_skilled (id,user_id,skilled_id,create_date) values (?,?,?,?) ", 
						userDao.generateKey(),currentUserId,skillId,new Date());
			}
		}
		return getSuccessResult();
	}
	
	/**
	 * 获取所有技能列表
	 */
	@Override
	public ServiceResult skilledList(JSONObject paramJson) throws Exception {
		List<JSONObject> skilledList = userDao.queryForJsonList("select * from skilled where enable = 1 ");
		return getSuccessResult(skilledList);
	}
	
	/**
	 * 新增和修改用户地址信息
	 */
	@Override
	public ServiceResult updateSaveUserRegion(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String province = paramJSON.getString("province");
		String province_code = paramJSON.getString("province_code");
		String city = paramJSON.getString("city");
		String city_code = paramJSON.getString("city_code");
		String district = paramJSON.getString("district");
		String district_code = paramJSON.getString("district_code");
		String region_id = paramJSON.getString("region_id");
		int execute = 0;
		if(StringUtils.isNotEmpty(region_id)) {//修改
			execute = userDao.execute("update user_region set province=?,province_code=?,city=?,city_code=?,district=?,district_code=? where id = ? and user_id = ?", 
					province,province_code,city,city_code,district,district_code,region_id,currentUserId);
		}else {//新增
			execute = userDao.execute("insert into user_region (id,user_id,province,province_code,city,city_code,district,district_code,create_date) values (?,?,?,?,?,?,?,?,?)", 
					userDao.generateKey(),currentUserId,province,province_code,city,city_code,district,district_code,new Date());
		}
		if(execute <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessResult();
	}
	
	/**
	 * 添加用户收货地址
	 */
	@Override
	public ServiceResult addUpdateUserConfirmAddr(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String province = paramJSON.getString("province");
		String province_code = paramJSON.getString("province_code");
		String city = paramJSON.getString("city");
		String city_code = paramJSON.getString("city_code");
		String district = paramJSON.getString("district");
		String district_code = paramJSON.getString("district_code");
		String name = paramJSON.getString("name");
		String phone = paramJSON.getString("phone");
		String region_id = paramJSON.getString("region_id");
		int result = 0;
		if(StringUtils.isEmpty(region_id)) {
			 result = userDao.execute("insert into user_confirm_addr (id,user_id,province,province_code,city,city_code,district,district_code,create_date,name,phone)"
			 		+ " values (?,?,?,?,?,?,?,?,?,?,?)",
					userDao.generateKey(),currentUserId,province,province_code,city,city_code,district,district_code,new Date(),name,phone);
		}else {
			result = userDao.execute("update user_confirm_addr set province=?,province_code=?,city=?,city_code=?,district=?,district_code=?,name=?,phone=? where id = ?", 
					province,province_code,city,city_code,district,district_code,name,phone,region_id);
		}
		if(result <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessResult();
	}
	
	/**
	 * 获取用户收货地址列表
	 */
	@Override
	public ServiceResult getUserConfirmAddrs(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		List<JSONObject> regionListJSON = userDao.queryForJsonList("select * from user_confirm_addr where user_id = ? order by create_date desc",currentUserId);
		return getSuccessResult(regionListJSON);
	}
	
	/**
	 * 获取用户默认收货地址
	 */
	@Override
	public ServiceResult getUserDefaulAddr(JSONObject paramJSON) throws Exception {
		JSONObject defaultRegion = userDao.queryForJsonObject("select * from user_confirm_addr where user_id = ? and is_default = 1",getCurrentUserId(paramJSON));
		return getSuccessResult(defaultRegion);
	}
	
	/**
	 * 删除用户收货地址
	 */
	@Override
	public ServiceResult deleteUserConfirmAddr(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String region_id = paramJSON.getString("region_id");
		int result = userDao.execute("delete from user_confirm_addr where id = ? and user_id = ?",region_id,currentUserId);
		if(result <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessResult();
	}

	/**
	 * 设置默认收货地址
	 */
	@Override
	public ServiceResult setUserConfirmDefaultAddr(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String region_id = paramJSON.getString("region_id");
		userDao.execute("update user_confirm_addr set  is_default = 0 where user_id = ? and is_default = 1", currentUserId);
		userDao.execute("update user_confirm_addr set is_default = 1 where id = ? and user_id = ?", region_id,currentUserId);
		return getSuccessResult();
	}

	@Override
	public ServiceResult getUserById(JSONObject paramJSON) throws Exception {
		return null;
	}
	
	/**
	 * 获取用户技能列表
	 */
	@Override
	public ServiceResult mySkilledList(JSONObject paramJson) throws Exception {
		List<JSONObject> jsonList = userDao.queryForJsonList("select * from user_skilled us "
				+ " left join skilled sk on us.skilled_id = sk.id where us.user_id = ? ",getCurrentUserId(paramJson));
		return getSuccessResult(jsonList);
	}
}
