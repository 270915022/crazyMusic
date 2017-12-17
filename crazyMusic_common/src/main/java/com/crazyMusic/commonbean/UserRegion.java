package com.crazyMusic.commonbean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * 用户地区信息
 * @author Administrator
 *
 */
public class UserRegion  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7305803949626389266L;
	
	private String id;

	private String userId;
	
	private String province;
	
	private String province_code;
	
	private String city;
	
	private String city_code;
	
	private String district;
	
	private String district_code;
	
	private int is_default;//1 表示默认  0 表示非默认
	
	private Date create_date;//创建时间
	
	private String name;//姓名
	
	private String phone;//手机号
	
	public static List<UserRegion> regionFromJson(List<JSONObject> regionList){
		if(CollectionUtils.isNotEmpty(regionList)) {
			UserRegion userRegion = new UserRegion();
			ArrayList<UserRegion> arrayList = new ArrayList<UserRegion>();
			for (JSONObject regionJson : regionList) {
				userRegion.setId(regionJson.getString("id"));
				userRegion.setUserId(regionJson.getString("user_id"));
				userRegion.setProvince(regionJson.getString("province"));
				userRegion.setProvince_code(regionJson.getString("province_code"));
				userRegion.setCity(regionJson.getString("city"));
				userRegion.setCity_code(regionJson.getString("city_code"));
				userRegion.setDistrict(regionJson.getString("district"));
				userRegion.setDistrict_code(regionJson.getString("district_code"));
				userRegion.setIs_default(regionJson.getIntValue("is_default"));
				userRegion.setCreate_date(regionJson.getDate("create_date"));
				userRegion.setName(regionJson.getString("name"));
				userRegion.setPhone(regionJson.getString("phone"));
				arrayList.add(userRegion);
			}
			return arrayList;
		}
		return null;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getProvince_code() {
		return province_code;
	}

	public void setProvince_code(String province_code) {
		this.province_code = province_code;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCity_code() {
		return city_code;
	}

	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDistrict_code() {
		return district_code;
	}

	public void setDistrict_code(String district_code) {
		this.district_code = district_code;
	}

	public int getIs_default() {
		return is_default;
	}

	public void setIs_default(int is_default) {
		this.is_default = is_default;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
