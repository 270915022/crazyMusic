package com.crazyMusic.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crazyMusic.constant.Const;
import com.crazyMusic.constant.ServiceResult;
import com.crazyMusic.dao.BaseDao;
import com.crazyMusic.msg.IMsgService;
import com.crazyMusic.util.MsgSender;

@Service("mallService")
@com.alibaba.dubbo.config.annotation.Service(protocol = {"dubbo"},interfaceClass = IMsgService.class,retries = 5,timeout = 120000)
public class MsgService extends ServiceResult implements IMsgService{
	
	private Logger logger = Logger.getLogger(getClass());
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6912645684049813974L;
	@Autowired
	private BaseDao msgDao;
	
	
	/**
	 * 发送短信验证码  模板暂时写死
	 */
	@Override
	public ServiceResult sendCodeMsg(String phone, String code,boolean isAsync) {
		try {
			boolean isSend = true;
			if(isAsync) {
				isSend = MsgSender.sendMsgAsync(phone, code,  Const.sign, Const.tempCode);
			}else {
				isSend = MsgSender.sendMsg(phone, code, Const.sign, Const.tempCode);
			}
			if(isSend) {
				return getSuccessResult();
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		return getFailResult(Const.SYSTEM_BUSY);
	}
}
