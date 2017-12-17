package com.crazyMusic.commonbean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * 擅长
 * @author hsq
 *
 */
public class Skilled implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8662402414634157582L;

	private String id;
	
	private String name;

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
	
	public static List<Skilled> SkilledsFromList(List<JSONObject> list) {
		if(CollectionUtils.isNotEmpty(list)) {
			ArrayList<Skilled> skds = new ArrayList<>();
			for (JSONObject ski : list) {
				Skilled s = new Skilled();
				s.setId(ski.getString("id"));
				s.setName(ski.getString("name"));
				skds.add(s);
			}
			return skds;
		}
		return null;
	}
}
