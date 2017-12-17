package com.crazyMusic.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.web.base.BaseController;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
	
	@RequestMapping("/getKey")
	@ResponseBody
	public void testDemo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("k", Const.AESKEY);
		JSONObject rtnJSON = putSucMapJSON(dataMap);
		ResponseUtils.putJsonResponse(response,rtnJSON);
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public void login(HttpServletRequest request, HttpServletResponse response){
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			String currentUserId = getCurrentUserId(paramJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
