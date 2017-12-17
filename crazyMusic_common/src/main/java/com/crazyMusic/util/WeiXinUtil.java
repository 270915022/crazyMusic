package com.crazyMusic.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;

/**
 * 微信工具类
 * @author hsq
 *
 */
public class WeiXinUtil {
	private static Logger logger = LoggerFactory.getLogger(WeiXinUtil.class);
	
	
	public static void main(String[] args) throws Exception {
		getAccessToken("aaa");
	}
	
	
	/**
	 * 获取用户基本信息 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getUserInfo(String code) throws Exception {
		JSONObject jsonParam = getAccessToken(code);
		String token = jsonParam.getString("access_token");
		String openid = jsonParam.getString("openid");
		String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="+token+"&openid="+openid;
		String userInfoStr = HttpUtils.sendGet(userInfoUrl);
		JSONObject rtnJSON = JSONObject.parseObject(userInfoStr);
		if(StringUtils.isEmpty(rtnJSON.getString("errcode")))
			return rtnJSON;
		return null;
	}
	
	
	public static JSONObject getUserInfo(String token,String openId){
		String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="+token+"&openid="+openId;
		String userInfoStr = HttpUtils.sendGet(userInfoUrl);
		JSONObject rtnJSON = JSONObject.parseObject(userInfoStr);
		if(StringUtils.isEmpty(rtnJSON.getString("errcode")))
			return rtnJSON;
		return null;
	}
	
	public static JSONObject getAccessToken(String code) throws Exception {
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+Const.APPID+"&secret="+Const.SECRET+"&code="+code+"&grant_type="+Const.GRANT_TYPE;
        URI uri = URI.create(url);
        HttpClient client = new DefaultHttpClient();
        HttpGet get = new HttpGet(uri);
        HttpResponse response;
        response = client.execute(get);
        if (response.getStatusLine().getStatusCode() == 200) {
            HttpEntity entity = response.getEntity();

            BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent(), "UTF-8"));
            StringBuilder sb = new StringBuilder();

            for (String temp = reader.readLine(); temp != null; temp = reader.readLine()) {
                sb.append(temp);
            }

            JSONObject object = new JSONObject();
            object = JSONObject.parseObject(sb.toString().trim());
            String accessToken = object.getString("access_token");
            if(StringUtils.isEmpty(accessToken))
            	throw new Exception("获取微信 access_token 为空！ 请迅速检查！");
            return object;
        }else{
        	logger.warn("发送access_token请求失败！ 请迅速检查！");
        }
        return null;
    }
}
