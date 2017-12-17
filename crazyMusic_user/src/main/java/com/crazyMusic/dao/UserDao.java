package com.crazyMusic.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.alibaba.fastjson.JSONObject;

@Repository
public class UserDao extends BaseJdbcDao{
	
	public List<JSONObject> getList(){
		ArrayList<JSONObject> list = new ArrayList<>();
		JSONObject jb = new JSONObject();
		jb.put("name","张三" );
		list.add(jb);
		return list;
	};
}
