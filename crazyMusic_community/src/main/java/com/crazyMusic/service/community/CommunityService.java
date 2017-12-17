package com.crazyMusic.service.community;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.commonbean.PageBean;
import com.crazyMusic.community.ICommunityService;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.dao.BaseDao;

@Service("communityService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = ICommunityService.class,retries = 5,timeout = 120000)
public class CommunityService extends ServiceResult implements ICommunityService{
	
	@Autowired
	private BaseDao baseDao;
	
	/**
	 *  
	 */
	private static final long serialVersionUID = 1350805588667355318L;
	
	/**
	 * 发帖子
	 */
	@Override
	@Transactional
	public ServiceResult createNote(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		String communityId = baseDao.generateKey();
		String content = paramJSON.getString("content");
		String title = paramJSON.getString("title");
		String imgs = paramJSON.getString("img_urls");
		int count = baseDao.execute("insert into community (id,content,user_id,create_date,update_date,title) values (?,?,?,?,?,?)",communityId,content,currentUserId,new Date(),new Date(),title);
		if(count > 0) {
			if(StringUtils.isNotEmpty(imgs)) {
				String[] imgsArr = imgs.split(",");
				if(imgs != null && imgs.length() > 0) {
					for (int i = 0; i < imgsArr.length; i++) {
						baseDao.execute("insert into community_file (id,img_url,sort,create_date,community_id,resource_type) values (?,?,?,?,?,?)",
								baseDao.generateKey(),imgsArr[i],i+1,new Date(),communityId,1);
					}
				}
			}
		}
		return getSuccessResult();
	}
	
	/**
	 * 帖子删除
	 */
	@Override
	@Transactional
	public ServiceResult comunityDel(JSONObject paramJSON) throws Exception {
		String community_id = paramJSON.getString("community_id");
		int execute = baseDao.execute("delete from community where id = ?", community_id);
		if(execute > 0) {
			//删除图片
			baseDao.execute("delete from community_file where community_id = ? ", community_id);
			//删除评论
			baseDao.execute("delete from community_evaluate where community_id = ?", community_id);
			//删除赞
			baseDao.execute("delete from community_perfect where community_id = ?", community_id);
			return getSuccessResult();
		}
		return getFailResult(Const.SYSTEM_BUSY);
	}
	
	/**
	 * 修改帖子
	 */
	@Override
	public ServiceResult communityUpdate(JSONObject paramJSON) throws Exception {
		String community_id = paramJSON.getString("community_id");
		String content = paramJSON.getString("content");
		String title = paramJSON.getString("title");
		String imgs = paramJSON.getString("img_urls");
		int execute = baseDao.execute("update community set content = ?,community_status=?,title=?,update_date=? where id = ?", content,0,title,new Date(),community_id);
		if(execute > 0) {
			baseDao.execute("delete from community_file where community_id = ? ", community_id);
			if(StringUtils.isNotEmpty(imgs)) {
				String[] imgsArr = imgs.split(",");
				if(imgs != null && imgs.length() > 0) {
					for (int i = 0; i < imgsArr.length; i++) {
						baseDao.execute("insert into community_file (id,img_url,sort,create_date,community_id,resource_type) values (?,?,?,?,?,?)",
								baseDao.generateKey(),imgsArr[i],i+1,new Date(),community_id,1);
					}
				}
			}
		}
		return getSuccessResult();
	}
	
	/**
	 * 获取社区帖子列表集合 按最新评论排序
	 */
	/* (non-Javadoc)
	 * @see com.crazyMusic.community.ICommunityService#listCommunitys(com.alibaba.fastjson.JSONObject)
	 */
	@Override
	public ServiceResult listCommunitys(JSONObject paramJSON) throws Exception {
		String currentUserId = getCurrentUserId(paramJSON);
		int pageIndex = paramJSON.getIntValue("pageIndex");
		int pageSize = paramJSON.getIntValue("pageSize");
		String querySql = "select cmi.id,cmi.content,cmi.create_date,cmi.evaluate_count,cmi.perfect_count,u.head_img,u.nick_name "
				+ "from community cmi left join user u on cmi.user_id = u.id where cmi.community_status = 1 order by update_date desc ";
		int totalCount = baseDao.getCount("select id from community where community_status = 1");
		PageBean pageBean = new PageBean(totalCount, pageIndex, pageSize);
		if(pageIndex != 0 && pageSize != 0) {
			querySql += " limit " + (pageIndex-1)*pageSize + "," + pageSize;
		}
		List<JSONObject> communityList = baseDao.queryForJsonList(querySql);
		if(CollectionUtils.isNotEmpty(communityList)) {
			for (JSONObject communityJSON : communityList) {
				List<JSONObject> imgList = baseDao.queryForJsonList("select id,img_url,sort from community_file where resource_type = 1 and file_type = 1 and community_id = ?", communityJSON.getString("id"));
				communityJSON.put("imgList", imgList);
				int count = baseDao.getCount("select id from community_perfect where user_id = ? and community_id = ?",currentUserId,communityJSON.getString("id"));
				if(count > 0) {
					communityJSON.put("is_perfect",true);
				}else {
					communityJSON.put("is_perfect",false);
				}
			}
		}
		return getSuccessResult(communityList,pageBean);
	}
	
	/**
	 * 评论列表
	 */
	@Override
	public ServiceResult communityEvaluateList(JSONObject paramJSON) throws Exception {
		String community_id = paramJSON.getString("community_id");
		int pageIndex = paramJSON.getIntValue("pageIndex");
		int pageSize = paramJSON.getIntValue("pageSize");
		String querySql = "select u.head_img,u.nick_name,ce.id,ce.user_id,ce.content from community_evaluate ce "
				+ "left join user u on ce.user_id = u.id where community_id = ? and (parent_id is null or parent_id = '') order by ce.create_date asc ";
		int totalCount = baseDao.getCount("select id from community_evaluate where community_id = ? ",community_id);
		PageBean pageBean = new PageBean(totalCount, pageIndex, pageSize);
		if(pageIndex != 0 && pageSize != 0) {
			querySql += " limit " + (pageIndex-1)*pageSize + "," + pageSize;
		}
		List<JSONObject> evaluateList = baseDao.queryForJsonList(querySql, community_id);
		if(CollectionUtils.isNotEmpty(evaluateList)) {
			for (JSONObject evaluateJSON : evaluateList) {
				String ids = baseDao.queryForString("select getChildList(?) as ids",evaluateJSON.getString("id"));
				if(StringUtils.isNoneEmpty(ids)) {
					List<JSONObject> evaluateChildList = baseDao.queryForJsonList("select u.head_img,u.nick_name,ce.id,ce.user_id,ce.content,ce.parent_id from community_evaluate ce"
							+ " left join user u on ce.user_id = u.id where " + baseDao.getIn("ce.id", ids.split(","))+" and ce.id != ? order by ce.create_date asc",evaluateJSON.getString("id"));
					evaluateJSON.put("childList",evaluateChildList);
				}
			}
		}
		
		return getSuccessResult(evaluateList,pageBean);
	}
	
	/**
	 * 帖子详情  
	 */
	@Override
	public ServiceResult communityDetail(JSONObject paramJSON) throws Exception {
		String community_id = paramJSON.getString("community_id");
		String currentUserId = getCurrentUserId(paramJSON);
		String querySql = "select cmi.id,cmi.content,cmi.create_date,cmi.evaluate_count,cmi.perfect_count,u.head_img,u.nick_name "
				+ "from community cmi left join user u on cmi.user_id = u.id where cmi.id = ? order by update_date desc ";
		JSONObject communityJSON = baseDao.queryForJsonObject(querySql, community_id);
		if(communityJSON != null && !communityJSON.isEmpty()) {
			List<JSONObject> imgList = baseDao.queryForJsonList("select id,img_url,sort from community_file where resource_type = 1 and file_type = 1 and community_id = ? ", community_id);
			communityJSON.put("imgList", imgList);
			int count = baseDao.getCount("select id from community_perfect where user_id = ? and community_id = ?",currentUserId,communityJSON.getString("id"));
			if(count > 0) {
				communityJSON.put("is_perfect",true);
			}else {
				communityJSON.put("is_perfect",false);
			}
		}
		return getSuccessResult(communityJSON);
	}
	
	/**
	 * 评论新增 包含子评论
	 */
	@Override
	@Transactional
	public ServiceResult communityEvaluateAdd(JSONObject paramJSON) throws Exception {
		String community_id = paramJSON.getString("community_id");
		String evaluateId = baseDao.generateKey();//评论ID
		String currentUserId = getCurrentUserId(paramJSON);//评论人
		String content = paramJSON.getString("content");//评论内容
		String parent_id = paramJSON.getString("parent_id");//上级评论ID
		int execute = baseDao.execute("insert into community_evaluate (id,user_id,community_id,content,parent_id,create_date) values (?,?,?,?,?,?)",evaluateId,currentUserId
				,community_id,content,parent_id,new Date());
		if(execute > 0) {
			int execute2 = baseDao.execute("update community set evaluate_count = evaluate_count + 1,update_date = ? where id = ?",new Date(),community_id);
			if(execute2 > 0) {
				return getSuccessResult();
			}else {
				throw new RuntimeException(Const.SYSTEM_BUSY);
			}
		}
		return getFailResult(Const.SYSTEM_BUSY);
	}
	
	/**
	 * 评论删除
	 */
	@Override
	@Transactional
	public ServiceResult communityEvaluateDel(JSONObject paramJSON) throws Exception {
		String evaluate_id = paramJSON.getString("evaluate_id");//评论id
		String community_id = paramJSON.getString("community_id");
		if(StringUtils.isEmpty(evaluate_id)) {
			return getFailResult("评论ID不能为空！");
		}
		String ids = baseDao.queryForString("select getChildList(?) as ids",evaluate_id);
		if(StringUtils.isNoneEmpty(ids)) {
			int execute = baseDao.execute("delete from community_evaluate where " + baseDao.getIn("id", ids.split(",")));
			if(execute > 0) {
				int execute2 = baseDao.execute("update community set evaluate_count = evaluate_count - ? where id = ? and evaluate_count > ?",execute,community_id,execute);
				if(execute2 > 0) {
					return getSuccessResult();
				}else {
					throw new RuntimeException(Const.SYSTEM_BUSY);
				}
			}
		}
		// TODO Auto-generated method stub
		return getFailResult(Const.SYSTEM_BUSY);
	}
	
	
	@Override
	public ServiceResult updateCommunityUpdate(JSONObject paramJSON) throws Exception {
		String community_id = paramJSON.getString("community_id");
		baseDao.execute("update community set update_date = ? where id = ?", new Date(),community_id);
		return getSuccessResult();
	}
	
	/**
	 * 点赞
	 */
	@Override
	@Transactional
	public ServiceResult perfectCommunity(JSONObject paramJSON) throws Exception {
		String communityId = paramJSON.getString("community_id");
		String currentUserId = getCurrentUserId(paramJSON);
		if(baseDao.getCount("select id from community_perfect where community_id = ? and user_id = ?",communityId,currentUserId) > 0) {//判断是否已经点过赞
			return getSuccessResult();
		};
		int execute = baseDao.execute("insert into community_perfect (id,user_id,community_id,create_date) values (?,?,?,?)", baseDao.generateKey()
				,currentUserId,communityId,new Date());
		if(execute > 0) {
			//帖子点赞数加一
			int execute2 = baseDao.execute("update community set perfect_count = perfect_count + 1 where id = ?",communityId);
			if(execute2 > 0) {
				return getSuccessResult();
			}else {
				throw new RuntimeException(Const.SYSTEM_BUSY);
			}
		}
		return getFailResult(Const.SYSTEM_BUSY);
	}
	
	/**
	 * 取消点赞
	 */
	@Override
	@Transactional
	public ServiceResult cancelPerfectCommunity(JSONObject paramJSON) throws Exception {
		String communityId = paramJSON.getString("community_id");
		String currentUserId = getCurrentUserId(paramJSON);
		if(baseDao.getCount("select id from community_perfect where community_id = ? and user_id = ?",communityId,currentUserId) == 0) {//判断是否已经点过赞
			return getSuccessResult();
		};
		int execute = baseDao.execute("delete from community_perfect where community_id = ? and user_id = ?"
				,communityId,currentUserId);
		if(execute > 0) {
			//帖子点赞数加一
			int execute2 = baseDao.execute("update community set perfect_count = perfect_count - 1 where id = ? and perfect_count > 0",communityId);
			if(execute2 > 0) {
				return getSuccessResult();
			}
		}
		return getFailResult(Const.SYSTEM_BUSY);
	}
	
}
