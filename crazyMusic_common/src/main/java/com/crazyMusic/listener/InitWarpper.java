package com.crazyMusic.listener;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.CacheConst;
import com.crazyMusic.constant.Const;
import com.crazyMusic.dao.CommonDao;

/**
 * 初始化config
 * @author Administrator
 *
 */
@Repository
public class InitWarpper {
	
	private static Logger logger = LoggerFactory.getLogger(InitWarpper.class);
	
	@Autowired
	private CommonDao dao;
	
	public boolean initConf() {
		InputStream ins = InitWarpper.class.getClassLoader().getResourceAsStream("config.properties");
		Properties props = new Properties();
		try {
			props.load(ins);
			String aesKey = props.getProperty("aeskey");
			Const.AESKEY = aesKey;
			Const.sign = props.getProperty("sign");
			Const.tempCode = props.getProperty("tempCode");
			Const.ENDPOINT = props.getProperty("endpoint");
			Const.ACCESSKEYID = props.getProperty("accessKeyId");
			Const.ACCESSKEYSECRT = props.getProperty("accessKeySecret");
			Const.BUCKETNAME = props.getProperty("bucketName");
			Const.CARD_EXPIRE_TIMEOUT = Integer.parseInt(props.getProperty("cardExpireTimeOut"));
			Const.LOGISTICAL_NAME = props.getProperty("logistics_name");
			Const.POST_FEE = new BigDecimal(props.getProperty("post_fee"));
			logger.info("--------初始化配置完成");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean initCache() {
		//初始化地区数据
		cacheArea();
		return true;
	}
	
	public void cacheArea(){
		List<JSONObject> areaList = dao.queryForJsonList("select * from region");
		List<JSONObject> proList = new ArrayList<>();
		if(CollectionUtils.isNotEmpty(areaList)) {
			for (JSONObject area : areaList) {
				if("1".equals(area.getString("parent"))) {
					proList.add(area);
				}
			}
			for (JSONObject pro : proList) {
				List<JSONObject> shiquList = new ArrayList<>();
				for (JSONObject area : areaList) {
					if(pro.getString("id").equals(area.getString("parent"))) {
						shiquList.add(area);
					}
				}
				for (JSONObject shiqu : shiquList) {
					List<JSONObject> xianList = new ArrayList<>();
					for (JSONObject area : areaList) {
						if(shiqu.getString("id").equals(area.getString("parent"))) {
							xianList.add(area);
						}
					}
					shiqu.put("list", xianList);
				}
				pro.put("list", shiquList);
			}
		}
		CacheConst.areaCache = proList;
	}
}
