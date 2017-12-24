package com.crazyMusic.service;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.crazyMusic.mall.IOrderService;

/**
 * 订单服务实现
 * @author Administrator
 *
 */
@Service("orderService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = IOrderService.class,retries = 5,timeout = 120000)
public class OrderService extends ServiceResult implements IOrderService{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7878337752100213154L;

	@Autowired
	private BaseDao orderDao;
	
	@Autowired
	private IMallService mallService;
	
	private Logger logger = Logger.getLogger(getClass());

	
	/**
	 * 获取订单列表
	 */
	@Override
	@SuppressWarnings("all")
	public ServiceResult getOrderList(JSONObject paramJSON) {
		if(StringUtils.isEmpty(getCurrentUserId(paramJSON))) {
			return getFailResult("用户ID为空！");
		}
		String currentUserId = getCurrentUserId(paramJSON);
		ArrayList<Object> paramList = new ArrayList<>();
		int pageIndex = paramJSON.getIntValue("pageIndex");
		int pageSize = paramJSON.getIntValue("pageSize");
		String status = paramJSON.getString("status");//订单状态
		String querySql = "select tor.id,tor.payment,tor.status,tor.create_date,oi.num,oi.product_id,oi.product_img,oi.product_title,oi.product_attrs "
				+ "from t_order tor left JOIN order_item oi on tor.id = oi.order_id where tor.user_id = ?";
		paramList.add(currentUserId);
		if(StringUtils.isNotEmpty(status) && !status.equals("0")) {
			String[] statusArr = status.split(",");
			querySql += " and " + orderDao.getIn("tor.status", statusArr);
		}
		Integer buyer_rate = paramJSON.getInteger("buyer_rate");//是否评价
		if(buyer_rate != null) {
			querySql += " and tor.buyer_rate = ?";
			paramList.add(buyer_rate);
		}
		int totalCount = orderDao.getCount(querySql,paramList.toArray());
		PageBean pageBean = new PageBean(totalCount, pageIndex, pageSize);
		if(pageIndex != 0 && pageSize != 0) {
			querySql += " limit " + (pageIndex-1)*pageSize + "," + pageSize;
		}
		List<JSONObject> orderList = orderDao.queryForJsonList(querySql, paramList.toArray());
		if(CollectionUtils.isNotEmpty(orderList)) {
			for (JSONObject orderJSON : orderList) {
				String productAttrs = orderJSON.getString("product_attrs");
				if(StringUtils.isNotBlank(productAttrs)) {
					String[] attrArr = productAttrs.split(",");
					List<JSONObject> attrList = orderDao.queryForJsonList("select pv.id,pv.type,pv.name,pv.value from product_attr_val pav "
							+ " left join product_attr pv on pav.product_attr_id = pv.id where"+orderDao.getIn("pav.id",attrArr));
					orderJSON.put("product_attrs",attrList);
				}
			}
		}
		return getSuccessResult(orderList,pageBean);
	}
	
	
	/**
	 * 创建订单
	 * @throws Exception 
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	@SuppressWarnings("all")
	public ServiceResult createOrder(JSONObject paramJSON) throws Exception {
		String userId = getCurrentUserId(paramJSON);
		String productId = paramJSON.getString("productId");
		if(StringUtils.isEmpty(userId) || StringUtils.isEmpty(productId)) {
			logger.error("创建订单失败！传入userId 或者 productId 为空！");
			return getFailResult(Const.SYSTEM_BUSY);
		}
		int payNum = paramJSON.getIntValue("number");//购买数量
		if(payNum == 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		
		String attrIds = paramJSON.getString("attrs");
		String[] attrIdArr = attrIds.split(",");
		//检查库存
		if(attrIdArr != null && attrIdArr.length > 0) {
			JSONObject resultJSON = orderDao.queryForJsonObject("select min(number) as minNum from product_attr_val where " +orderDao.getIn("id",attrIdArr));
			int intValue = resultJSON.getIntValue("minNum");
			if(payNum > intValue) {
				logger.error("下单失败！库存不足！商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
				return getFailResult(Const.SYSTEM_BUSY);
			}
		}
	
		BigDecimal payment = paramJSON.getBigDecimal("payment");//支付金额
		BigDecimal postFee = paramJSON.getBigDecimal("postFee");//邮费
		int pay_status = Const.ORDER_STATE_NOTPAY;//未付款
		String buyer_message = paramJSON.getString("buyerMessage");//买家留言
		String buyer_nick = paramJSON.getString("buyerNick");//买家昵称留言
		int isRate = 0;//是否评价 0 否
		
		String product_title = paramJSON.getString("productTitle");//商品标题
		BigDecimal product_price = paramJSON.getBigDecimal("product_price");//单价
		String product_img = paramJSON.getString("product_img");//商品图片
		
		String receiver_name = paramJSON.getString("receiver_name");//收件人
		String receiver_phone = paramJSON.getString("receiver_phone");//收件人手机
		String receiver_province = paramJSON.getString("receiver_province");//省份
		String receiver_city = paramJSON.getString("receiver_city");//城市
		String receiver_district = paramJSON.getString("receiver_district");//区县
		String receiver_address = paramJSON.getString("receiver_address");//详细地址
		String receiver_code = paramJSON.getString("receiver_code");//邮编
		
		if(StringUtils.isAnyEmpty(receiver_name,receiver_phone,receiver_province,receiver_city,receiver_district,receiver_address)) {
			logger.error("下单失败！收货地址错误 商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
			return getFailResult(Const.SYSTEM_BUSY);
		}
		
		if(payment == null || product_price == null) {
			logger.error("下单失败！金额为空 商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
			return getFailResult(Const.SYSTEM_BUSY);
		}
		
		String orderId = orderDao.generateKey();
		//写入订单表
		String orderInsertSql = "insert into t_order (id,payment,post_fee,status,create_date,user_id,buyer_message,buyer_nick,buyer_rate) "
				+ "values (?,?,?,?,?,?,?,?,?) ";
		int orderResult = orderDao.execute(orderInsertSql,orderId,payment,postFee,pay_status,new Date(),userId,buyer_message,buyer_nick,isRate);
		if(orderResult == 0) {
			return getFailResult(Const.SYSTEM_BUSY);
		}
		
		//写入订单详细表
		String orderItemSql = "insert into order_item (id,product_id,order_id,num,product_title,product_price,product_total_price,product_img,product_attrs) "
				+ "values (?,?,?,?,?,?,?,?,?) ";
		if(orderDao.execute(orderItemSql,orderDao.generateKey(),productId,orderId,payNum,product_title,product_price,payment,product_img,attrIds) == 0) {
			logger.error("下单失败！写入订单详细表 商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
			throw new Exception(Const.SYSTEM_BUSY);
		}
		
		//写入订单物流表
		String shippingSql = "insert into order_shipping (id,receiver_name,receiver_phone,receiver_province,receiver_city,receiver_district,receiver_address"
				+ ",receiver_code,create_date,order_id) "
				+ "values (?,?,?,?,?,?,?,?,?,?)";
		if(orderDao.execute(shippingSql,orderDao.generateKey(),receiver_name,receiver_phone,receiver_province,
				receiver_city,receiver_district,receiver_address,receiver_code,new Date(),orderId) == 0) {
			logger.error("下单失败！写入订单物流失败 商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
			throw new Exception(Const.SYSTEM_BUSY);
		}
		
		int orderType = paramJSON.getIntValue("orderType");//下单类型  0 商城下单  1 购物车下单
		if(orderType == 1) {
			String cardId = paramJSON.getString("cardId");
			JSONObject cardJSON = new JSONObject();
			cardJSON.put("card_ids", cardId);
			if(!mallService.cardDelete(cardJSON)) {
				logger.error("下单失败！购物车删除失败 商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
				throw new Exception(Const.SYSTEM_BUSY);
			}
		}
		//减库存操作
		String decreaseNumSql = "update product_attr_val set number = (number-?) where " + orderDao.getIn("id", attrIdArr);
		if(orderDao.execute(decreaseNumSql,payNum) == 0) {
			logger.error("下单失败！减库存失败 商品id:"+productId+" 用户ID：" + userId + " 购买数量："+payNum);
			throw new Exception(Const.SYSTEM_BUSY);
		}
		JSONObject orderObj = new JSONObject();
		orderObj.put("order_id",orderId);
		return getSuccessResult(orderObj);
	}

	/**
	 * 删除订单
	 */
	@Override
	@Transactional
	@SuppressWarnings("all")
	public ServiceResult deleteOrder(JSONObject paramJSON) throws Exception {
		String userId = getCurrentUserId(paramJSON);
		String orderId = paramJSON.getString("orderId");
		if(StringUtils.isNoneEmpty(userId,orderId)) {
			int execute = orderDao.execute("delete from t_order where user_id = ? and id = ?", userId,orderId);
			if(execute > 0) {
				//加库存
				JSONObject numJson = orderDao.queryForJsonObject("select num,product_attrs from order_item where order_id = ?", orderId);
				if(numJson != null && !numJson.isEmpty()) {
					String product_attrs = numJson.getString("product_attrs");
					if(StringUtils.isNotBlank(product_attrs)) {
						String[] attrArr = product_attrs.split(",");
						orderDao.execute("update product_attr_val set number = number + ? where " + orderDao.getIn("id", attrArr),numJson.getIntValue("num"));
					}
				}
				orderDao.execute("delete from order_item where order_id = ?",orderId);
				orderDao.execute("delete from order_shipping where order_id = ?",orderId);
			}
			return getSuccessResult();
		}
		return getSuccessResult();
	}

	/**
	 * 支付成功后修改订单信息 此方法任何失败都必须抛异常 谨记！
	 */
	@Override
	public boolean successPayOrder(JSONObject jsonParam) throws Exception {
		if(jsonParam == null || jsonParam.isEmpty()) 
			throw new Exception("参数不能为空！");
		if(StringUtils.isEmpty(jsonParam.getString("orderId"))) 
			throw new Exception("订单ID不能为空！");
		if(jsonParam.getIntValue("payType") == 0) 
			throw new Exception("支付类型不能为空！");
		if(StringUtils.isEmpty(jsonParam.getString("pay_seria_id")))
			throw new Exception("支付流水号不能为空！");
		if(orderDao.execute("update t_order set payment_type=?,status=?,update_date=?,payment_time=?,pay_seria_id=? where id = ?",
				jsonParam.getIntValue("payType"),Const.ORDER_STATE_PAY,new Date(),new Date(),jsonParam.getString("pay_seria_id"),jsonParam.getString("orderId")) == 0) {
			throw new Exception("订单支付失败！");
		};
		return true;
	}

	
	/**
	 * 申请退款
	 */
	@Override
	public ServiceResult applyRefund(JSONObject jsonParam) throws Exception {
		String orderId = jsonParam.getString("orderId");
		if(StringUtils.isEmpty(orderId)) {
			return getFailResult("订单ID不能为空！");
		}
		if(orderDao.execute("update t_order set status = ? where id = ?",Const.ORDER_STATE_REFUNDING,orderId) <= 0) {
			return getFailResult("订单修改失败");
		}
		return getSuccessResult();
	}

	/**
	 * 确认收货
	 */
	@Override
	public ServiceResult confirmOrder(JSONObject jsonParam) throws Exception {
		String orderId = jsonParam.getString("orderId");
		if(StringUtils.isEmpty(orderId)) {
			return getFailResult("订单ID不能为空！");
		}
		if(orderDao.execute("update t_order set status = ?,update_date=?,end_time=? where id = ?",Const.ORDER_STATE_COMPLETE,new Date(),new Date(),orderId) <= 0) {
			return getFailResult("确认收货失败");
		}
		return getSuccessResult();
	}
}
