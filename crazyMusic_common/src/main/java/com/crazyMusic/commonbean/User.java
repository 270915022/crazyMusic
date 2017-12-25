package com.crazyMusic.commonbean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

/**
 * user
 * @author Administrator
 *
 */
public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5415694221354597217L;

	private String id;
	
	private String userName;//用户名
	
	private String password;//密码
	
	private String phone;//手机号
	
	private Integer status;//1 可用 0 限制用户
	
	private String registIp;//注册IP
	
	private Date registDate;//注册日期
	
	private String loginIp;//登录IP
	
	private Date loginDate;//登录日期
	
	private Integer loginCount;//登录次数
	
	private String roleState;//0 普通用户 1 审核中用户 2 普通老师 5 平台自动生成用户 6平台自动老师
	
	private String registWay;// 0 微信注册  1手机注册  5 平台注册
	
	private String headImg;// 用户头像
	
	private String sign;//个性签名
	
	private String nickName;//昵称
	
	private Integer sex;//性别 1男 0女
	
	private Integer del_falg;//1 未删除  0 删除
	//用户确认收货地址数据
	private List<UserRegion> userRegions = new ArrayList<>();
	//用户擅长
	private List<Skilled> userSkills = new ArrayList<Skilled>();
	
	//用户所在地
	private UserRegion userRegion;
	
	/**
	 * map 转用户
	 * @param userMap
	 * @return
	 */
	public static User jsonToUser(JSONObject userJSON) {
		if(userJSON != null && !userJSON.isEmpty()) {
			User user = new User();
			user.setId(userJSON.getString("id"));
			user.setUserName(userJSON.getString("username"));
			user.setPassword(userJSON.getString("password"));
			user.setPhone(userJSON.getString("phone"));
			user.setStatus(userJSON.getIntValue("status"));
			user.setRegistIp(userJSON.getString("regist_ip"));
			user.setRegistDate(userJSON.getDate("regist_date"));
			user.setLoginIp(userJSON.getString("login_ip"));
			user.setLoginDate(userJSON.getDate("login_date"));
			user.setLoginCount(userJSON.getIntValue("login_count"));
			user.setRoleState(userJSON.getString("role_state"));
			user.setRegistWay(userJSON.getString("regist_way"));
			user.setHeadImg(userJSON.getString("head_img"));
			user.setSign(userJSON.getString("sign"));
			user.setNickName(userJSON.getString("nick_name"));
			user.setSex(userJSON.getInteger("sex"));
			return user;
		}
		return null;
	}
	
	public JSONObject userBasicInfoToMap(){
		JSONObject resultMap = new JSONObject();
		resultMap.put("id", this.getId());
		resultMap.put("phone",this.getPhone());
		resultMap.put("sign", this.getSign());
		resultMap.put("sex", this.getSex());
		resultMap.put("head_img", this.getHeadImg());
		JSONObject regionJson = new JSONObject();
		if(this.userRegion != null) {
			regionJson.put("province", userRegion.getProvince());
			regionJson.put("province_code", userRegion.getProvince_code());
			regionJson.put("city", userRegion.getCity());
			regionJson.put("city_code", userRegion.getCity_code());
			regionJson.put("district", userRegion.getDistrict());
			regionJson.put("district_code", userRegion.getDistrict_code());
		}
		resultMap.put("region", regionJson);
		resultMap.put("roleState", this.getRoleState());
		resultMap.put("skileds", this.getUserSkills());
		return resultMap;
	}
	
	public List<UserRegion> getUserRegions() {
		return userRegions;
	}



	public void setUserRegions(List<UserRegion> userRegions) {
		this.userRegions = userRegions;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRegistIp() {
		return registIp;
	}

	public void setRegistIp(String registIp) {
		this.registIp = registIp;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public String getRoleState() {
		return roleState;
	}

	public void setRoleState(String roleState) {
		this.roleState = roleState;
	}

	public String getRegistWay() {
		return registWay;
	}

	public void setRegistWay(String registWay) {
		this.registWay = registWay;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getDel_falg() {
		return del_falg;
	}

	public void setDel_falg(Integer del_falg) {
		this.del_falg = del_falg;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public UserRegion getUserRegion() {
		return userRegion;
	}

	public void setUserRegion(UserRegion userRegion) {
		this.userRegion = userRegion;
	}

	public List<Skilled> getUserSkills() {
		return userSkills;
	}

	public void setUserSkills(List<Skilled> userSkills) {
		this.userSkills = userSkills;
	}
}	
