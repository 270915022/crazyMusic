package com.crazyMusic.web.mall;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.mall.IMallService;
import com.crazyMusic.util.ResponseUtils;
import com.crazyMusic.web.base.BaseController;

@Controller
@RequestMapping("/mall")
public class MallController extends BaseController{

	@Autowired
	private IMallService mallService;
	
	private static Logger logger = Logger.getLogger(MallController.class);
	
	/**
	 * 商城首页初始化数据
	 * @param request
	 * @param response
	 */
	@RequestMapping("/indexData")
	@ResponseBody
	public void indexData(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject indexData = mallService.indexData(null);
			resultJSON = getSuccessJSON(indexData);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	
	
	/**
	 * 商品列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/productList")
	@ResponseBody
	public void productList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			ServiceResult serviceResult = mallService.getList(paramJSON);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
 			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 商品类型列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/productTypeList")
	@ResponseBody
	public void productTypeList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			ServiceResult serviceResult = mallService.listType(paramJSON);
			resultJSON = serviceToResultList(serviceResult);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	
	
	/**
	 * 商品详情
	 * @param request
	 * @param response
	 */
	@RequestMapping("/productDetail")
	@ResponseBody
	public void productDetail(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("productId"))) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			JSONObject productDetailData = mallService.productDetail(paramJSON);
			resultJSON = getSuccessJSON(productDetailData);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 加入购物车
	 * @param request
	 * @param response
	 */
	@RequestMapping("/joinCard")
	@ResponseBody
	public void joinCard(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("product_id"))) {
				resultJSON = getFailJSON("商品ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			boolean isJoin = mallService.joinCard(paramJSON);
			if(isJoin) {
				resultJSON = getSuccessJSON(null);
			}else {
				resultJSON = getFailJSON(Const.SYSTEM_BUSY);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 购物车列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/cardList")
	@ResponseBody
	public void cardList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJSON);
			List<JSONObject> cardList = mallService.cardList(paramJSON);
			resultJSON = getSucListJSON(cardList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 评论列表 分页
	 * @param request
	 * @param response
	 */
	@RequestMapping("/evaluateList")
	@ResponseBody
	public void evaluateList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJSON);
			if (StringUtils.isEmpty(paramJSON.getString("productId"))) {
				resultJSON = getFailJSON("商品ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			resultJSON = serviceToResultList(mallService.evaluateList(paramJSON));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 购物车删除
	 * @param request
	 * @param response
	 */
	@RequestMapping("/cardDelete")
	@ResponseBody
	public void cardDelete(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("card_ids"))) {
				resultJSON = getFailJSON("购物车ID不能为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			boolean isDelete = mallService.cardDelete(paramJSON);
			if(isDelete) {
				resultJSON = getSuccessJSON(null);
			}else {
				resultJSON = getFailJSON(Const.SYSTEM_BUSY);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 加入收藏
	 * @param request
	 * @param response
	 */
	@RequestMapping("/collectAdd")
	@ResponseBody
	public void collectAdd(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("product_id"))) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult service = mallService.collectAdd(paramJSON);
			resultJSON = serviceToResult(service);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 删除商品收藏
	 * @param request
	 * @param response
	 */
	@RequestMapping("/collectDel")
	@ResponseBody
	public void collectDel(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isEmpty(paramJSON.getString("id"))) {
				resultJSON = getFailJSON(Const.PARAM_ERROR);
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return;
			}
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult service = mallService.collectDel(paramJSON);
			resultJSON = serviceToResult(service);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	
	/**
	 * 商品收藏列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/collectList")
	@ResponseBody
	public void collectList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			getCurrentUserIdAndPut(paramJSON);
			ServiceResult service = mallService.collectList(paramJSON);
			resultJSON = serviceToResultList(service);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
	/**
	 * 评价新增
	 * @param request
	 * @param response
	 */
	@RequestMapping("/evaluateAdd")
	@ResponseBody
	public void evaluateAdd(HttpServletRequest request, HttpServletResponse response) {
		JSONObject resultJSON = new JSONObject();
		try {
			JSONObject paramJSON = getAesJsonParams(request);
			if (StringUtils.isAnyEmpty(paramJSON.getString("product_id"),paramJSON.getString("order_id"))) {
				resultJSON = getFailJSON("商品ID为空 或者订单ID为空！");
				ResponseUtils.putRSAJsonResponse(response, resultJSON);
				return ;
			}
			getCurrentUserIdAndPut(paramJSON);
			boolean isSuccess = mallService.evaluateAdd(paramJSON);
			if(isSuccess) {
				resultJSON = getSuccessJSON(null);
			}else {
				resultJSON = getFailJSON(Const.SYSTEM_BUSY);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			resultJSON = getFailJSON(Const.SYSTEM_BUSY);
		}
		ResponseUtils.putRSAJsonResponse(response, resultJSON);
	}
	
}
