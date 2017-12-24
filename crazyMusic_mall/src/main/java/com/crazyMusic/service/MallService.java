package com.crazyMusic.service;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.commonbean.PageBean;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.dao.BaseDao;
import com.crazyMusic.mall.IMallService;

@Service("mallService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = IMallService.class,retries = 5,timeout = 120000)
public class MallService extends ServiceResult implements IMallService{
	
	private Logger logger = Logger.getLogger(getClass());
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6912645684049813974L;
	@Autowired
	private BaseDao mallDao;
	
	@Override
	public ServiceResult getList(JSONObject jsonParam) throws Exception {
		String where = " where 1 = 1 ";
		List<String> paramList = new ArrayList<>();
		String sql = "select id,name,cost_price,post_fee from product ";
		PageBean pageBean = null;
		if(jsonParam != null) {
			int pageIndex = jsonParam.getIntValue("pageIndex");
			int pageSize = jsonParam.getIntValue("pageSize");
			//商品列表 搜索
			String typeId = jsonParam.getString("typeId"); 
			if(StringUtils.isNotBlank(typeId)) {//类型搜索
				paramList.add(typeId);
				List<JSONObject> childTypeIds = mallDao.queryForJsonList("select id from product_type where parent_id = ?", typeId);
				String in = " and type_id in (?,";
				if(CollectionUtils.isNotEmpty(childTypeIds)) {
					for (JSONObject idJson : childTypeIds) {
						in +=  "?,";
						paramList.add(idJson.getString("id"));
					}
				}
				in = in.substring(0, in.length()-1);
				where += in + ")";
			}
			if(StringUtils.isNotEmpty(jsonParam.getString("searchKey"))) {//搜索关键字
				where += " and name like ? ";
				paramList.add("%"+jsonParam.getString("searchKey")+"%");
			}
			where += " and publish_state = 1 and del_flag = 1 ";
			if(pageIndex != 0 && pageSize != 0) {
				int totalCount = mallDao.getCount(sql + where,paramList.toArray(new String[] {}));
				where += " limit " + (pageIndex-1)*pageSize + "," + pageSize;
				pageBean = new PageBean(totalCount, pageIndex, pageSize);
			}
		}
		List<JSONObject> result = mallDao.queryForJsonList(sql + where,paramList.toArray(new String[] {}));
		if(CollectionUtils.isNotEmpty(result)) {
			for (JSONObject productJSON : result) {
				JSONObject imgJSON = mallDao.queryForJsonObject("select product_img from product_img where product_id = ? and sort = 1", productJSON.getString("id"));
				productJSON.put("product_img", imgJSON==null?null:imgJSON.getString("product_img"));
			}
		}
		return getSuccessResult(result, pageBean);
	}
	
	/**
	 * 商城首页数据 
	 */
	@Override
	public JSONObject indexData(JSONObject jsonParam) throws Exception {
		List<Map<String, Object>> typeDataList = mallDao.getJdbcTemplate().queryForList(" select * from product_type order by sort asc");
		List<Map<String, Object>> productList = mallDao.getJdbcTemplate().queryForList("select p.id,p.name,p.now_price,p.simple_desc,pr.recommend_star,pr.recommend_desc,pr.product_img,pr.sort from product_recommend pr inner join product p on pr.product_id = p.id " + 
				"where pr.benable = 1 and pr.del_flag = 1 and p.del_flag = 1 and p.publish_state = 1 order by pr.sort asc");
		if(CollectionUtils.isNotEmpty(productList)) {
			//拼装价格数据
			for (Map<String, Object> map : productList) {
				String id = map.get("id")+"";
				BigDecimal now_price = (BigDecimal)map.get("now_price");
				BigDecimal lowest_price = now_price;
				BigDecimal higst_price = now_price;
				if(StringUtils.isNotEmpty(id)) {
					List<Map<String, Object>> product_attr_list = mallDao.getJdbcTemplate().
							queryForList("select * from product_attr_val where product_id = ?", id);
					if(CollectionUtils.isNotEmpty(product_attr_list)) {
						for (Map<String, Object> attrMap : product_attr_list) {
							BigDecimal increase_price = (BigDecimal)attrMap.get("increase_price");
							if(increase_price.intValue() <= 0) {
								lowest_price = lowest_price.subtract(increase_price.abs());
							}else {
								higst_price = higst_price.add(increase_price);
							}
						}
						map.put("lowest_price",lowest_price.intValue());
						map.put("higst_price",higst_price.intValue());
					}
				}
			}
		}
		JSONObject dataJSON = new JSONObject();
		dataJSON.put("type_datas", typeDataList);
		dataJSON.put("product_datas", productList);
		return dataJSON;
	}
	
	/**
	 * 商品详情
	 */
	@Override
	public JSONObject productDetail(JSONObject jsonParam) throws Exception {
		String productId = jsonParam.getString("productId");
		JSONObject productData = mallDao.queryForJsonObject("select p.post_fee,p.name,p.id,p.simple_name,p.simple_desc,p.now_price,p.cost_price,pt.type_name,ptg.tag_name,p.html from product p "
				+ "left join product_type pt on pt.id = p.type_id "
				+ "left join product_tag ptg on ptg.id = p.product_tag_id  where p.id = ? and p.publish_state = 1 and p.del_flag = 1", productId);
		//查询图片信息
		List<JSONObject> imgList = mallDao.queryForJsonList("select product_img from product_img where product_id = ? and del_flag = 1 and type = 1 order by sort ",productId);
		productData.put("imgs", imgList);
		//属性列表
		List<JSONObject> attrList = mallDao.queryForJsonList("select pav.product_attr_id,increase_price,number,type,name,value from product_attr_val pav left join product_attr pa on pav.product_attr_id = pa.id where pav.product_id = ?",productId);
		productData.put("attrList", attrList);
		//评论列表
		JSONObject evaluateJSON = mallDao.queryForJsonObject("select content,evaluate_imgs,desc_star,logistical_star,service_star,create_date from product_evaluate where product_id  = ? ORDER BY create_date desc limit 0,1 ",productId);
		productData.put("evaluate", evaluateJSON);
		return productData;
	}
	
	@Override
	public ServiceResult listType(JSONObject jsonParam) throws Exception {
		String parent = jsonParam.getString("typeId");
		String where = " where 1 = 1";
		List<String> paramList = new ArrayList<>();;
		if(StringUtils.isNotEmpty(parent)) {
			where+= " and parent_id = ?";
			paramList.add(parent);
		}
		String sql = "select id,type_name,type_pic from product_type " + where + " order by sort asc";
		List<JSONObject> typeList = mallDao.queryForJsonList(sql,paramList.toArray(new String[] {}));
		return getSuccessResult(typeList);
	}
	
	/**
	 * 加入购物车
	 */
	@Override
	@Transactional
	public boolean joinCard(JSONObject jsonParam) throws Exception {
		String userId = getCurrentUserId(jsonParam);
		String productId = jsonParam.getString("product_id");
		String product_attrs = jsonParam.getString("product_attrs");
		int number = jsonParam.getIntValue("number");
		String product_name = jsonParam.getString("product_name");
		String product_img = jsonParam.getString("product_img");
		BigDecimal payment = jsonParam.getBigDecimal("payment");
		if(StringUtils.isNotEmpty(userId)
				&& StringUtils.isNotEmpty(productId)
				&& StringUtils.isNotEmpty(product_attrs)
				&& number > 0) {
			int result = mallDao.execute("insert into card (id,product_id,user_id,number,product_attr_ids,create_date,product_img,product_name,payment) values (?,?,?,?,?,?,?,?,?)",mallDao.generateKey(),productId,userId
					,number,product_attrs,new Date(),product_img,product_name,payment);
			return result==0?false:true;
			
		}
		return false;
	}

	/**
	 * 购物车列表
	 */
	@Override
	public List<JSONObject> cardList(JSONObject jsonParam) throws Exception {
		String userId = getCurrentUserId(jsonParam);
		if(StringUtils.isNotBlank(userId)) {
			int expireMin = Const.CARD_EXPIRE_TIMEOUT;
			long currentTimeMillis = System.currentTimeMillis();
			mallDao.execute("update card set state = 0 where create_date < ? ", new Date(currentTimeMillis-(expireMin*60*1000)));
			List<JSONObject> cardList = mallDao.queryForJsonList("select id,product_id,number,product_attr_ids,product_img,product_name,payment,state from card where user_id = ?",userId);
			if(CollectionUtils.isNotEmpty(cardList)) {
				for (JSONObject card : cardList) {
					String product_attrs = card.getString("product_attr_ids");
					if(StringUtils.isNotBlank(product_attrs)) {
						String[] attr_ids = product_attrs.split(",");
						List<String> attrList = new ArrayList<>();
						for (String attrId : attr_ids) {
							JSONObject attrVal = mallDao.queryForJsonObject("select value from product_attr where id = ?",attrId);
							attrList.add(attrVal.getString("value"));
						}
						card.put("attrs", attrList);
					}
				}
			}
			return cardList;
		}
		return null;
	}

	/**
	 * 删除购物车
	 */
	@Override
	@Transactional
	public boolean cardDelete(JSONObject jsonParam) throws Exception {
		String card_ids = jsonParam.getString("card_ids");
		if(StringUtils.isNotBlank(card_ids)) {
			String[] cardIdsArr= card_ids.split(",");
			String inSql = "(";
			for (String card_id : cardIdsArr) {
				inSql += "'"+card_id + "',";
			}
			inSql = inSql.substring(0, inSql.length()-1);
			inSql += ")";
			int result = mallDao.execute("delete from card where id in "+inSql);
			return result==0?false:true;
		}
		return false;
	}
	
	/**
	 * 评论新增
	 */
	@Override
	public boolean evaluateAdd(JSONObject jsonParam) throws Exception {
		String userId = getCurrentUserId(jsonParam);
		String productId = jsonParam.getString("product_id");
		String orderId = jsonParam.getString("order_id");
		String imgs = jsonParam.getString("evaluate_imgs");
		String content = jsonParam.getString("content");
		int desc_star = jsonParam.getIntValue("desc_star");//描述星级
		int logistical_star = jsonParam.getIntValue("logistical_star");//物流星级
		int service_star = jsonParam.getIntValue("service_star");//服务星级
		if(StringUtils.isAnyEmpty(userId,productId,orderId)) {
			logger.error("请求参数不足！用户编号："+userId+" 商品ID:"+productId+" 订单ID："+orderId);
			throw new Exception("参数不足");
		}
		if(StringUtils.isEmpty(content)) {
			content = "系统默认好评！";
		}
		int resultCount = mallDao.execute("insert into product_evaluate (id,product_id,order_id,evaluate_imgs,desc_star,content,logistical_star,user_id,create_date,service_star) values "
				+ "(?,?,?,?,?,?,?,?,?,?)",mallDao.generateKey(),productId,orderId,imgs,desc_star,content,logistical_star,userId,new Date(),service_star);
		if(resultCount <= 0) {
			return false;
		}
		return true;
	}
	
	/**
	 * 获取分页评论列表
	 */
	@Override
	public ServiceResult evaluateList(JSONObject jsonParam) throws Exception {
		String productId = jsonParam.getString("productId");
		int pageIndex = jsonParam.getIntValue("pageIndex");
		int pageSize = jsonParam.getIntValue("pageSize");
		String sql = "select content,evaluate_imgs,desc_star,logistical_star,service_star"
				+ ",create_date,u.nick_name,u.head_img from product_evaluate pe LEFT JOIN user u on u.id = pe.user_id where pe.product_id  = ? "
				+ "ORDER BY pe.create_date desc ";
		int totalCount = mallDao.getCount(sql, productId);
		PageBean page = new PageBean(totalCount, pageIndex, pageSize);
		List<JSONObject> evaluateList = mallDao.queryForJsonList( sql + " limit ?,? ", productId,(pageIndex-1)*pageSize,pageSize);
		return getSuccessResult(evaluateList,page);
	}
	
	/**
	 * 收藏添加
	 */
	@Override
	public ServiceResult collectAdd(JSONObject jsonParam) throws Exception {
		String currentUserId = getCurrentUserId(jsonParam);
		int count = mallDao.getCount("select id from product_collect where user_id = ? and product_id = ?", currentUserId,jsonParam.getString("product_id"));
		if(count > 0) {
			return getFailResult("您已收藏过该商品，不能重复收藏");
		}
		int execute = mallDao.execute("insert into product_collect (id,user_id,product_id,create_date) values (?,?,?,?)", 
				mallDao.generateKey(),currentUserId,jsonParam.getString("product_id"),new Date());
		if(execute <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessResult();
	}
	
	/**
	 * 收藏删除
	 */
	@Override
	public ServiceResult collectDel(JSONObject jsonParam) throws Exception {
		int execute = mallDao.execute("delete from product_collect where id = ?",jsonParam.getString("id"));
		if(execute <= 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		return getSuccessResult();
	}

	/**
	 * 收藏列表
	 */
	@Override
	public ServiceResult collectList(JSONObject jsonParam) throws Exception {
		String currentUserId = getCurrentUserId(jsonParam);
		int pageIndex = jsonParam.getIntValue("pageIndex");
		int pageSize = jsonParam.getIntValue("pageSize");
		PageBean pageBean = null;
		String sql = "select * from product_collect where user_id = ?";
		if(pageIndex != 0 && pageSize != 0) {
			int totalCount = mallDao.getCount(sql,currentUserId);
			sql += " limit " + (pageIndex-1)*pageSize + "," + pageSize;
			pageBean = new PageBean(totalCount, pageIndex, pageSize);
		}
		List<JSONObject> collectList = mallDao.queryForJsonList(sql, currentUserId);
		if(CollectionUtils.isNotEmpty(collectList)) {
			for (JSONObject collJson : collectList) {
				String product_id = collJson.getString("product_id");
				JSONObject productObj = mallDao.queryForJsonObject("select id from product where id = ? and publish_state = 1 and del_flag = 1", product_id);
				if(productObj == null || productObj.isEmpty()) {
					collJson.put("state",0);
				}else {
					collJson.put("state", 1);
				}
				String product_img = mallDao.queryForString("select product_img from product_img where product_id = ? order by sort asc limit 1",product_id);
				collJson.put("product_img", product_img);
			}
		}
		return getSuccessResult(collectList,pageBean);
	}
}
