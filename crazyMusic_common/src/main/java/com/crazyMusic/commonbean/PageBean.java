package com.crazyMusic.commonbean;

import java.io.Serializable;

/**
 * 分页对象bean
 * @author Administrator
 *
 */
public class PageBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 708485771894384446L;

	public int totalCount;
	
	public int pageIndex;
	
	public int pageSize;
	
	public int totalPage;
	
	public PageBean() {}

	public PageBean(int totalCount, int pageIndex, int pageSize) {
		this.totalCount = totalCount;
		this.pageIndex = pageIndex==0?1:pageIndex;
		this.pageSize = pageSize==0?5:pageSize;
		this.totalPage = (totalCount + this.pageSize -1) / this.pageSize;
	}
}
