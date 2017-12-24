package com.crazyMusic.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.apache.commons.collections.CollectionUtils;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.dao.BaseDao;
import com.crazyMusic.user.ICouponService;
@SuppressWarnings("serial")
@Service("couponService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = ICouponService.class,retries = 5,timeout = 120000)
public class CoupService extends ServiceResult implements ICouponService{
	
	@Autowired
	private BaseDao coupDao;
	/**
	 * 获取系统所有优惠券列表
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Override
	public ServiceResult getCouponList(JSONObject paramJSON) throws Exception {
		return null;
	}

	/**
	 * 获取用户优惠券列表
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Override
	public ServiceResult getUserCoupons(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		List<JSONObject> coupList = coupDao.queryForJsonList("select coupon_id,c.state,name,payment,expire_date,img from user_coupon uc left join coupon c on uc.coupon_id = c.id where uc.user_id = ?", currentUserId);
		if(CollectionUtils.isNotEmpty(coupList)) {
			for (JSONObject coupJson : coupList) {
				if(coupJson.getIntValue("state") == 1) {//未使用
					Date expire_date = coupJson.getDate("expire_date");
					if(System.currentTimeMillis() > expire_date.getTime()) {
						coupJson.put("state", -1);//过期
					}
				}
			}
		}
		return getSuccessResult(coupList);
	}

	/**
	 * 认领优惠券
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public ServiceResult recieveCoupons(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String couponId = paramJSON.getString("couponId");
		int count = coupDao.getCount("select id from user_coupon where coupon_id = ? and user_id = ?",couponId,currentUserId);
		if(count > 0) {
			return getFailResult("您已领取过优惠券，不能重复领取。");
		}
		
		//检查优惠券数量
		int exe = coupDao.execute("update coupon set number = number-1 where id = ? and number > 0",couponId);
		if(exe <= 0) {
			return getFailResult(paramJSON);
		}
		int insertNum = coupDao.execute("insert into user_coupon (id,user_id,coupon_id,create_date,state) values (?,?,?,?,?) ", coupDao.generateKey(),currentUserId,couponId,new Date(),1);
		if(insertNum <= 0) {
			throw new RuntimeException("认领优惠券失败！");
		}
		return getSuccessResult();
	}

	/**
	 * 消费优惠券
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Override
	public ServiceResult comsumeCoupons(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String couponId = paramJSON.getString("couponId");
		int execute = coupDao.execute("update user_coupon set state = 0 where user_id = ? and coupon_id = ? and state = 1",currentUserId,couponId);
		if(execute <= 0) {
			return getFailResult(paramJSON);
		}
		return getSuccessResult();
	}
	
	/**
	 * 获取随机优惠券
	 * @param paramJSON
	 * @return
	 * @throws Exception
	 */
	@Override
	public ServiceResult randomGetCoupons(JSONObject paramJSON) throws Exception {
		List<JSONObject> coupList = coupDao.queryForJsonList("select id,name,payment,chance,number,img from coupon where publish_date<=? and publish_stop_date>=? and number > 0",new Date(),new Date());
		List<JSONObject> needSendCuoups = new ArrayList<JSONObject>();
		if(CollectionUtils.isNotEmpty(coupList)) {
			Random r = new Random();
			for (JSONObject coupJson : coupList) {
				//几率
				int chance = coupJson.getIntValue("chance");
				int num = r.nextInt(100)+1;
				if(num <= chance) {//优惠券命中
					needSendCuoups.add(coupJson);
				}
			}
		}
		if(CollectionUtils.isNotEmpty(needSendCuoups)) {
			Iterator<JSONObject> it = needSendCuoups.iterator();
			while(it.hasNext()){
				if(coupDao.getCount("select id from user_coupon where coupon_id = ?", it.next().getString("id")) > 0) {//已领取
					it.remove();
				};
			}
		}
		return getSuccessResult(needSendCuoups);
	}
}
