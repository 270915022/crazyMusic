package com.crazyMusic.commonbean;

import java.io.Serializable;
import java.util.Date;

/**
 * 令牌验证
 * @author Administrator
 *
 */
public class Token implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1470346662072051703L;

	private String token;
	
	private User user;
	
	private Date createDate;

	
	public Token(String token, User user) {
		this.token = token;
		this.user = user;
		this.createDate = new Date();
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
