package com.crazyMusic.util;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

import org.apache.log4j.Logger;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.crazyMusic.constant.Const;

public class MsgSender {
	
	private static final ExecutorService exeService = Executors.newFixedThreadPool(10);
	
	private static final Logger logger = Logger.getLogger(MsgSender.class);
	
	/**
	 * 异步发送请求
	 * @param phone
	 * @param msg
	 * @return
	 */
	public static boolean sendMsgAsync(String phone,String msg,String sign,String tempCode){
		if(StringUtils.isNotEmpty(phone) && !StringUtils.isEmpty(msg)){
			exeService.submit(new Send(phone, msg,sign,tempCode));
		}
		return true;
	}
	
	/**
	 * 同步发送
	 * @param phone
	 * @param msg
	 * @param sign
	 * @param tempCode
	 * @return
	 * @throws Exception
	 */
	public static boolean sendMsg(String phone,String msg,String sign,String tempCode) throws Exception{
		Send send = new Send(phone, msg,sign,tempCode);
		FutureTask<Boolean> fu = new FutureTask<>(send);
		return fu.get();
	}
	
	
	static class Send implements Callable<Boolean>{
		private String phone;
		
		private String msg;
		
		private String sign;
		
		private String tempCode;
		
		public Send(){}
		
		public Send(String phone,String msg,String sign,String tempCode){
			
			this.msg = msg;
			this.phone = phone;
			this.sign = sign;
			this.tempCode = tempCode;
		}
		
		@Override
		public Boolean call() throws Exception {
			try {
				//设置超时时间-可自行调整
				System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
				System.setProperty("sun.net.client.defaultReadTimeout", "10000");
				//初始化ascClient需要的几个参数
				final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
				final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
				//替换成你的AK
				final String accessKeyId = Const.ACCESSKEYID;//你的accessKeyId,参考本文档步骤2
				final String accessKeySecret = Const.ACCESSKEYSECRT;//你的accessKeySecret，参考本文档步骤2
				//初始化ascClient,暂时不支持多region（请勿修改）
				IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
				accessKeySecret);
				DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
				IAcsClient acsClient = new DefaultAcsClient(profile);
				 //组装请求对象
				 SendSmsRequest request = new SendSmsRequest();
				 //使用post提交
				 request.setMethod(MethodType.POST);
				 //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
				 request.setPhoneNumbers(this.phone);
				 //必填:短信签名-可在短信控制台中找到
				 request.setSignName(this.sign);
				 //必填:短信模板-可在短信控制台中找到
				 request.setTemplateCode(this.tempCode);
				 //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
				 //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
				 request.setTemplateParam("{\"name\":\"Tom\", \"code\":\""+this.msg+"\"}");
				 //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
				 //request.setSmsUpExtendCode("90997");
				 //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
				 request.setOutId("yourOutId");
				//请求失败这里会抛ClientException异常
				SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
				if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
					return true;
				//请求成功
				}
				logger.error(sendSmsResponse.getMessage());
					return false;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
			
			}
	}
	
}
